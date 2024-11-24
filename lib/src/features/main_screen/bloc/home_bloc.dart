import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_balina_soft/src/features/main_screen/repo/home_repo.dart';
import 'package:test_task_balina_soft/src/features/main_screen/repo_impl/home_repo_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _repo = HomeRepoImpl();
  HomeBloc() : super(HomeInitial()) {
    on<OnHomeInitialDataEvent>(onLoadData);
  }

  FutureOr<void> onLoadData(OnHomeInitialDataEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState(_repo.getUserData()));
  }
}
