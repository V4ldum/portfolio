import 'package:fitness_app/config/strings.dart';
import 'package:fitness_app/features/app_wide/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repository/login_repository.dart';

class LoginService implements LoginRepository {
  // 404 -> erreur de connexion
  // 401 -> mauvais username/password
  // 200 -> ok
  @override
  Future<APIResponse<Map<String, Object>>> login(String username, String password) async {
    if (username != 'mock' || password != 'mock') {
      return APIResponse<Map<String, Object>>(APICode.unauthorized, null);
    }
    return APIResponse<Map<String, Object>>(APICode.ok, {
      "user": User(username: 'mock', fullName: 'Mock User', permissions: [0]),
      "access_token": "123",
      "refresh_token": "123",
    });
  }

  @override
  Future<bool> openForgottenPasswordPage() async {
    return await launchUrl(Uri.https(Strings.forgottenPasswordHost, Strings.forgottenPasswordPath));
  }

  @override
  Future<bool> openRegistrationPage() async {
    return await launchUrl(Uri.https(Strings.createAccountHost, Strings.createAccountPath));
  }
}
