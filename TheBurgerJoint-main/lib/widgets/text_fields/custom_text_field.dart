import 'package:flutter/material.dart';

Widget CustomTextField({
  required TextEditingController controller,
  required String label,
  required FocusNode focus,
  required TextInputAction inputAction,
  required TextInputType textInputType,
  bool obsecureText = false,
  String? Function(String? val)? onValidate,
  Widget? suffixIcon,})
{
  return TextFormField(
    controller: controller,
    focusNode: focus,
    validator: onValidate,
    textInputAction: inputAction,
    keyboardType: textInputType,
    obscureText: obsecureText,
    style: TextStyle(color: Colors.white), 
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      label: Text(label),
      hintText: label,
      suffixIcon: suffixIcon,
    ),
  );
}
