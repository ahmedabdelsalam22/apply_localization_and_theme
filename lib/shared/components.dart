import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_manager.dart';

Widget defaultTextButton({required Function onPressed, required String text}) {
  return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(color: ColorManager.primary),
      ));
}

Widget defaultButton({
  double width = double.infinity,
  double height = 55,
  Color background = Colors.deepOrange,
  required Function onPressed,
  required String text,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: background, borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget buildTextFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefixIcon,
  required bool obscureText,
  Widget? suffix,
  Function? onSubmit,
}) {
  return TextFormField(
    cursorColor: ColorManager.primary,
    controller: controller,
    obscureText: obscureText,
    keyboardType: inputType,
    validator: validate,
    onFieldSubmitted: (s) {
      onSubmit!(s);
    },
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: ColorManager.primary),
      prefixIcon: Icon(
        prefixIcon,
        color: ColorManager.primary,
      ),
      border: const OutlineInputBorder(),
      suffixIcon: suffix,
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary)),
    ),
  );
}

void showToast({required String message, required Color color}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
