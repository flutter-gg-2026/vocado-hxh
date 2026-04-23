import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'task_creator_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTaskCreator',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/task_creator'],
)
void configureTaskCreator(GetIt getIt) {
  getIt.initTaskCreator();
}
