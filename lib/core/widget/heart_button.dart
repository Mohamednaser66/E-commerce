import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/wish_list_view_model/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartButton extends StatefulWidget {
  final void Function(bool)? onTap;
 final String id;

   HeartButton({super.key, required this.id,required this.onTap,});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String heartIcon = IconsAssets.icHeart;
  bool isClicked=false;
  void initState() {
    super.initState();  WidgetsBinding.instance.addPostFrameCallback((_) {
      isClicked = context.read<WishListCubit>().cheekIsFav(widget.id ?? '');


    });

    heartIcon = isClicked
        ? IconsAssets.icClickedHeart
        : IconsAssets.icHeart;
  }
  void _toggleHeart() {
    setState(() {
      isClicked = !isClicked;
      heartIcon =
      isClicked ? IconsAssets.icClickedHeart : IconsAssets.icHeart;
    });

    widget.onTap?.call(isClicked);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key:ValueKey(isClicked) ,
      // radius: 25,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () {
        setState(() {
          widget.onTap?.call(isClicked);
         isClicked = !isClicked;
          heartIcon =
          !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
        });
      },
      child: Material(
        // borderRadius: BorderRadius.circular(2),
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon(

              AssetImage(heartIcon),
              color: ColorManager.primary,
            )),
      ),
    );
  }
}
