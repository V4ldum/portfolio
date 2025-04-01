import 'dart:async';
import 'dart:io';

import 'package:static_shock/static_shock.dart';

import 'custom/html_prettifier_plugin.dart';
import 'custom/website_domain_setter.dart';

Future<void> main(List<String> arguments) async {
  // Configure the static website generator.
  final staticShock =
      StaticShock()
        // files
        ..pick(DirectoryPicker.parse("demo"))
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
        // custom
        ..plugin(HtmlPrettifierPlugin())
        ..transformPages(WebsiteDomainSetter());

  // Generate the static website.
  await staticShock.generateSite();
}
