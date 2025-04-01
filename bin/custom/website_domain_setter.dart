import 'dart:async';
import 'dart:io';

import 'package:static_shock/static_shock.dart';

class WebsiteDomainSetter implements PageTransformer {
  @override
  FutureOr<void> transformPage(StaticShockPipelineContext context, Page page) {
    if (page.url != null && page.url!.startsWith('projects\\')) {
      page.data.putIfAbsent(
        'baseUrl',
        () => Platform.isLinux ? 'https://portfolio.valdum.dev' : 'http://localhost:4000',
      );
    }
  }
}
