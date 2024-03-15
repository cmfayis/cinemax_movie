
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class NavigateState extends HomeState {
    final  movie;
  NavigateState({
    required this.movie,
  });
}


