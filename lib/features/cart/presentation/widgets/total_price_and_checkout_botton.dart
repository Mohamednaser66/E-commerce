import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/cart/presentation/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceAndCheckoutButton extends StatefulWidget {
   TotalPriceAndCheckoutButton(
      {super.key, required this.totalPrice,required this.cartId});

   int totalPrice;
 final String cartId;


  @override
  State<TotalPriceAndCheckoutButton> createState() => _TotalPriceAndCheckoutButtonState();
}

class _TotalPriceAndCheckoutButtonState extends State<TotalPriceAndCheckoutButton> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total price ==================================
            Text(
              'Total price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.textColor.withOpacity(0.6),
                fontSize: AppSize.s18.sp,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 90.w,
              child: Text(
                'EGP ${widget.totalPrice}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getMediumStyle(
                  color: ColorManager.textColor,
                  fontSize: AppSize.s18.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 18.h),

        Expanded(
          child: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if(state is CheckOutError){
                showDialog(context: context, builder: (context) => CupertinoAlertDialog(title: Text(state.message??'Failed'),),);
              }if(state is CheckOutSuccess){
               context.read<CartCubit>().launchMyUrl(state.response.session!.url??'');
              }
            },
            buildWhen: (previous, current) {
              if(current is CheckOutError|| current is CheckOutSuccess|| current is CheckOutLoading){
                return true;
              }return false;
            },
            builder: (context, state) {
              return state is CheckOutLoading ? Center(child: CircularProgressIndicator(),):CustomElevatedButton(
                label: 'Check Out',
                onTap:(){
                  context.read<CartCubit>().checkOut(widget.cartId);
                },
                suffixIcon: Icon(
                  Icons.arrow_forward,
                  color: ColorManager.white,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
