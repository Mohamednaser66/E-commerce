import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/wish_list_view_model/wish_list_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/cart_product_view_model/cart_product_state.dart';
import 'package:ecommerce_app/features/product_details/presentation/cart_product_view_model/cart_product_view_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatefulWidget {
  final ProductEntity product;

  const CustomProductWidget({super.key, required this.product});

  @override
  State<CustomProductWidget> createState() => _CustomProductWidgetState();
}

class _CustomProductWidgetState extends State<CustomProductWidget> {


  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }
  @override

  @override
  Widget build(BuildContext context) {
  return  InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.productDetails),
        child: Container(
          width: 190.w,
          height: 260.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.primary.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // CachedNetworkImage(
                    //   imageUrl: product.imageCover??'',
                    //   height: 128.h,
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    //   placeholder: (context, url) =>
                    //       const Center(child: CircularProgressIndicator()),
                    //   errorWidget: (context, url, error) => const Icon(Icons.error),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r)),
                      child: Image.network(
                        width: double.infinity,
                        widget.product.imageCover ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),

                    BlocConsumer<WishListCubit, WishListState>(
  listener: (context, state) {
    if(state is EditWishListSuccess){
     ToastMessage.showToastMessage('successful operation', ColorManager.white);
    }if(state is EditWishListError){
     ToastMessage.showToastMessage(state.message??'failed operation', Colors.red);
    }
    },

  builder: (context, state) {
    final cubit = context.read<WishListCubit>();

    return Positioned(
                        top: 8.h,
                        right: 10.h,
                        child:state is EditWishListLoading&& cubit.loadingProductId==widget.product.id? Center(child: CircularProgressIndicator(color: ColorManager.primary,),)
     :HeartButton(
                          id: widget.product.id!,
                            onTap:  (bool isFav) {

    context
        .read<WishListCubit>()
        .editWishList(widget.product.id ?? '',isFav);
    },
     )

);
  },
)

                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        truncateTitle(widget.product.title ?? ''),
                        style: getMediumStyle(
                          color: ColorManager.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        truncateDescription(
                          widget.product.description ?? '',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getRegularStyle(
                          color: ColorManager.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: 160.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EGP ${widget.product.price}",
                              style: getRegularStyle(
                                color: ColorManager.textColor,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "EGP ${widget.product.priceAfterDiscount ?? widget.product.price}",
                              style: getTextWithLine(),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: height * 0.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // width: width * 0.22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Review (${widget.product.ratingsQuantity})",
                                  style: getRegularStyle(
                                    color: ColorManager.textColor,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                const Icon(
                                  Icons.star_rate_rounded,
                                  color: ColorManager.starRateColor,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                BlocConsumer<CartProductViewModel, CartState>(
                                    listener: (context, state) {
                              if (state is AddCartSuccessState ) {
                                ToastMessage.showToastMessage(state.cartEntity.message??'',ColorManager.black);
                              }else if(state is AddCartErrorState ){
                                ToastMessage.showToastMessage(state.errorMessage, Colors.black);
                              }
                            }, builder: (context, state) {
                             var cubit = context.read<CartProductViewModel>();
                              return InkWell(
                                onTap: () {

                               BlocProvider.of<CartProductViewModel>(context).AddToCart(widget.product.id??'');
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.primary,
                                  ),
                                  child: state is AddToCartLoadingState&& cubit.currentId==widget.product.id
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                ),
                              );
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );


  }
}
