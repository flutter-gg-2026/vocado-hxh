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
import 'package:vocado/features/add_member/data/datasources/add_member_remote_data_source.dart'
    as _i345;
import 'package:vocado/features/add_member/data/repositories/add_member_repository_data.dart'
    as _i316;
import 'package:vocado/features/add_member/domain/repositories/add_member_repository_domain.dart'
    as _i75;
import 'package:vocado/features/add_member/domain/use_cases/add_member_use_case.dart'
    as _i949;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddMember({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i345.BaseAddMemberRemoteDataSource>(
      () => _i345.AddMemberRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i75.AddMemberRepositoryDomain>(
      () => _i316.AddMemberRepositoryData(
        gh<_i345.BaseAddMemberRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i949.AddMemberUseCase>(
      () => _i949.AddMemberUseCase(gh<_i75.AddMemberRepositoryDomain>()),
    );
    return this;
  }
}
