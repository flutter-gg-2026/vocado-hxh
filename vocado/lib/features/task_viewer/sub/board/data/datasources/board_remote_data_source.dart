import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/task_viewer/sub/board/data/models/board_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseBoardRemoteDataSource {
  Future<BoardModel> getBoard();
}


@LazySingleton(as: BaseBoardRemoteDataSource)
class BoardRemoteDataSource implements BaseBoardRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   BoardRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<BoardModel> getBoard() async {
    try {
      return BoardModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
