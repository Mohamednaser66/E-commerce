import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:ecommerce_app/features/cart/data/models/Products.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/color_and_size_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.color,
    required this.colorName,
    required this.size,
    required this.onDeleteTap,
    required this.product
  });

  final Color color;
  final String colorName;
  final int size;
  final void Function() onDeleteTap;
  final Products product;


  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: isPortrait ? height * 0.14 : width * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(children: [
        // display image in the container
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
          ),
          child:  CachedNetworkImage(
            height: height*0.14,
            imageUrl:widget.product.product!.imageCover! ,

            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),

        ),
    Expanded(
    child: Padding(
    padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // title and delete button ==
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.product?.title??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: widget.onDeleteTap,
                      child: Image.asset(
                        IconsAssets.icDelete,
                        color: ColorManager.textColor,
                        height: 22.h,
                      ),
                    )
                  ],
                ),

                // SizedBox(height: 7.h),
                const Spacer(),
                // display color and size===================
                ColorAndSizeCartItem(
                  color: widget.color,
                  colorName: widget.colorName,
                  size: widget.size,
                ),
                const Spacer(),
                // display price and quantity =================
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${widget.product.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    ProductCounter(
                      id: widget.product.id??'',
                      productCounter: widget.product.product!.quantity!,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
