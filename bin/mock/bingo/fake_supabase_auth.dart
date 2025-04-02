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

class FakeSupabaseAuth extends GoTrueClient {
  static bool _isAuthenticated = true; //false;

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
