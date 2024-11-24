import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_balina_soft/src/core/text_fields_validations.dart';
import 'package:test_task_balina_soft/src/core_ui/widgets/dialog/app_dialog.dart';
import 'package:test_task_balina_soft/src/features/main_screen/home_page.dart';
import 'package:test_task_balina_soft/src/features/registr_screen/bloc/registration_bloc.dart';

import '../../core/models/registration_model.dart';
import '../../core_ui/widgets/base_text_field/base_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _repeatPasswordTextController;
  final _logKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  final _repPassKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _repeatPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    _repeatPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccessState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
          if (state is RegistrationErrorState) {
            createDialogMessage(context, state.message);
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                baseTextField(
                    controller: _loginTextController,
                    hint: 'Login',
                    key: _logKey,
                    validator: loginValidator,
                    isObscureText: true),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: baseTextField(
                      controller: _passwordTextController,
                      hint: '******',
                      key: _passKey,
                      validator: passwordValidator,
                      isObscureText: true),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: baseTextField(
                      controller: _repeatPasswordTextController,
                      hint: '******',
                      key: _repPassKey,
                      validator: (text) => text != _passwordTextController.text
                          ? "Пароли не совпадают"
                          : null,
                      isObscureText: true),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: 350,
                    child: Builder(builder: (context) {
                      return TextButton(
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.green)),
                          onPressed: () {
                            final login = _loginTextController.text;
                            final password = _passwordTextController.text;
                            if (validate()) {
                              context.read<RegistrationBloc>().add(
                                  OnRegistrationEvent(
                                      RegistrationModel(login, password)));
                            }
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.white),
                          ));
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    final loginValidate = _logKey.currentState?.validate();
    final passwordValidate = _passKey.currentState?.validate();
    final repeatPasswordValidate = _repPassKey.currentState?.validate();
    return loginValidate! && passwordValidate! && repeatPasswordValidate!;
  }
}
