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
import 'package:vocado/features/view_member/data/datasources/view_member_remote_data_source.dart'
    as _i740;
import 'package:vocado/features/view_member/data/repositories/view_member_repository_data.dart'
    as _i108;
import 'package:vocado/features/view_member/domain/repositories/view_member_repository_domain.dart'
    as _i557;
import 'package:vocado/features/view_member/domain/use_cases/view_member_use_case.dart'
    as _i72;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initViewMember({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i740.BaseViewMemberRemoteDataSource>(
      () => _i740.ViewMemberRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i557.ViewMemberRepositoryDomain>(
      () => _i108.ViewMemberRepositoryData(
        gh<_i740.BaseViewMemberRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i72.ViewMemberUseCase>(
      () => _i72.ViewMemberUseCase(gh<_i557.ViewMemberRepositoryDomain>()),
    );
    return this;
  }
}
