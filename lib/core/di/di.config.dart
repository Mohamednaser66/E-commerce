// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i485;
import '../../features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i277;
import '../../features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i112;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i436;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/main_layout/categories/data/data_sources/categories_api_remote_data_source.dart'
    as _i1033;
import '../../features/main_layout/categories/data/data_sources/categories_remote_data_source.dart'
    as _i494;
import '../../features/main_layout/categories/data/repositories/categories_repository_impl.dart'
    as _i662;
import '../../features/main_layout/categories/domain/get_categories_usecase.dart'
    as _i728;
import '../../features/main_layout/categories/domain/repositories/categories_repoository.dart'
    as _i347;
import '../../features/main_layout/categories/presentation/categories_cubit/categories_cubit.dart'
    as _i99;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i494.CategoriesRemoteDataSource>(
        () => _i1033.CategoriesApiRemoteDataSource());
    gh.factory<_i347.CategoriesRepository>(
        () => _i662.CategoriesRepoImpl(gh<_i494.CategoriesRemoteDataSource>()));
    gh.factory<_i485.AuthLocalDataSource>(
        () => _i277.AuthSharedPrefsLocalDataSource());
    gh.factory<_i432.AuthRemoteDataSource>(
        () => _i112.AuthApiRemoteDataSource());
    gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i432.AuthRemoteDataSource>(),
          gh<_i485.AuthLocalDataSource>(),
        ));
    gh.factory<_i728.GetCategoriesUseCase>(
        () => _i728.GetCategoriesUseCase(gh<_i347.CategoriesRepository>()));
    gh.factory<_i436.AuthUseCase>(
        () => _i436.AuthUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i99.CategoriesCubit>(
        () => _i99.CategoriesCubit(gh<_i728.GetCategoriesUseCase>()));
    gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(gh<_i436.AuthUseCase>()));
    return this;
  }
}
