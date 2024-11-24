import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task_balina_soft/src/features/auth_screen/repo_impl/auth_repo_impl.dart';

import '../../../core/error_model/error_response_model.dart';
import '../../../core/models/registration_data_model.dart';
import '../../../core/models/registration_model.dart';
import '../../../core/models/registration_user_credentials.dart';
import '../repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repo = AuthRepoImpl();
  AuthBloc() : super(AuthInitial()) {
    on<OnLoginAuthEvent>(onLogin);
  }

  FutureOr<void> onLogin(OnLoginAuthEvent event, Emitter<dynamic> emit) async{
    final data = await _repo.onLogin(event._registrationModel);
    if(data is RegistrationDataModel){
      emit(AuthLoggedState(data.data));
    }
    if(data is ErrorResponseModel){
      emit(AuthErrorState(data.message));
    }
  }
}
