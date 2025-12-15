import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});



  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        buildWhen:(previous, current) {
          if(current is CartSuccess|| current is CartError||current is CartLoading){
          return true;
          }return false;
        },
        builder: (context, state) {
          if(state is CartSuccess){
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Column(
                children: [
                  Expanded(
                    // the list of cart items ===============
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          CartItemWidget(
                            id: state.cartEntity.products?[index].product?.id??'',
                            imagePath:state.cartEntity.products?[index].product?.imageCover??'' ,
                            title: state.cartEntity.products?[index].product?.title??'',
                            price: state.cartEntity.products?[index].price??0,
                            quantity: state.cartEntity.products?[index].count??0,
                            onDeleteTap: () {
                                context.read<CartCubit>().removeSpecificProduct(state.cartEntity.products?[index].product?.id??'');
                            },
                            onDecrementTap: (value) {},
                            onIncrementTap: (value) {},
                            size: 40,
                            color: Colors.black,
                            colorName: 'black',
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: AppSize.s12.h),
                      itemCount: state.cartEntity.products!.length,
                    ),
                  ),
                  // the total price and checkout button========
                  TotalPriceAndCheckoutBotton(
                    totalPrice: state.cartEntity.totalCartPrice??0,
                    checkoutButtonOnTap: () {
                        context.read<CartCubit>().clearCart();
                    },
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            );

          }if(state is CartError){
            return Center(child: Text(state.message??'Failed To Get Product'),);
          }
        return Center(child:CircularProgressIndicator(color: ColorManager.primary,) );
        },
      ),

);
  }
}
