import 'package:flutter/material.dart';

Widget text_input(TextEditingController controller , String hint , IconData data , bool obscure)
{
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      //labelText: 'Email',
      hintText: hint,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding:
      EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10),
      prefixIcon: Icon(
        data,
        color: Colors.grey,
      ),

    ),
    obscureText: obscure,
  );
}