import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/model/user_model/user_model.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseViewMemberRemoteDataSource {
  Future<List<UserModel>> getMember();
}

@LazySingleton(as: BaseViewMemberRemoteDataSource)
class ViewMemberRemoteDataSource implements BaseViewMemberRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ViewMemberRemoteDataSource(this._localKeysService, this._supabase);

  Future<List<UserModel>> getMember() async {
    List<UserModel> users = [];
    try {
      final response = await _supabase
          .from("users")
          .select()
          .neq("role", "Admin");

      if (response.isNotEmpty) {
        users = (response as List)
            .map((task) => UserModel.fromJson(task))
            .toList();
      }
      return users;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
