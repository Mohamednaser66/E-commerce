import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_cubit/main_lay_out_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_cubit/main_lay_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
   var categories= context.read<MainLayoutCubit>().getCategory();
      });
  }

  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p12),
      child: Row(
        children: [
        BlocBuilder<MainLayoutCubit,CategoryState>(
      buildWhen: (previous, current) {
        if(current is CategorySuccessState ||current is CategoryErrorState ||current is CategoryLoadingState ){
          return true;
        }
        return false;
      },
      builder: (context,state) {
        if(state is CategorySuccessState){
          return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.containerGray,
                  border: Border(
                    // set the border for only 3 sides
                      top: BorderSide(
                          width: AppSize.s2,
                          color: ColorManager.primary.withOpacity(0.3)),
                      left: BorderSide(
                          width: AppSize.s2,
                          color: ColorManager.primary.withOpacity(0.3)),
                      bottom: BorderSide(
                          width: AppSize.s2,
                          color: ColorManager.primary.withOpacity(0.3))),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s12),
                    bottomLeft: Radius.circular(AppSize.s12),
                  ),
                ),

                // the categories items list
                child: ClipRRect(
                  // clip the corners of the container that hold the list view
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s12),
                    bottomLeft: Radius.circular(AppSize.s12),
                  ),
                  child: ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => CategoryItem(index,state.categories[index].name??'', selectedIndex == index, onItemClick,state.categories[index].id??''),
                  ),
                ),
              ));
        }if(state is CategoryErrorState){
          return Center(child: Text(state.errorMessage,style: TextStyle(color: ColorManager.black),),);
        }
        return Center(child: CircularProgressIndicator(color: ColorManager.black,),);

      }
      ),
          SizedBox(
            width: AppSize.s16,
          ),
          SubCategoriesList()
        ],
      ),
    );
  }
  onItemClick(int index,String id) {
     context.read<MainLayoutCubit>().getSubCategories(id);
    setState(() {
      selectedIndex = index;
    });
  }
}
