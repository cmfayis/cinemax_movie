
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class NavigateState extends HomeState {
    final Trending movie;
  NavigateState({
    required this.movie,
  });
}
class NavigateTopRateState extends HomeState {
    final Trending movie;
  NavigateTopRateState({
    required this.movie,UpComing
  });
}
class NavigateUpComingState extends HomeState {
    final Trending movie;
  NavigateUpComingState({
    required this.movie,UpComing
  });
}
class NavigateTvShowState extends HomeState {
    final TvShow movie;
  NavigateTvShowState({
    required this.movie,UpComing
  });
}
class NavigateToSimilar extends HomeState {
    final movie;
  NavigateToSimilar({
    required this.movie,UpComing
  });
}