import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/recipe_card.dart';

import '../bloc/main/main_bloc.dart';



class RecipeDetailView extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          recipe.title,
          style: TextStyles(context).black_18_w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                  child: Image.asset(
                    recipe.picture,
                    width: double.infinity,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 10.h,
                  right: 10.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: ColorStyles.white.withOpacity(0.8)
                    ),
                    child: Text(
                      recipe.title,
                      style: TextStyles(context).black_18_w700,
                    ),
                  )
                ),
                BlocBuilder<MainBloc, MainState>(
                  builder: (context, state) {
                    return Positioned(
                      top: 10.h,
                      right: 10.h,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: ColorStyles.white.withOpacity(0.8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            bloc.add(SetFavoriteEvent(recipe: recipe));
                          },
                          child: Icon(
                            bloc.isInFav(recipe)
                            ? Icons.favorite
                            : Icons.favorite_border,
                            color: ColorStyles.primary,
                          ),
                        )
                      ),

                    );
                  }
                )
              ],
            ),




            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h,),
                  Text(
                    'ОПИСАНИЕ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    recipe.description,
                    style: TextStyles(context).black_14_w300,
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    width: 120.h,
                    height: 1.h,
                    color: ColorStyles.grey888,
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'ИНГРЕДИЕНТЫ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  ...recipe.ingredients.map((e) 
                    => Container(
                      margin: EdgeInsets.only(bottom: 7.h),
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.w,
                            color: ColorStyles.greyColor
                          )
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.split(':')[0], style: TextStyles(context).black_14_w300,),
                          Text(e.split(':')[1], style: TextStyles(context).black_14_w700,),
                        ],
                      ),
                    )
                  ).toList(),
                  Container(
                    width: 120.h,
                    height: 1.h,
                    color: ColorStyles.grey888,
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'ШАГИ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  ...recipe.steps.map((e) 
                    => Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${recipe.steps.indexOf(e)+1}', style: TextStyles(context).black_35_w800,),
                          SizedBox(width: 15.w,),
                          Expanded(child: Text(e, style: TextStyles(context).black_14_w300,)),
                        ],
                      ),
                    )
                  ).toList(),
                  SizedBox(height: 60.h,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}