import 'package:supabase_flutter/supabase_flutter.dart';

class FakeSupabaseAuth extends GoTrueClient {
  static bool _isAuthenticated = false;

  @override
  Session? get currentSession =>
      _isAuthenticated
          ? Session(
            accessToken: '',
            tokenType: '',
            user: const User(id: 'id', appMetadata: {}, userMetadata: {}, aud: '', createdAt: ''),
          )
          : null;

  @override
  Future<void> signOut({SignOutScope scope = SignOutScope.local}) {
    _isAuthenticated = false;
    return Future.value();
  }
}
