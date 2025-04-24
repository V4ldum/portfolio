import 'package:finance/shared/domain/repositories/app_info_repository.dart';

class AppInfoMockRepository implements AppInfoRepository {
  @override
  Future<String> getPackageName() async {
    return '';
  }

  @override
  Future<String> getVersion() async {
    return '1.0.0';
  }
}
