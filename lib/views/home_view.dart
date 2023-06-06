import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/views/category_view.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/recipe_card.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'FORMULA',
          style: TextStyles(context).black_30_w300,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h,),
                  Text(
                    'ИНГЕРДИЕНТЫ',
                    style: TextStyles(context).black_20_w300,
                  ),
                  SizedBox(height: 15.h,),
                  IngredientsWidget(),
                  SizedBox(height: 30.h,),
                  Text(
                    'КАТЕГОРИЙ',
                    style: TextStyles(context).black_20_w300,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h-8.h,),
            SizedBox(
              height: 116.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: DataList.categories.map((e) 
                  => GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => CategoryView(category: e)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.w, top: 8.h, bottom: 8.h),
                      width: 100.h,
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
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
                            borderRadius: BorderRadius.circular(30.r),
                            child: Image.asset(
                              e.picture,
                              width: 55.w,
                              height: 55.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            e.title,
                            style: TextStyles(context).black_14_w300,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ),
                  )
                ).toList()
              ),
            ),
            SizedBox(height: 30.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ТОП РЕЦЕПТЫ',
                    style: TextStyles(context).black_20_w300,
                  ),
                  SizedBox(height: 15.h,),
                  ...DataList.recipes.map((e) 
                    => RecipeCard(recipe: e),
                  ).toList(),
                  SizedBox(height: 30.h,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}