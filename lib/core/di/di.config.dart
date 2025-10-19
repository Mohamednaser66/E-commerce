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
import '../../features/cart/data/data_source/get_cart_data_source.dart'
    as _i587;
import '../../features/cart/data/data_source/get_cart_data_source_impl.dart'
    as _i23;
import '../../features/cart/data/repository_impl/get_cart_repository_impl.dart'
    as _i903;
import '../../features/cart/domain/repository/get_cart_repo.dart' as _i81;
import '../../features/cart/domain/usee_case/get-cart_use_case.dart' as _i620;
import '../../features/cart/presentation/cart_cubit/cart_cubit.dart' as _i244;
import '../../features/main_layout/categories/category_data/data_source/remote_data_source.dart'
    as _i578;
import '../../features/main_layout/categories/category_data/data_source/remote_data_source_impl.dart'
    as _i162;
import '../../features/main_layout/categories/category_data/repository_impl/category_repo_impl.dart'
    as _i635;
import '../../features/main_layout/categories/category_domain/repository/repository.dart'
    as _i489;
import '../../features/main_layout/categories/category_domain/use_case/use_case.dart'
    as _i967;
import '../../features/main_layout/favourite/data/data_source/data_source_impl.dart'
    as _i152;
import '../../features/main_layout/favourite/data/data_source/wish_list_data_source.dart'
    as _i39;
import '../../features/main_layout/favourite/data/repository__impl/wish_list_repository_impl.dart'
    as _i594;
import '../../features/main_layout/favourite/domain/repository/wish_list_repository.dart'
    as _i221;
import '../../features/main_layout/favourite/domain/use_case/wish_list_use_case.dart'
    as _i381;
import '../../features/main_layout/favourite/presentation/wish_list_view_model/wish_list_cubit.dart'
    as _i198;
import '../../features/main_layout/home/data/brand_data/data_source/brand_data_source.dart'
    as _i773;
import '../../features/main_layout/home/data/brand_data/data_source/data_source_impl.dart'
    as _i1013;
import '../../features/main_layout/home/data/brand_data/repository_impl/brand_repository_impi.dart'
    as _i297;
import '../../features/main_layout/home/domain/brand_domain/brand_reository/brand_repository.dart'
    as _i1026;
import '../../features/main_layout/home/domain/brand_domain/use_case/brand_use_case.dart'
    as _i203;
import '../../features/main_layout/home/presentation/home_cubit/main_lay_out_cubit.dart'
    as _i106;
import '../../features/product_details/data/data_source/cart_data_source.dart'
    as _i1045;
import '../../features/product_details/data/data_source/cart_data_source_impl.dart'
    as _i666;
import '../../features/product_details/data/repository_impl/cart_product_repository_impl.dart'
    as _i396;
import '../../features/product_details/domain/repository/cart_product_repository.dart'
    as _i309;
import '../../features/product_details/domain/use_case/add_to_cart_use_case/add_to_cart_use_case.dart'
    as _i156;
import '../../features/product_details/presentation/cart_product_view_model/cart_product_view_model.dart'
    as _i479;
import '../../features/products_screen/data/data_source/product_data_source.dart'
    as _i923;
import '../../features/products_screen/data/data_source/prouduct_api_data_source_imple.dart'
    as _i281;
import '../../features/products_screen/data/repository_impl/product_repository_impl.dart'
    as _i450;
import '../../features/products_screen/domain/repository/product_repository.dart'
    as _i744;
import '../../features/products_screen/domain/use_case/product_use_case.dart'
    as _i19;
import '../../features/products_screen/presentation/product_cubit/product_cubit.dart'
    as _i538;

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
    gh.factory<_i923.ProductDataSource>(() => _i281.ProductApiDataSourceImpl());
    gh.factory<_i885.AuthRemoteDataSource>(
        () => _i272.AuthApiRemoteDataSource());
    gh.factory<_i672.AuthLocalDataSource>(
        () => _i1049.AuthSharedPrefsDataSource());
    gh.factory<_i578.CategoryRemoteDataSource>(
        () => _i162.CategoryApiDataSource());
    gh.factory<_i587.GetCartDataSource>(() => _i23.GetCartDataSourceImpl());
    gh.factory<_i773.BrandDataSource>(() => _i1013.BrandApiDataSourceImpl());
    gh.factory<_i961.AuthRepository>(() => _i153.AuthRepositoryImpl(
          gh<_i885.AuthRemoteDataSource>(),
          gh<_i672.AuthLocalDataSource>(),
        ));
    gh.factory<_i1045.CartDataSource>(
        () => _i666.CartDataSourceImpl(gh<_i672.AuthLocalDataSource>()));
    gh.factory<_i81.GetCartRepo>(
        () => _i903.GetCartRepositoryImpl(gh<_i587.GetCartDataSource>()));
    gh.factory<_i1026.BrandRepository>(
        () => _i297.BrandRepositoryImpl(gh<_i773.BrandDataSource>()));
    gh.factory<_i620.GetCartUseCase>(
        () => _i620.GetCartUseCase(gh<_i81.GetCartRepo>()));
    gh.factory<_i744.ProductRepository>(
        () => _i450.ProductRepositoryImpl(gh<_i923.ProductDataSource>()));
    gh.factory<_i309.CartProductRepository>(
        () => _i396.CartProductRepositoryImpl(gh<_i1045.CartDataSource>()));
    gh.factory<_i701.AuthUseCase>(
        () => _i701.AuthUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i156.AddToCartUseCase>(
        () => _i156.AddToCartUseCase(gh<_i309.CartProductRepository>()));
    gh.factory<_i19.ProductUseCase>(
        () => _i19.ProductUseCase(gh<_i744.ProductRepository>()));
    gh.factory<_i538.ProductCubit>(
        () => _i538.ProductCubit(gh<_i19.ProductUseCase>()));
    gh.factory<_i489.CategoryRemoteRepo>(
        () => _i635.CategoryRepoImpl(gh<_i578.CategoryRemoteDataSource>()));
    gh.factory<_i731.AuthCubit>(() => _i731.AuthCubit(gh<_i701.AuthUseCase>()));
    gh.factory<_i967.CategoryUseCase>(
        () => _i967.CategoryUseCase(gh<_i489.CategoryRemoteRepo>()));
    gh.factory<_i479.CartProductViewModel>(
        () => _i479.CartProductViewModel(gh<_i156.AddToCartUseCase>()));
    gh.factory<_i203.BrandUseCase>(
        () => _i203.BrandUseCase(gh<_i1026.BrandRepository>()));
    gh.factory<_i244.CartCubit>(
        () => _i244.CartCubit(gh<_i620.GetCartUseCase>()));
    gh.factory<_i106.MainLayoutCubit>(() => _i106.MainLayoutCubit(
          gh<_i967.CategoryUseCase>(),
          gh<_i203.BrandUseCase>(),
        ));
    gh.factory<_i39.WishListDataSource>(
        () => _i152.WishListDataSourceImpl(gh<_i701.AuthUseCase>()));
    gh.factory<_i221.WishListRepository>(
        () => _i594.WishListRepositoryImpl(gh<_i39.WishListDataSource>()));
    gh.factory<_i381.WishListUseCase>(
        () => _i381.WishListUseCase(gh<_i221.WishListRepository>()));
    gh.factory<_i198.WishListCubit>(
        () => _i198.WishListCubit(gh<_i381.WishListUseCase>()));
    return this;
  }
}
