import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/task_viewer/data/models/task_viewer_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';


abstract class BaseTaskViewerRemoteDataSource {
  Future<TaskViewerModel> getTaskViewer();
}


@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   TaskViewerRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<TaskViewerModel> getTaskViewer() async {
    try {
      return TaskViewerModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
