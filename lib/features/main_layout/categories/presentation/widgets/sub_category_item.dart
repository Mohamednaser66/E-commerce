import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final Function navigation;
  const SubCategoryItem(this.title, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreenRoute),
      overlayColor: WidgetStateProperty.all(Colors.transparent),


           child: Container(
             padding: REdgeInsets.all(2),
             alignment: Alignment.center,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12.r),
               border:Border.all(color: ColorManager.primary,width: 2.w)
             ),
             child: Text(
                title,
                style: getRegularStyle(color: ColorManager.primary),
              ),
           ),
         );


  }
}
