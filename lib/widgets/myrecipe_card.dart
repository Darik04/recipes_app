import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/toasts.dart';

import 'modals/recipe_modal_edit.dart';



class MyRecipeCard extends StatelessWidget {
  final MyRecipe recipe;
  const MyRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return GestureDetector(
      onTap: (){
        showModalRecipeEdit(context, recipe);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15.h),
            decoration: BoxDecoration(
              border: Border.all(color: ColorStyles.greyf1f1, width: 1.w),
              borderRadius: BorderRadius.circular(15.r),
              color: ColorStyles.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8.w
                )
              ]
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                Text(
                  recipe.title,
                  style: TextStyles(context).black_18_w800,
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: ColorStyles.grey888,
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                ),
                Text(
                  recipe.description,
                  style: TextStyles(context).black_18_w300,
                ),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      DateFormat('MMM d, HH:mm').format(recipe.createdAt),
                      style: TextStyles(context).black_18_w300.copyWith(color: ColorStyles.primary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
              ],
            )
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                bloc.add(CreateRecipeEvent(recipe: recipe));
                showAlertToast('Успешно удалили рецепт!');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 40.w), 
                decoration: BoxDecoration(
                  color: ColorStyles.pink,
                  border: Border.all(width: 1.w, color: ColorStyles.pink),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  )
                ),
                child: SvgPicture.asset('assets/svg/delete.svg', color: ColorStyles.white, width: 20.w,),
              ),
            )
          )
        ],
      ),
    );
  }
}