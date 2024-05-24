import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/views/illness_detail_view.dart';



class IllnessCard extends StatelessWidget {
  final Illness illness;
  const IllnessCard({super.key, required this.illness});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => IllnessDetailView(illness: illness,)));
      },
      child: Container(
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
                illness.picture,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15.h,),
            Text(
              illness.title,
              style: TextStyles(context).black_18_w800,
              textAlign: TextAlign.center,
            ),
            Container(
              width: 40.h,
              height: 1.h,
              color: ColorStyles.grey888,
              margin: EdgeInsets.symmetric(vertical: 15.h),
            ),
            // Text(
            //   style: TextStyles(context).black_18_w300,
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(height: 15.h,),
          ],
        )
      ),
    );
  }
}