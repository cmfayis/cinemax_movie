part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class NavigateEvent extends HomeEvent {
  final movie;
  NavigateEvent({
    required this.movie,
  });
}
