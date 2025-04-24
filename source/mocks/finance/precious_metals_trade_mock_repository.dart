import 'package:finance/constants.dart';
import 'package:finance/features/physical_assets/data/dtos/trade_values_dto.dart';
import 'package:finance/features/physical_assets/domain/models/precious_metal_type_model.dart';
import 'package:finance/features/physical_assets/domain/models/precious_metals_trade_value_model.dart';
import 'package:finance/features/physical_assets/domain/models/sp500_trade_value_model.dart';
import 'package:finance/features/physical_assets/domain/repositories/precious_metals_trade_repository.dart';

class PreciousMetalsTradeMockRepository implements PreciousMetalsTradeRepository {
  @override
  Future<PreciousMetalTradeValueModel> getGoldTradeValue() async {
    return PreciousMetalTradeValueModel.fromDto(
      TradeValueDto(price: kGoldPrice, lastUpdate: DateTime.now()),
      PreciousMetalTypeModel.gold,
    );
  }

  @override
  Future<PreciousMetalTradeValueModel> getSilverTradeValue() async {
    return PreciousMetalTradeValueModel.fromDto(
      TradeValueDto(price: kSilverPrice, lastUpdate: DateTime.now()),
      PreciousMetalTypeModel.silver,
    );
  }

  @override
  Future<SP500TradeValueModel> getSP500TradeValue() async {
    return SP500TradeValueModel(name: 'SP500', value: kSPPrice, lastUpdated: DateTime.now());
  }
}
