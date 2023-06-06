import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'recipe_widget.dart';

showModalRecipe(BuildContext context) {
  showMaterialModalBottomSheet(
    animationCurve: Curves.easeInOutQuint,
      elevation: 24,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.2),
      duration: Duration(milliseconds: 600),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.r),
        ),
      ),
      context: context,
      builder: (context) {
        return RecipeWidget();
      });
}

