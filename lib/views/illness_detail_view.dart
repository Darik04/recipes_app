import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/recipe_card.dart';

import '../bloc/main/main_bloc.dart';



class IllnessDetailView extends StatelessWidget {
  final Illness illness;
  const IllnessDetailView({super.key, required this.illness});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          illness.title,
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
                    illness.picture,
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
                      illness.title,
                      style: TextStyles(context).black_18_w700,
                    ),
                  )
                ),
              ],
            ),




            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h,),
                  Text(
                    'АУРУ ТУРАЛЫ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  Text(
                    illness.description,
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
                    'СЕБЕПТЕРІ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  ...illness.causes.map((e) 
                    => Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorStyles.black
                            ),
                            width: 10,
                            height: 10,
                          ),
                          // Text('${illness.solves.indexOf(e)+1}', style: TextStyles(context).black_35_w800,),
                          SizedBox(width: 15.w,),
                          Expanded(child: Text(e.textCapitalize, style: TextStyles(context).black_14_w300.copyWith(),)),
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
                    'СИМПТОМДАРЫ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  ...illness.symptoms.map((e) 
                    => Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorStyles.black
                            ),
                            width: 10,
                            height: 10,
                          ),
                          // Text('${illness.solves.indexOf(e)+1}', style: TextStyles(context).black_35_w800,),
                          SizedBox(width: 15.w,),
                          Expanded(child: Text(e.textCapitalize, style: TextStyles(context).black_14_w300.copyWith(),)),
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
                    'ШЕШУ ЖОЛДАРЫ',
                    style: TextStyles(context).black_20_w300,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h,),
                  ...illness.solves.map((e) 
                    => Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${illness.solves.indexOf(e)+1}', style: TextStyles(context).black_35_w800,),
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


extension StringExt on String{
  String get textCapitalize => this[0].toUpperCase() + substring(1);
}