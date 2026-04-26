import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/add_member/data/models/add_member_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseAddMemberRemoteDataSource {
  Future<AddMemberModel> getAddMember();
}

@LazySingleton(as: BaseAddMemberRemoteDataSource)
class AddMemberRemoteDataSource implements BaseAddMemberRemoteDataSource {
final _supabase = Supabase.instance.client;  final LocalKeysService _localKeysService;

  AddMemberRemoteDataSource(this._localKeysService);

  @override
  Future<AddMemberModel> getAddMember() async {
    try {
      final res = await _supabase.auth.admin.createUser(
        AdminUserAttributes(
          email: 'ohoodalbagami1@email.com',
          password: 'password',
        ),
      );
      print(res);
      return AddMemberModel(
        id: 1,
        firstName: "Last Name",
        lastName: "First Name",
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
