import 'dart:async';
import 'dart:io';

import 'package:static_shock/static_shock.dart';

import 'custom/html_prettifier_plugin.dart';
import 'custom/portfolio_mocker.dart';
import 'custom/markdown_html_class_adder_transformer.dart';

Future<void> main(List<String> arguments) async {
  final isMockMode = arguments.contains('mocks');
  final isTemplatingMode = !arguments.contains('release') && !isMockMode;

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
          ..pick(const FilePicker(FileRelativePath("", "robots", "txt")))
          ..pick(const FilePicker(FileRelativePath("", "jquery", "min.js")))
          ..pick(const FilePicker(FileRelativePath("", "favicon", "ico")))
          ..pick(const FilePicker(FileRelativePath("", "_404", "html")))
          // plugins
          ..plugin(const MarkdownPlugin())
          ..plugin(const JinjaPlugin())
          ..plugin(
            TailwindPlugin(
              tailwindPath: Platform.isWindows ? "./tailwindcss.exe" : "./tailwindcss",
              input: "source/styles/styles.css",
              output: "build/styles/styles.css",
            ),
          )
          ..plugin(const PrettyUrlsPlugin())
          ..plugin(const HtmlPrettifierPlugin())
          ..finish(
            const MarkdownHtmlClassAdderFinisher(
              classesPerTags: {
                'h1': 'text-4xl! font-semibold mt-8',
                'h2': 'text-3xl! mt-8',
                'h3': 'text-2xl! font-semibold mt-8',
                'h4': 'text-2xl! mt-8',
                'h5': 'text-xl! font-semibold mt-8',
                'h6': 'text-xl! mt-8',
                'a': 'link-primary font-semibold hover:underline',
                'p': 'text-justify my-4',
                'ul': 'list-disc list-inside my-4 pl-4',
                'ol': 'list-decimal list-inside my-4 pl-4',
                'img': 'm-auto',
                'em': 'text-accent',
                'strong': 'text-info',
              },
            ),
          );
  }

  staticShock =
      staticShock..plugin(
        PortfolioMocker(
          gitDirectory: '$destinationDirectory${isMockMode ? '' : '/_git'}',
          skipBuild: isMockMode,
          skipClone: isTemplatingMode,
        ),
      );

  // Generate the static website.
  await staticShock.generateSite();
}
