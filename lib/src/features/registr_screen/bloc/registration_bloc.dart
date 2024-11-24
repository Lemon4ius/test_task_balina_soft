import 'dart:async';

import 'package:bloc/bloc.dart';
import "package:meta/meta.dart";
import 'package:test_task_balina_soft/src/core/error_model/error_response_model.dart';
import 'package:test_task_balina_soft/src/features/registr_screen/repo/registration_repo.dart';
import 'package:test_task_balina_soft/src/features/registr_screen/repo_imple/registration_repo_imple.dart';

import '../../../core/models/registration_data_model.dart';
import '../../../core/models/registration_model.dart';
import '../../../core/models/registration_user_credentials.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepo _repo = RegistrationRepoImpl();
  RegistrationBloc() : super(RegistrationInitial()) {
    on<OnRegistrationEvent>(_onSendRegistrationData);
  }

  FutureOr<void> _onSendRegistrationData(OnRegistrationEvent event, emit) async{
    final data = await _repo.sendRegistrationData(event._registrationModel);
    if(data is RegistrationDataModel){
      emit(RegistrationSuccessState(data.data));
    }
    if(data is ErrorResponseModel){
      emit(RegistrationErrorState(data.message));
    }
  }
}
