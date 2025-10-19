import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/wish_list_view_model/wish_list_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/cart_product_view_model/cart_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';

void main() {
  configureDependencies();

  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>getIt<AuthCubit>()),
  BlocProvider(create: (_) => getIt<WishListCubit>()..getWishList()),
  BlocProvider(create: (_) => getIt<CartProductViewModel>()),
        
    ]

    ,  child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.signInRoute,
      ),
    );
  }
}
