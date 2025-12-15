import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key, required this.productCounter, required this.id});
  final int productCounter;
  final String id;

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.productCounter;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        if( current is UpdateCartCountSuccess ||
            current is UpdateCartCountErrorState||current is UpdateCartCountLoadingState){
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is UpdateCartCountErrorState&& widget.id ==context.read<CartCubit>().loadingProductId) {

          return Text(state.message ?? 'Failed To Update Quantity');
        }

        return Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (counter > 1) {
                    setState(() {
                      counter--;
                    });
                    context.read<CartCubit>().updateCartItemCount(counter, widget.id);
                  }
                },
                child: Icon(
                  Icons.remove_circle_outline,
                  size: 20.w,
                  color: ColorManager.white,
                ),
              ),
              SizedBox(width: 18.w),

              Text(
                '$counter',
                style: getMediumStyle(color: ColorManager.white)
                    .copyWith(fontSize: 18.sp),
              ),

              SizedBox(width: 18.w),

              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                  context.read<CartCubit>().updateCartItemCount(counter, widget.id);
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: ColorManager.white,
                  size: 20.w,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

