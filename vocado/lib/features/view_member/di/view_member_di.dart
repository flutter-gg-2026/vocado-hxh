import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'view_member_di.config.dart'; 

@InjectableInit(
  initializerName: 'initViewMember',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/view_member'],
)
void configureViewMember(GetIt getIt) {
  getIt.initViewMember();
}
