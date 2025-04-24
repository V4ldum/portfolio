import 'package:finance/shared/data/data_sources/local_storage_data_source.dart';

class LocalStorageMockDataSource implements LocalStorageDataSource {
  static final Map<String, String> _data = Map.from({});

  @override
  Future<void> delete(String key) async {
    _data.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    _data.removeWhere((_, __) => true);
  }

  @override
  Future<String?> read(String key) async {
    return _data[key];
  }

  @override
  Future<Map<String, String>> readAll() async {
    return Map.unmodifiable(_data);
  }

  @override
  Future<void> write(String key, String value) async {
    _data.update(key, (_) => value, ifAbsent: () => value);
  }
}
