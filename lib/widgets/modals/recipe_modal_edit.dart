import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/data_list.dart';

import 'recipe_widget_edit.dart';

showModalRecipeEdit(BuildContext context, MyRecipe recipe) {
  showModalBottomSheet(
    // animationCurve: Curves.easeInOutQuint,
      elevation: 24,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.2),
      // duration: Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.r),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return RecipeWidgetEdit(recipe: recipe,);
      });
}

