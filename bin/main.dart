import 'dart:async';
import 'dart:io';

import 'package:static_shock/static_shock.dart';

import 'custom/html_prettifier_plugin.dart';
import 'custom/portfolio_mocker.dart';

Future<void> main(List<String> arguments) async {
  final isMockMode = arguments.contains('mocks');

  const destinationDirectory = 'build';
  const sourceDirectory = 'source';
  var staticShock = StaticShock(
    destinationDirectoryRelativePath: destinationDirectory,
    sourceDirectoryRelativePath: sourceDirectory,
  );

  // If we pass "mocks" to the build, build the portfolio projects in mock mode instead of the website
  if (!isMockMode) {
    staticShock =
        staticShock
          // files
          ..pick(DirectoryPicker.parse("public"))
          ..pick(FilePicker(FileRelativePath("", "robots", "txt")))
          ..pick(FilePicker(FileRelativePath("", "favicon", "ico")))
          ..pick(FilePicker(FileRelativePath("", "_404", "html")))
          // plugins
          ..plugin(const MarkdownPlugin())
          ..plugin(const JinjaPlugin())
          ..plugin(
            TailwindPlugin(
              tailwindPath: Platform.isWindows ? "./tailwindcss.exe" : "./tailwindcss",
              input: "source/styles/tailwind.css",
              output: "build/styles/tailwind.css",
            ),
          )
          ..plugin(const PrettyUrlsPlugin())
          ..plugin(HtmlPrettifierPlugin());
  }

  staticShock =
      staticShock..plugin(
        PortfolioMocker(gitDirectory: '$destinationDirectory${isMockMode ? '' : '/_git'}', skipBuild: isMockMode),
      );

  // Generate the static website.
  await staticShock.generateSite();
}
