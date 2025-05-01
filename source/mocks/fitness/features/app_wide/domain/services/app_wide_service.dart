import '../domain.dart';

class AppWideService implements AppWideRepository {
  @override
  Future<String?> getAccessToken() async {
    return "";
  }

  @override
  Future<String?> getRefreshToken() async {
    return "";
  }

  @override
  Future<void> updateTokens(String accessToken, String refreshToken) async {
    // no-op
  }

  @override
  Future<void> deleteTokens() async {
    // no-op
  }

  @override
  Future<APIResponse<User>> authenticate(String accessToken) async {
    if (accessToken != "123") {
      return APIResponse<User>(APICode.unauthorized, null);
    }
    return APIResponse<User>(APICode.ok, User(username: 'mock', fullName: 'Mock User'));
  }

  @override
  Future<APIResponse<Map<String, String>>> refresh(String refreshToken) async {
    if (refreshToken != "123") {
      return APIResponse<Map<String, String>>(APICode.unauthorized, {});
    }
    return APIResponse<Map<String, String>>(APICode.ok, {"access_token": "123", "refresh_token": "123"});
  }
}
