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
    this.skipClone = false,
  });

  final String mocksSourceDirectory;
  final String gitDirectory;
  final String buildDirectory;
  final bool skipBuild;
  final bool skipClone;

  @override
  String get id => "dev.valdum.portfoliomocker";

  @override
  FutureOr<void> configure(
    StaticShockPipeline pipeline,
    StaticShockPipelineContext context,
    StaticShockCache pluginCache,
  ) {
    pipeline.finish(
      _PortfolioMockerFinisher(
        mocksSourceDirectory: mocksSourceDirectory,
        gitDirectory: gitDirectory,
        buildDirectory: buildDirectory,
        skipBuild: skipBuild,
        skipClone: skipClone,
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
    required this.skipClone,
  });

  static const String _mockDataFilename = "_mock.yaml";

  final String mocksSourceDirectory;
  final String gitDirectory;
  final String buildDirectory;
  final bool skipBuild;
  final bool skipClone;

  @override
  Future<void> execute(StaticShockPipelineContext context) async {
    context.log.info('Generating mocked portfolio');
    Directory mocksDir = Directory(mocksSourceDirectory);

    await for (var file in mocksDir.list()) {
      // We don't care about lonely files in there
      if (file is! Directory) {
        continue;
      }
      final files = (await file.list(recursive: true).toList()).whereType<File>().toList();

      // Only work with folders that have a mock data file
      if (files.iter().any((f) => f.uri.pathSegments.last == _mockDataFilename)) {
        await _mock(files, context);
      } else {
        continue;
      }
    }

    // Cleaning _git directory
    if (!skipBuild && !skipClone) {
      await Directory(gitDirectory).delete(recursive: true);
    }
  }

  Future<void> _mock(Vec<File> files, StaticShockPipelineContext context) async {
    final mockDataFile = files.firstWhere((f) => f.uri.pathSegments.last == _mockDataFilename);
    final mockFiles = files.where((f) => f.uri.pathSegments.last != _mockDataFilename);
    final data = _MockData.fromYaml(await mockDataFile.readAsString(), context);

    final folderName = mockDataFile.uri.pathSegments.reversed.toList()[1];
    final baseDirectory = '$gitDirectory/$folderName';
    final workingDirectory = '$baseDirectory${data.appSubdirectory.isNotEmpty ? "/${data.appSubdirectory}" : ""}';

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

    // Skip clone in templating mode, useful for rebuilds in quick succession when updating the website
    if (skipClone) {
      return;
    }

    // Clone the repository
    await Process.run("git", ["clone", data.git, baseDirectory]);

    if (data.gitCommitHash.isNotEmpty) {
      final headCommitHash =
          (await Process.run("git", ['rev-parse', 'HEAD'], workingDirectory: baseDirectory)).stdout.toString().trim();

      if (headCommitHash != data.gitCommitHash) {
        context.log.warn('$folderName: More recent commits available');
      }

      await Process.run("git", ["checkout", data.gitCommitHash]);
    }

    // Execute custom commands
    for (final command in data.commands) {
      await command.run(workingDirectory);
    }

    // Move mocked files
    for (final file in mockFiles) {
      final relativePath = file.path
          .replaceAll('\\', '/')
          .replaceFirst("${mocksSourceDirectory.replaceAll("\\", "/")}/$folderName/", "");

      await file.copy('$workingDirectory/lib/$relativePath');
    }

    // Build the project and move built files in the correct place
    if (!skipBuild) {
      context.log.detail('Building $folderName');

      for (final buildCommand in data.buildCommands) {
        final command = buildCommand.split(' ').iter();

        await Process.run(command.next()!, command.collectList(), runInShell: true, workingDirectory: workingDirectory);
      }

      await Directory(buildDirectory).create();
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
    required this.appSubdirectory,
    required this.buildCommands,
    required this.buildOutputFolder,
    required this.commands,
  });

  factory _MockData.fromYaml(String yaml, StaticShockPipelineContext context) {
    final data = loadYaml(yaml);

    return _MockData._(
      git: data["git"] ?? "",
      gitCommitHash: data["gitCommitHash"] ?? "",
      appSubdirectory: data["appSubdirectory"] ?? "",
      buildCommands: List.from(data["buildCommands"] ?? []),
      buildOutputFolder: data["buildOutputFolder"] ?? "",
      commands:
          Vec.from(data["commands"] ?? []).iter().filterMapOpt((item) {
            if (item is! YamlMap || item.entries.isEmpty) {
              context.log.err("Invalid command '$item', skipping");
              return None;
            }

            final entry = item.entries.first;
            final command = Command.build(
              MapEntry<String, List<String>>(entry.key, List.from(entry.value.map((item) => item ?? ''))),
            );
            if (command.isNone()) {
              context.log.err("Invalid command '${entry.key}: ${entry.value}', skipping");
            }
            return command;
          }).toList(),
    );
  }

  final String git;
  final String gitCommitHash;
  final String appSubdirectory;
  final List<String> buildCommands;
  final String buildOutputFolder;
  final List<Command> commands;
}
