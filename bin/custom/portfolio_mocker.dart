import 'dart:async';
import 'dart:io';

import 'package:rust/rust.dart';
import 'package:static_shock/static_shock.dart';
import 'package:yaml/yaml.dart';
import 'portfolio_mocker/command.dart';

class PortfolioMocker implements StaticShockPlugin {
  const PortfolioMocker({
    this.mocksSourceDirectory = 'source/mocks',
    this.gitDirectory = 'build/_git',
    this.buildDirectory = 'build/demo',
    this.skipBuild = false,
  });

  final String mocksSourceDirectory;
  final String gitDirectory;
  final String buildDirectory;
  final bool skipBuild;

  @override
  String get id => "dev.valdum.portfoliomocker";

  @override
  FutureOr<void> configure(
    StaticShockPipeline pipeline,
    StaticShockPipelineContext context,
    StaticShockCache pluginCache,
  ) {
    // TODO cache per directory (ex: bingo déjà build on cache)
    pipeline.finish(
      _PortfolioMockerFinisher(
        mocksSourceDirectory: mocksSourceDirectory,
        gitDirectory: gitDirectory,
        buildDirectory: buildDirectory,
        skipBuild: skipBuild,
      ),
    );
  }
}

class _PortfolioMockerFinisher implements Finisher {
  const _PortfolioMockerFinisher({
    required this.mocksSourceDirectory,
    required this.gitDirectory,
    required this.buildDirectory,
    required this.skipBuild,
  });

  static const String _mockDataFilename = "_mock.yaml";

  final String mocksSourceDirectory;
  final String gitDirectory;
  final String buildDirectory;
  final bool skipBuild;

  @override
  Future<void> execute(StaticShockPipelineContext context) async {
    context.log.info('Generating mocked portfolio');
    Directory mocksDir = Directory(mocksSourceDirectory);

    await for (var file in mocksDir.list()) {
      // We don't care about lonely files in there
      if (file is! Directory) {
        continue;
      }
      final files = (await file.list().toList()).whereType<File>().toList();

      // Only work with folders that have a mock data file
      if (files.iter().any((f) => f.uri.pathSegments.last == _mockDataFilename)) {
        await _mock(files, context);
      } else {
        continue;
      }
    }

    // TODO mettre en cache les git et les demo/build
    // Cleaning _git directory
    if (!skipBuild) {
      await Directory(gitDirectory).delete(recursive: true);
    }
  }

  Future<void> _mock(Vec<File> files, StaticShockPipelineContext context) async {
    final mockDataFile = files.firstWhere((f) => f.uri.pathSegments.last == _mockDataFilename);
    final mockFiles = files.where((f) => f.uri.pathSegments.last != _mockDataFilename);
    final data = _MockData.fromYaml(await mockDataFile.readAsString(), context);

    final folderName = mockDataFile.uri.pathSegments.reversed.toList()[1];
    final workingDirectory = '$gitDirectory/$folderName';

    context.log.detail('Mocking $folderName');

    if (data.git.isEmpty) {
      context.log.err('Missing Git URL, skipping');
      return;
    }
    if (data.buildCommands.isEmpty) {
      context.log.err('Missing build commands, skipping');
      return;
    }
    if (data.buildOutputFolder.isEmpty) {
      context.log.err('Missing build folder, skipping');
      return;
    }

    // Clone the repository
    await Process.run("git", ["clone", data.git, workingDirectory]);

    if (data.gitCommitHash.isNotEmpty) {
      final headCommitHash =
          (await Process.run("git", [
            'rev-parse',
            'HEAD',
          ], workingDirectory: workingDirectory)).stdout.toString().trim();

      if (headCommitHash != data.gitCommitHash) {
        context.log.warn('More recent commits available');
      }

      await Process.run("git", ["checkout", data.gitCommitHash]);
    }

    // Execute custom commands
    for (final command in data.commands) {
      await command.run(workingDirectory);
    }

    // Move mocked files
    for (final file in mockFiles) {
      await file.copy('$workingDirectory/lib/${file.uri.pathSegments.last}');
    }

    // Build the project and move built files in the correct place
    if (!skipBuild) {
      context.log.detail('Building $folderName');

      for (final buildCommand in data.buildCommands) {
        final command = buildCommand.split(' ').iter();

        await Process.run(command.next()!, command.collectList(), runInShell: true, workingDirectory: workingDirectory);
      }

      await Process.run('cp', [
        '-r',
        '$gitDirectory/$folderName/${data.buildOutputFolder}',
        '$buildDirectory/$folderName',
      ]);
    }
  }
}

class _MockData {
  _MockData._({
    required this.git,
    required this.gitCommitHash,
    required this.buildCommands,
    required this.buildOutputFolder,
    required this.commands,
  });

  factory _MockData.fromYaml(String yaml, StaticShockPipelineContext context) {
    final data = loadYaml(yaml);

    return _MockData._(
      git: data["git"] ?? "",
      gitCommitHash: data["gitCommitHash"] ?? "",
      buildCommands: List.from(data["buildCommands"] ?? []),
      buildOutputFolder: data["buildOutputFolder"] ?? "",
      commands:
          Vec.from(data["commands"] ?? []).iter().filterMapOpt((item) {
            if (item is! String) {
              return None;
            }

            final command = Command.build(item);
            if (command.isNone()) {
              context.log.err("Invalid command '$item', skipping");
            }
            return command;
          }).toList(),
    );
  }

  final String git;
  final String gitCommitHash;
  final List<String> buildCommands;
  final String buildOutputFolder;
  final List<Command> commands;
}
