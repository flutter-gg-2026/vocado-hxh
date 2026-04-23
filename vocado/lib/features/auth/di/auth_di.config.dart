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
import 'package:vocado/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i906;
import 'package:vocado/features/auth/data/repositories/auth_repository_data.dart'
    as _i694;
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart'
    as _i272;
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart'
    as _i970;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuth({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i906.BaseAuthRemoteDataSource>(
      () => _i906.AuthRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i272.AuthRepositoryDomain>(
      () => _i694.AuthRepositoryData(gh<_i906.BaseAuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i970.AuthUseCase>(
      () => _i970.AuthUseCase(gh<_i272.AuthRepositoryDomain>()),
    );
    return this;
  }
}
