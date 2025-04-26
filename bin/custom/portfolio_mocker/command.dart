import 'dart:io';

import 'package:rust/rust.dart';

abstract class Command {
  late final String _commandString;

  static Option<Command> build(MapEntry<String, List<String>> command) {
    final verb = command.key;
    final parameters = command.value;

    return switch (verb) {
      "DELETE" => DeleteCommand._build(parameters.iter()),
      "REPLACE" => ReplaceCommand._build(parameters.iter()),
      _ => None,
    }.map((c) => c.._commandString = "$verb: $parameters");
  }

  Future<void> run(String workingDirectory);

  @override
  String toString() {
    return _commandString;
  }
}

/// DELETE <filePathToDelete>
class DeleteCommand extends Command {
  DeleteCommand._({required this.filePathToDelete});

  final String filePathToDelete;

  static Option<Command> _build(Iter<String> iterator) {
    final filePathToDelete = iterator.next();

    if (filePathToDelete == null) {
      return None;
    }

    return Some(DeleteCommand._(filePathToDelete: filePathToDelete));
  }

  @override
  Future<void> run(String workingDirectory) async {
    final src = File('$workingDirectory/$filePathToDelete');
    await src.delete();
  }
}

/// REPLACE <where> <from> <to> <what>
// where is a Directory
// what is a regexp that matches the files to modify. If unset it will match anything
class ReplaceCommand extends Command {
  ReplaceCommand._({required this.where, required this.from, required this.to, required this.what});

  final String where;
  final String from;
  final String to;
  final RegExp what;

  static Option<Command> _build(Iter<String> iterator) {
    final where = iterator.next();
    final from = iterator.next();
    final to = iterator.next();
    final what = iterator.next();

    if (where == null || from == null || to == null) {
      return None;
    }

    return Some(ReplaceCommand._(where: where, from: from, to: to, what: RegExp(what ?? '')));
  }

  @override
  Future<void> run(String workingDirectory) async {
    final dir = Directory('$workingDirectory/$where');
    final files = dir.list(recursive: true);
    await for (final file in files) {
      if (file is File && what.hasMatch(file.path)) {
        final content = await file.readAsString();
        final newContent = content.replaceAll(from, to);

        if (content != newContent) {
          await file.writeAsString(newContent);
        }
      }
    }
  }
}
