import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_balina_soft/src/core/models/registration_model.dart';
import 'package:test_task_balina_soft/src/core/text_fields_validations.dart';
import 'package:test_task_balina_soft/src/core_ui/widgets/base_text_field/base_text_field.dart';
import 'package:test_task_balina_soft/src/core_ui/widgets/dialog/app_dialog.dart';

import '../main_screen/home_page.dart';
import 'bloc/auth_bloc.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;
  final logKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
          if (state is AuthErrorState) {
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
                    key: logKey,
                    controller: _loginTextController,
                    hint: 'Login',
                    validator: loginValidator,
                    isObscureText: false),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: baseTextField(
                      key: passKey,
                      controller: _passwordTextController,
                      hint: '******',
                      validator: passwordValidator,
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
                            final loginText = _loginTextController.text;
                            final passwordText = _passwordTextController.text;
                            if (validate()) {
                              context.read<AuthBloc>().add(OnLoginAuthEvent(
                                  RegistrationModel(loginText, passwordText)));
                            }
                          },
                          child: const Text(
                            'LOG IN',
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
    final logValidate = logKey.currentState?.validate();
    final passValidate = passKey.currentState?.validate();
    return logValidate! && passValidate!;
  }
}
