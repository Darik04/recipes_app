part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
  @override
  List<Object> get props => [];
}

class MainInitialState extends MainState {}
class MainLoadingState extends MainState {}
class MainErrorState extends MainState {
  final String message;
  MainErrorState({required this.message});
}

class GotSuccessMainState extends MainState{}
class MainBlankState extends MainState{}
