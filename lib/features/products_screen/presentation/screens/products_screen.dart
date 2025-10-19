import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..getAllProduct(),
      child: Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              BlocBuilder<ProductCubit,ProductState>(
                builder: (context,state) {
                  if(state is ProductSuccessState){
                    return Expanded(
                      child: GridView.builder(
                        itemCount: state.products?.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            product: state.products![index],
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    );
                  } else if(state is ProductErrorState){
                    return Center(child:  Text(state.message??'Failed To Load Product'),);
                  }
                  return Center(child: CircularProgressIndicator(),);

                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
