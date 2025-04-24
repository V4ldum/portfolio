import 'package:finance/_l10n/_generated/l10n.dart';
import 'package:finance/app_info_mock_repository.dart';
import 'package:finance/assets_mock_repository.dart';
import 'package:finance/coins_mock_repository.dart';
import 'package:finance/features/assets/domain/repositories/assets_repository.dart';
import 'package:finance/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:finance/features/physical_assets/domain/repositories/coins_repository.dart';
import 'package:finance/features/physical_assets/domain/repositories/precious_metals_trade_repository.dart';
import 'package:finance/features/settings/domain/repositories/import_export_data_repository.dart';
import 'package:finance/finary_authentication_mock_repository.dart';
import 'package:finance/import_export_data_mock_repository.dart';
import 'package:finance/local_storage_mock_data_source.dart';
import 'package:finance/precious_metals_trade_mock_repository.dart';
import 'package:finance/shared/data/data_sources/local_storage_data_source.dart';
import 'package:finance/shared/domain/repositories/app_info_repository.dart';
import 'package:finance/shared/utils/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ProviderScope(
      overrides: [
        appInfoRepositoryProvider.overrideWith((ref) => AppInfoMockRepository()),
        localStorageDataSourceProvider.overrideWith((ref) => LocalStorageMockDataSource()),
        importExportDataRepositoryProvider.overrideWith((ref) => ImportExportDataMockRepository()),
        coinsRepositoryProvider.overrideWith((ref) => CoinsMockRepository()),
        preciousMetalsTradeRepositoryProvider.overrideWith((ref) => PreciousMetalsTradeMockRepository()),
        finaryAuthenticationRepositoryProvider.overrideWith((ref) => FinaryAuthenticationMockRepository()),
        assetsRepositoryProvider.overrideWith((ref) => AssetsMockRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
