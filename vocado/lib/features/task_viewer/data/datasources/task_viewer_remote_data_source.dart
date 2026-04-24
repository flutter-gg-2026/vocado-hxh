import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/model/task_model/task_model.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/core/services/user_service.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskViewerRemoteDataSource {
  Future<List<TaskModel>> getTaskViewer();
}

@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalKeysService _localKeysService;

  TaskViewerRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._userService,
  );

  @override
  Future<List<TaskModel>> getTaskViewer() async {
    List<TaskModel> tasks = [];
    try {
      final response = await _supabase.from("task_status_view").select();
      print(response);
      print("----------");
      if (response.isNotEmpty) {
        print("----------klkkkkkk");
        tasks = (response as List)
            .map((task) => TaskModel.fromJson(task))
            .toList();
      }
      return tasks;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
