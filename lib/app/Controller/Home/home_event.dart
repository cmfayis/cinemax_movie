
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class NavigateEvent extends HomeEvent {
  final Trending movie;
  NavigateEvent({
    required this.movie,
  });
}
class NavigateTopRatedEvent extends HomeEvent {
  final Trending movie;
  NavigateTopRatedEvent({
    required this.movie,
  });
}
class NavigateUpComingEvent extends HomeEvent {
  final Trending movie;
  NavigateUpComingEvent({
    required this.movie,
  });
  
}
class NavigateTvShowEvent extends HomeEvent {
  final TvShow movie;
  NavigateTvShowEvent({
    required this.movie,
  });
  
}
class SimilarMoviesEvent extends HomeEvent {
  final Trending movie;
  SimilarMoviesEvent({
    required this.movie,
  });
  
}