import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/constants/data_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'main_event.dart';
part 'main_state.dart';

const String favs = 'favors';
const String myrecipes = 'myrecip2';
class MainBloc extends Bloc<MainEvent, MainState> {

  MainBloc() : super(MainInitialState()) {
    on<GetMainEvent>(_getMain);
    on<SetFavoriteEvent>(_setFavorite);
    on<CreateRecipeEvent>(_createRecipe);
    on<EditRecipeEvent>(_editRecipe);
  }


  List<Recipe> favorites = [];
  List<MyRecipe> myRecipes = [];

  void _getMain(GetMainEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingState());
    await _getAllData();
    emit(GotSuccessMainState());
  }

  void _editRecipe(EditRecipeEvent event, Emitter<MainState> emit) async {
    emit(MainBlankState());
    final sl = await SharedPreferences.getInstance();
    List<String> data = [];
    myRecipes.removeWhere((element) => element.title == event.oldTitle);
    data.add(jsonEncode(event.recipe.toMap()));
    for(MyRecipe recipe in myRecipes){
      data.add(jsonEncode(recipe.toMap()));
    }
    await sl.setStringList(myrecipes, data);
    await _getAllData();
    
    emit(GotSuccessMainState());
  }


  void _createRecipe(CreateRecipeEvent event, Emitter<MainState> emit) async {
    emit(MainBlankState());
    final sl = await SharedPreferences.getInstance();
    List<String> data = [];
    if(myRecipes.any((element) => element.title == event.recipe.title)){
      myRecipes.removeWhere((element) => element.title == event.recipe.title);
    }else{
      data.add(jsonEncode(event.recipe.toMap()));
    }
    for(MyRecipe recipe in myRecipes){
      data.add(jsonEncode(recipe.toMap()));
    }
    await sl.setStringList(myrecipes, data);
    await _getAllData();
    
    emit(GotSuccessMainState());
  }


  void _setFavorite(SetFavoriteEvent event, Emitter<MainState> emit) async {
    emit(MainBlankState());
    final sl = await SharedPreferences.getInstance();
    List<String> data = [];
    if(isInFav(event.recipe)){
      favorites.removeWhere((element) => element.title == event.recipe.title);
    }else{
      data.add(jsonEncode(event.recipe.toMap()));
    }
    for(Recipe recipe in favorites){
      data.add(jsonEncode(recipe.toMap()));
    }
    await sl.setStringList(favs, data);
    await _getAllData();
    
    emit(GotSuccessMainState());
  }



  _getAllData() async{
    final sl = await SharedPreferences.getInstance();
    List<String>? list = sl.getStringList(favs);
    if(list != null){
      favorites = list.map((json) {
        print(json);
        return Recipe.fromJson(jsonDecode(json));
      }
      ).toList();
    } else{
      favorites = [];
    }



    List<String>? list2 = sl.getStringList(myrecipes);
    if(list2 != null){
      myRecipes = list2.map((json) {
        print(json);
        return MyRecipe.fromJson(jsonDecode(json));
      }
      ).toList();
    } else{
      myRecipes = [];
    }
  }

  bool isInFav(Recipe recipe){
    return favorites.any((element) => element.title == recipe.title);
  }
} 
