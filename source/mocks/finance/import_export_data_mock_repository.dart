// TODO rajouter une pop-up ou snack bar pour dire que ça marche pas ? Changer le label de l'import export
import 'package:finance/features/physical_assets/domain/models/precious_metals_trade_value_model.dart';
import 'package:finance/features/settings/domain/repositories/import_export_data_repository.dart';
import 'package:finance/shared/presentation/providers/app_cache_controller.dart';

class ImportExportDataMockRepository implements ImportExportDataRepository {
  @override
  Future<void> export() async {
    // no-op
  }

  @override
  Future<AppCache?> import({
    required Future<PreciousMetalTradeValueModel> Function() goldTradePriceFuture,
    required Future<PreciousMetalTradeValueModel> Function() silverTradePriceFuture,
  }) async {
    return null;
  }
}
