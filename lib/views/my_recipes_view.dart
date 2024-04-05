import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/modals/recipe_modal.dart';
import 'package:recipes_app/widgets/myrecipe_card.dart';
import 'package:recipes_app/widgets/recipe_card.dart';



class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'МЕНІҢ РЕЦЕПТЕРІМ',
          style: TextStyles(context).black_30_w300,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: (){
          showModalRecipe(context);
        },
        child: Container(
          height: 60.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            border: Border.all(color: ColorStyles.greyf1f1, width: 1.w),
            borderRadius: BorderRadius.circular(15.r),
            color: ColorStyles.primary,
            boxShadow: [
              BoxShadow(
                color: ColorStyles.pink,
                blurRadius: 8.w
              )
            ]
          ),
          alignment: Alignment.center,
          child: Text('Рецепт жасаңыз', style: TextStyles(context).white_25_w800.copyWith(fontWeight: FontWeight.w400),)
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if(state is MainLoadingState || state is MainInitialState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(bloc.myRecipes.isEmpty){
            return Center(
              child: Text(
                'Бұл жерде әлі бос!',
                style: TextStyles(context).black_20_w300,
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...bloc.myRecipes.map(
                    (e) => MyRecipeCard(recipe: e)
                  ).toList(),
                  SizedBox(height: 100.h,)
                ]
              ),
            ),
          );
        }
      ),
    );
  }
}