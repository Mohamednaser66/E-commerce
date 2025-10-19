import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/entities/brand_entity/BrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key,required this .brandEntity});
 final BrandEntity? brandEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 80.h,
          width: 80.w,
          fit: BoxFit.cover,
          imageUrl: brandEntity?.image??'',
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}


