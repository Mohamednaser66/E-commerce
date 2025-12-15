import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/cart_product_view_model/cart_product_view_model.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/features/product_details/presentation/cart_product_view_model/cart_product_state.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key,required this.product});
final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {
                  Navigator.pushNamed(context, Routes.cartRoute);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             ProductSlider(images: product.images!,id: product.id??'',),
            SizedBox(
              height: 24.h,
            ),
             ProductLabel(
                productName: product.title??'', productPrice: 'EGP ${product.price}'),
            SizedBox(
              height: 16.h,
            ),
             ProductRating(
                productBuyers: '${product.sold}', productRating: '${product.ratingsQuantity}'),
            SizedBox(
              height: 16.h,
            ),
             ProductDescription(
                productDescription:
                    '${product.description}'),
            ProductSize(
              size:  [35, 38, 39, 40],
              onSelected: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('Color',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 18.sp)),
            ProductColor(color: const [
              Colors.red,
              Colors.blueAccent,
              Colors.green,
              Colors.yellow,
            ], onSelected: () {}),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('EGP ${product.price}',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                BlocListener<CartProductViewModel,AddCartState>(
                  listener: (context, state) {
                if(state is AddCartErrorState){
                  ToastMessage.showToastMessage(state.errorMessage, ColorManager.black);
                }if(state is AddCartSuccessState){
                  ToastMessage.showToastMessage('Added Successfully', ColorManager.primary);
                }
                    },
                  child: CustomElevatedButton(
                  label: 'Add to cart',
                  onTap: () {
                    context.read<CartProductViewModel>().AddToCart(product.id??'');
                  },
                  prefixIcon: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: ColorManager.white,
                  ),
                ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
