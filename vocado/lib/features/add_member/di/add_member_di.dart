import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_member_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddMember',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/add_member'],
)
void configureAddMember(GetIt getIt) {
  getIt.initAddMember();
}
