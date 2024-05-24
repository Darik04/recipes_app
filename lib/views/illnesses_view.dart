import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/recipe_card.dart';

import '../widgets/illness_card.dart';



class IllnessesView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Аурулар',
          style: TextStyles(context).black_30_w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: DataList.illnesses.map((e) 
              => IllnessCard(illness: e,),
            ).toList(),
          ),
        ),
      ),
    );
  }
}