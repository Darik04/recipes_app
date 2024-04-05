import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'recipe_widget.dart';

showModalRecipe(BuildContext context) {
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
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return RecipeWidget();
      });
}

