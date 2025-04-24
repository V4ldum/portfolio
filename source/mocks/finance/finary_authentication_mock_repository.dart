import 'package:finance/features/authentication/domain/models/finary_authentication_model.dart';
import 'package:finance/features/authentication/domain/repositories/authentication_repository.dart';

class FinaryAuthenticationMockRepository implements FinaryAuthenticationRepository {
  @override
  Future<FinaryAuthenticationModel> auth(String login, String password) async {
    return FinaryAuthenticationModel(
      sia: 'UNUSED',
      sessionId: login == 'mock' && password == 'mock' ? '123' : '',
      otpRequired: false,
    );
  }

  @override
  Future<FinaryAuthenticationModel> authOtp(String sia, String otp) async {
    // There should not be an OTP verification in Mock
    throw UnimplementedError();
  }

  @override
  Future<String> refreshToken(String sessionId) async {
    return '123';
  }
}
