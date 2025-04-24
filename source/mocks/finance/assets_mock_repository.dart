import 'dart:math';

import 'package:finance/coins_mock_repository.dart';
import 'package:finance/constants.dart';
import 'package:finance/features/assets/domain/exceptions/finary_exception.dart';
import 'package:finance/features/assets/domain/models/asset_category_model.dart';
import 'package:finance/features/assets/domain/models/asset_model.dart';
import 'package:finance/features/assets/domain/models/asset_type_model.dart';
import 'package:finance/features/assets/domain/models/finary_asset_model.dart';
import 'package:finance/features/assets/domain/models/finary_assets_model.dart';
import 'package:finance/features/assets/domain/models/physical_assets_model.dart';
import 'package:finance/features/assets/domain/models/precious_metal_asset_model.dart';
import 'package:finance/features/assets/domain/repositories/assets_repository.dart';
import 'package:finance/features/physical_assets/data/dtos/trade_values_dto.dart';
import 'package:finance/features/physical_assets/domain/models/precious_metal_type_model.dart';
import 'package:finance/features/physical_assets/domain/models/precious_metals_trade_value_model.dart';

class AssetsMockRepository implements AssetsRepository {
  static final _finaryAssetsModel = FinaryAssetsModel(
    assets: [
      FinaryAssetModel(
        evolution: 1000,
        evolutionPercent: 20,
        id: '1',
        name: 'Vanguard SP500 ETF',
        amount: 20,
        value: 1000,
        category: AssetCategoryModel.investment,
        type: AssetTypeModel.fund,
      ),
      FinaryAssetModel(
        evolution: -100,
        evolutionPercent: -10,
        id: '2',
        name: 'Apple',
        amount: 5,
        value: 100,
        category: AssetCategoryModel.speculative,
        type: AssetTypeModel.stock,
      ),
      FinaryAssetModel(
        evolution: -5,
        evolutionPercent: -1,
        id: '2',
        name: 'Visa',
        amount: 7,
        value: 870,
        category: AssetCategoryModel.speculative,
        type: AssetTypeModel.stock,
      ),
      FinaryAssetModel(
        evolution: 100,
        evolutionPercent: 8,
        id: '2',
        name: 'Mitsubishi',
        amount: 5,
        value: 80,
        category: AssetCategoryModel.speculative,
        type: AssetTypeModel.stock,
      ),
    ],
    lastSyncFinary: DateTime.now(),
  );
  static final _physicalAssetsModel = PhysicalAssetsModel(
    assets: [
      PreciousMetalAssetModel(
        id: '1',
        numistaId: '',
        name: 'Gold Bar',
        amount: 10,
        value: 1000,
        purity: 99.99,
        weight: 10,
        metalType: PreciousMetalTypeModel.gold,
      ),
      PreciousMetalAssetModel(
        id: '2',
        numistaId: '',
        name: 'Silver Bar',
        amount: 1,
        value: 1000,
        purity: 99.99,
        weight: 1000,
        metalType: PreciousMetalTypeModel.silver,
      ),
      PreciousMetalAssetModel(
        id: '37',
        numistaId: '9165',
        name: 'Vienna Philharmonic',
        amount: 1,
        value: 30,
        purity: 99.90,
        weight: 31,
        metalType: PreciousMetalTypeModel.silver,
      ),
      AssetModel(
        id: '4',
        name: 'Cash',
        amount: 10,
        value: 100,
        category: AssetCategoryModel.savings,
        type: AssetTypeModel.cash,
      ),
    ],
  );

  @override
  Future<FinaryAssetsModel> getFinaryAssets(String accessToken) async {
    if (accessToken.isEmpty) {
      throw FinaryException.unauthorized();
    }

    return _finaryAssetsModel;
  }

  @override
  Future<PhysicalAssetsModel> getPhysicalAssets({
    required double goldTradePrice,
    required double silverTradePrice,
  }) async {
    return _physicalAssetsModel;
  }

