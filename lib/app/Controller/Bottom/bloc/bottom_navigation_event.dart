part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}
class TabChangeEvent extends BottomNavigationEvent {
  final int tabIndex;
  TabChangeEvent({
    required this.tabIndex,
  });
}