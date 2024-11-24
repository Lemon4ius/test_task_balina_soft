import 'package:flutter/material.dart';

Widget baseTextField(
    {required GlobalKey key,
    required TextEditingController controller,
    required String hint,
    required Function(String? text) validator,
    required isObscureText}) {
  return SizedBox(
      height: 30,
      width: 350,
      child: Form(
        key: key,
        child: TextFormField(
          obscureText: isObscureText,
          controller: controller,
          validator: (value) => validator(value),
          decoration: InputDecoration(
              hintText: hint,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
          cursorColor: Colors.green,
        ),
      ));
}
