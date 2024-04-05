import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/views/recipe_detail_view.dart';



class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => RecipeDetailView(recipe: recipe,)));
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    recipe.picture,
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.h,),
                Text(
                  recipe.title,
                  style: TextStyles(context).black_18_w800,
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 40.h,
                  height: 1.h,
                  color: ColorStyles.grey888,
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                ),
                Text(
                  recipe.category.title,
                  style: TextStyles(context).black_18_w300,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.h,),
              ],
            )
          ),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return Positioned(
                top: 10.h,
                left: 10.h,
                right: 10.h,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorStyles.white.withOpacity(0.85),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${recipe.ingredients.length} - ингредиент',
                        style: TextStyles(context).black_14_w300,
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
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
                    ],
                  ),
                ),

              );
            }
          )
        ],
      ),
    );
  }
}