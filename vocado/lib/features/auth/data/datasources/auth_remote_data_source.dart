import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/model/user_model/user_model.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/core/services/user_service.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> getAuth({required String email, required String password});
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
final _supabase = Supabase.instance.client; 
  final UserService _userService;
  final LocalKeysService _localKeysService;

  AuthRemoteDataSource(
    this._localKeysService,
    this._userService,
  );

  @override
  Future<UserModel> getAuth({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(password: password, email: email);
  
      final userData = await _supabase
          .from('users')
          .select()
          .eq('id', _supabase.auth.currentUser!.id)
          .single();
      final userModel = UserModel.fromJson(userData);
      _userService.setUser = userModel;
      return userModel;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
