import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class PrevBtn extends StatelessWidget {
  const PrevBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 110),
      onPressed: () => Navigator.pop(context),
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: ColorStyles.grey888,
          borderRadius: BorderRadius.circular(100.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15.w,
            ),
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.w,
            )
          ],

        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: SvgPicture.string('<svg width="16" height="29" viewBox="0 0 16 29" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14 27L2 14.5L14 2" stroke="white" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></svg>'),
        )
      ),
    );
  }
}