  @override
  Future<void> addCoinPhysicalAsset({required String coinId, required int possessed}) async {
    final rnd = Random();
    final randomId = String.fromCharCodes(Iterable.generate(8, (_) => rnd.nextInt(26) + 97));

    final coin = CoinsMockRepository.coins.firstWhere((e) => e.id == coinId);

    _physicalAssetsModel.assets.add(
      PreciousMetalAssetModel(
        id: randomId,
        numistaId: coin.numistaId,
        name: coin.name,
        amount: possessed.toDouble(),
        value:
            switch (coin.composition) {
              PreciousMetalTypeModel.gold =>
                PreciousMetalTradeValueModel.fromDto(
                  TradeValueDto(price: kGoldPrice, lastUpdate: DateTime.now()),
                  PreciousMetalTypeModel.gold,
                ).grams,
              PreciousMetalTypeModel.silver =>
                PreciousMetalTradeValueModel.fromDto(
                  TradeValueDto(price: kSilverPrice, lastUpdate: DateTime.now()),
                  PreciousMetalTypeModel.silver,
                ).grams,
              PreciousMetalTypeModel.other => 0,
            } *
            coin.purity *
            coin.weight! /
            10000,
        purity: coin.purity / 100,
        weight: coin.weight!,
        metalType: coin.composition,
      ),
    );
  }

  @override
  Future<void> updateCoinPhysicalAsset({required String coinId, required int possessed}) async {
    final index = _physicalAssetsModel.assets.indexWhere((e) => e.id == coinId);
    final clone = _physicalAssetsModel.assets[index] as PreciousMetalAssetModel;

    _physicalAssetsModel.assets[index] = PreciousMetalAssetModel(
      id: coinId,
      numistaId: clone.numistaId,
      name: clone.name,
      amount: possessed.toDouble(),
      value: clone.value,
      purity: clone.purity,
      weight: clone.weight,
      metalType: clone.metalType,
    );
  }

  @override
  Future<void> removeCoinPhysicalAsset({required String id}) async {
    _physicalAssetsModel.assets.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> addCashPhysicalAsset({required String name, required int possessed, required int unitValue}) async {
    final rnd = Random();
    final randomId = String.fromCharCodes(Iterable.generate(8, (_) => rnd.nextInt(26) + 97));

    _physicalAssetsModel.assets.add(
      AssetModel(
        id: randomId,
        name: name,
        amount: possessed.toDouble(),
        value: unitValue.toDouble(),
        category: AssetCategoryModel.savings,
        type: AssetTypeModel.cash,
      ),
    );
  }

  @override
  Future<void> updateCashPhysicalAsset({
    required String id,
    required String name,
    required int possessed,
    required int unitValue,
  }) async {
    final index = _physicalAssetsModel.assets.indexWhere((e) => e.id == id);

    _physicalAssetsModel.assets[index] = AssetModel(
      id: id,
      name: name,
      amount: possessed.toDouble(),
      value: unitValue.toDouble(),
      category: AssetCategoryModel.savings,
      type: AssetTypeModel.cash,
    );
  }

  @override
  Future<void> removeCashPhysicalAsset({required String id}) async {
    _physicalAssetsModel.assets.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> addRawPhysicalAsset({
    required String name,
    required int possessed,
    required double unitWeight,
    required PreciousMetalTypeModel metalType,
    required double purity,
  }) async {
    final rnd = Random();
    final randomId = String.fromCharCodes(Iterable.generate(8, (_) => rnd.nextInt(26) + 97));

    _physicalAssetsModel.assets.add(
      PreciousMetalAssetModel(
        id: randomId,
        numistaId: '',
        name: name,
        amount: possessed.toDouble(),
        value: unitWeight,
        purity: purity,
        weight: unitWeight,
        metalType: metalType,
      ),
    );
  }

  @override
  Future<void> updateRawPhysicalAsset({
    required String id,
    required String name,
    required int possessed,
    required double unitWeight,
    required PreciousMetalTypeModel metalType,
    required double purity,
  }) async {
    final index = _physicalAssetsModel.assets.indexWhere((e) => e.id == id);

    _physicalAssetsModel.assets[index] = PreciousMetalAssetModel(
      id: id,
      numistaId: '',
      name: name,
      amount: possessed.toDouble(),
      value: unitWeight,
      purity: purity,
      weight: unitWeight,
      metalType: metalType,
    );
  }

  @override
  Future<void> removeRawPhysicalAsset({required String id}) async {
    _physicalAssetsModel.assets.removeWhere((e) => e.id == id);
  }
}
