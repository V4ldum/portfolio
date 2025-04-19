import 'package:html/parser.dart' as html;

import 'package:static_shock/static_shock.dart';

class MarkdownHtmlClassAdderFinisher implements Finisher {
  const MarkdownHtmlClassAdderFinisher({this.markdownSectionId = 'markdown', this.classesPerTags = const {}});

  final String markdownSectionId;
  final Map<String, String> classesPerTags;

  @override
  void execute(StaticShockPipelineContext context) {
    for (final page in context.pagesIndex.pages) {
      if (page.sourcePath.directories.contains('_includes') ||
          page.destinationPath?.extension != "html" ||
          page.destinationContent == null) {
        continue;
      }

      final fileContent = page.destinationContent ?? page.sourceContent;
      final doc = html.parse(fileContent);
      final article = doc.querySelector('article#$markdownSectionId');

      if (article == null) {
        continue;
      }

      for (final entry in classesPerTags.entries) {
        final tag = entry.key;
        final classes = entry.value.split(' ');

        if (classes.isEmpty) {
          continue;
        }

        final tagsToUpdate = article.querySelectorAll(tag);
        for (final tag in tagsToUpdate) {
          tag.classes.addAll(classes);
        }
      }

      page.destinationContent = doc.outerHtml;
    }
  }
}
