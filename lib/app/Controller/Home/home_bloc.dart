import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/app/Model/Tvshow.dart';
import 'package:movieapp/app/Model/trending.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateEvent>((event, emit) {
      emit(NavigateState(movie: event.movie));
    });
    on<NavigateTopRatedEvent>((event, emit) {
      emit(NavigateTopRateState(movie: event.movie));
    });
    on<NavigateUpComingEvent>((event, emit) {
      emit(NavigateUpComingState(movie: event.movie));
    });
     on<NavigateTvShowEvent>((event, emit) {
      emit(NavigateTvShowState(movie: event.movie));
    });
  }
}
