import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/views/ingredients_view.dart';



class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.w,
      children: DataList.ingredients.map((e) 
        => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => IngredientsView(ingredient: e,)));

          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: ColorStyles.grey888, width: 1.w),
              borderRadius: BorderRadius.circular(15.r)
            ),
            child: Text(
              e,
              style: TextStyles(context).black_14_w300,
            ),
          ),
        )
      ).toList()
    );
  }
}