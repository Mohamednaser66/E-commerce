import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/wish_list_view_model/wish_list_cubit.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key,});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();

}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WishListCubit>().getWishList();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<WishListCubit,WishListState>(
        builder: (context,state) {
          if(state is GetWishListSuccess){
            return Padding(
              padding:  EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7 / 9,
                ),
                itemBuilder: (context, index) {
                  return CustomProductWidget(
                    key: Key(state.products[index].id??''),
                    product: state.products[index],
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            );
          } else if(state is GetWishListError){
            return Center(child:  Text(state.message??'Failed To Load WishList'),);
          }
          return Center(child: CircularProgressIndicator(),);

        }
    );

  }
}
