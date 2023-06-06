import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/recipe_card.dart';



class IngredientsView extends StatelessWidget {
  final String ingredient;
  const IngredientsView({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          ingredient,
          style: TextStyles(context).black_30_w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: DataList.recipes.where((element) => element.ingredients.any((element) => element.contains(ingredient))).map((e) 
              => RecipeCard(recipe: e),
            ).toList(),
          ),
        ),
      ),
    );
  }
}