import 'dart:async';

import 'package:bingo/models/bingo.dart';
import 'package:bingo/repositories/database_repository.dart';
import 'package:bingo/repositories/dtos/bingo_dto.dart';
import 'package:bingo/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rust/rust.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'database_mock_repository.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ProviderScope(
      overrides: [databaseRepositoryProvider.overrideWith((ref) => DatabaseMockRepository())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      darkTheme: ShadThemeData(colorScheme: const ShadZincColorScheme.dark(), brightness: Brightness.dark),
      routerConfig: router,
    );
  }
}
