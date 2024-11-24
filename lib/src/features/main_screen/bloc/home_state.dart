part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class HomeInitialState extends HomeState {
  final String userName;

  HomeInitialState(this.userName);
}
