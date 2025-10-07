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

import '../../features/auth/data/data_source/local_data_source/auth_local_data_source.dart'
    as _i672;
import '../../features/auth/data/data_source/local_data_source/auth_shared_prefs_data_source.dart'
    as _i1049;
import '../../features/auth/data/data_source/remote_data_source/auth_api_remote_data_source.dart'
    as _i272;
import '../../features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i885;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_case/auth_use_case.dart' as _i701;
import '../../features/auth/presentation/auth_cubit.dart' as _i731;
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
    gh.factory<_i885.AuthRemoteDataSource>(
        () => _i272.AuthApiRemoteDataSource());
    gh.factory<_i672.AuthLocalDataSource>(
        () => _i1049.AuthSharedPrefsDataSource());
    gh.factory<_i961.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i885.AuthRemoteDataSource>(),
          gh<_i672.AuthLocalDataSource>(),
        ));
    gh.factory<_i728.GetCategoriesUseCase>(
        () => _i728.GetCategoriesUseCase(gh<_i347.CategoriesRepository>()));
    gh.factory<_i99.CategoriesCubit>(
        () => _i99.CategoriesCubit(gh<_i728.GetCategoriesUseCase>()));
    gh.factory<_i701.AuthUseCase>(
        () => _i701.AuthUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i731.AuthCubit>(() => _i731.AuthCubit(gh<_i701.AuthUseCase>()));
    return this;
  }
}
