import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_cubit/main_lay_out_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_cubit/main_lay_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<MainLayoutCubit,CategoryState>(

        builder: (context, state) {
          if(state is SubCategorySuccessState){
            return CustomScrollView(
              slivers: <Widget>[
                // category title
                SliverToBoxAdapter(
                ),
                // the category card
                SliverToBoxAdapter(
                  child: CategoryCardItem(
                      ImageAssets.categoryCardImage, goToCategoryProductsListScreen),
                ),
                // the grid view of the subcategories
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.subCategories.length,
                          (context, index) => SubCategoryItem(
                          state.subCategories[index].name??'',
                          goToCategoryProductsListScreen),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: AppSize.s8,
                      crossAxisSpacing: AppSize.s8,
                    ))
              ],
            );
          }   if(state is SubCategoryErrorState){
            return Center(child: Text(state.errorMessage),);
          }
          return Center(child:CircularProgressIndicator() ,);

          }

      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
