import 'dart:async';
import 'dart:math' show Random;

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

import 'fake_supabase_auth.dart';

class DatabaseMockRepository implements DatabaseRepository {
  static void Function(BingoItemDto)? _refreshCallback;

  static final Vec<Bingo> _bingos = Vec.from([
    Bingo(
      id: '123',
      title: 'Mock Bingo 1',
      size: 3,
      created: DateTime(2025, 01, 02),
      items: Vec.from([
        BingoItem(id: '1', index: 0, text: 'This'),
        BingoItem(id: '2', index: 1, text: 'is'),
        BingoItem(id: '3', index: 2, text: 'a'),
        BingoItem(id: '4', index: 3, text: 'mock'),
        BingoItem(id: '5', index: 4, text: 'bingo'),
        BingoItem(id: '6', index: 5, text: 'you'),
        BingoItem(id: '7', index: 6, text: 'can'),
        BingoItem(id: '8', index: 7, text: 'test'),
        BingoItem(id: '9', index: 8, text: 'it'),
      ]),
    ),
    Bingo(
      id: '456',
      title: 'Mock Bingo 2',
      size: 3,
      created: DateTime(2025, 01, 02),
      items: Vec.from([
        BingoItem(id: '11', index: 0, text: 'This'),
        BingoItem(id: '12', index: 1, text: 'is'),
        BingoItem(id: '13', index: 2, text: 'a'),
        BingoItem(id: '14', index: 3, text: 'mock'),
        BingoItem(id: '15', index: 4, text: 'bingo', isChecked: true),
        BingoItem(id: '16', index: 5, text: 'you'),
        BingoItem(id: '17', index: 6, text: 'can'),
        BingoItem(id: '18', index: 7, text: 'test'),
        BingoItem(id: '19', index: 8, text: 'it'),
      ]),
    ),
  ]);

  @override
  Future<Bingo> getBingo({required String id}) async {
    return Future.value(_bingos.iter().find((e) => e.id == id).unwrap());
  }

  @override
  Future<List<Bingo>> getAllBingos() async {
    return Future.value(_bingos);
  }

  @override
  Future<String> createBingo(Bingo bingo) async {
    final rnd = Random();
    final randomId = String.fromCharCodes(Iterable.generate(8, (_) => rnd.nextInt(26) + 97));

    _bingos.push(bingo.copyWith(id: randomId));

    return bingo.id;
  }

  @override
  Future<void> updateBingo(Bingo bingo) async {
    final index = _bingos.iter().position((e) => e.id == bingo.id);

    if (index case Some(:final value)) {
      _bingos[value] = bingo;
    }
  }

  @override
  Future<void> checkBingoItem(String bingoItemId, {required bool isChecked}) async {
    _bingos.iter().forEach((bingo) {
      bingo.items.iter().map((item) {
        if (item.id == bingoItemId) {
          _refreshCallback?.call(BingoItemDto(id: item.id, index: item.index, text: item.text, isChecked: isChecked));

          return item.copyWith(isChecked: isChecked);
        } else {
          return item;
        }
      }).collectVec();
    });
  }

  @override
  Future<void> deleteBingo(String id) async {
    _bingos.retain((e) => e.id != id);
  }

  @override
  Future<bool> authenticateUser(String username, String password) async {
    if (username == 'mock' && password == 'mock') {
      FakeSupabaseAuth.isAuthenticated = true;
      return true;
    }
    return false;
  }

  @override
  void subscribeToRealtimeUpdates({required String bingoId, required void Function(BingoItemDto) callback}) {
    _refreshCallback = callback;
  }

  @override
  void stopRealtimeUpdates() {
    _refreshCallback = null;
  }
}
