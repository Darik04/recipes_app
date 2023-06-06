part of 'main_bloc.dart';


abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class GetMainEvent extends MainEvent{}
class SetFavoriteEvent extends MainEvent{
  final Recipe recipe;
  SetFavoriteEvent({required this.recipe});
}

class CreateRecipeEvent extends MainEvent{
  final MyRecipe recipe;
  CreateRecipeEvent({required this.recipe});
}
class EditRecipeEvent extends MainEvent{
  final String oldTitle;
  final MyRecipe recipe;
  EditRecipeEvent({required this.recipe ,required this.oldTitle});
}