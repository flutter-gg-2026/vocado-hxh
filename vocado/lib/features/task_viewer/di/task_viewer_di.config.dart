// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:vocado/core/services/local_keys_service.dart' as _i140;
import 'package:vocado/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart'
    as _i262;
import 'package:vocado/features/task_viewer/data/repositories/task_viewer_repository_data.dart'
    as _i132;
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart'
    as _i476;
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart'
    as _i253;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTaskViewer({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i262.BaseTaskViewerRemoteDataSource>(
      () => _i262.TaskViewerRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i476.TaskViewerRepositoryDomain>(
      () => _i132.TaskViewerRepositoryData(
        gh<_i262.BaseTaskViewerRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i253.TaskViewerUseCase>(
      () => _i253.TaskViewerUseCase(gh<_i476.TaskViewerRepositoryDomain>()),
    );
    return this;
  }
}
