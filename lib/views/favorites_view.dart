import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/bloc/main/main_bloc.dart';
import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/widgets/ingredients_widget.dart';
import 'package:recipes_app/widgets/recipe_card.dart';



class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'ИЗБРАННОЕ',
          style: TextStyles(context).black_30_w300,
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if(state is MainLoadingState || state is MainInitialState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(bloc.favorites.isEmpty){
            return Center(
              child: Text(
                'Здесь пока пусто!',
                style: TextStyles(context).black_20_w300,
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bloc.favorites.map(
                  (e) => RecipeCard(recipe: e)
                ).toList(),
              ),
            ),
          );
        }
      ),
    );
  }
}