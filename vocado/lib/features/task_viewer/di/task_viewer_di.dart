import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'task_viewer_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTaskViewer',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/task_viewer'],
)
void configureTaskViewer(GetIt getIt) {
  getIt.initTaskViewer();
}
