import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/model/task_model/task_model.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/core/services/user_service.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskViewerRemoteDataSource {
  Future<List<TaskModel>> getTaskViewer();
  Future<bool> updateTask({required int id, required String newStatus});
}

@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
  final _supabase = Supabase.instance.client;
  final UserService _userService;
  final LocalKeysService _localKeysService;

  TaskViewerRemoteDataSource(this._localKeysService, this._userService);

  @override
  Future<List<TaskModel>> getTaskViewer() async {
    List<TaskModel> tasks = [];
    try {
      final response = await _supabase
          .from("task")
          .select()
          .eq("user_id", _userService.getUser!.id);
      print(response);
      if (response.isNotEmpty) {
        tasks = (response as List)
            .map((task) => TaskModel.fromJson(task))
            .toList();
      }
      return tasks;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> updateTask({required int id, required String newStatus}) async {
    try {
      final response = await _supabase
          .from("task")
          .update({'status': newStatus})
          .eq("id", id);
      print("---------------1");
      print(response);
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
