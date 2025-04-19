import 'dart:async';

import 'package:static_shock/static_shock.dart';

class HtmlPrettifierPlugin implements StaticShockPlugin {
  const HtmlPrettifierPlugin();

  @override
  String get id => "dev.valdum.htmlprettifier";

  @override
  FutureOr<void> configure(
    StaticShockPipeline pipeline,
    StaticShockPipelineContext context,
    StaticShockCache pluginCache,
  ) {
    pipeline.finish(const _HtmlPrettifierFinisher());
  }
}

class _HtmlPrettifierFinisher implements Finisher {
  const _HtmlPrettifierFinisher();

  @override
  void execute(StaticShockPipelineContext context) {
    for (final page in context.pagesIndex.pages) {
      if (page.destinationPath?.extension != "html" || page.destinationContent == null) {
        continue;
      }

      page.destinationContent = page.destinationContent!.replaceAll(RegExp(r"^\s*$", multiLine: true), "");
    }
  }
}
