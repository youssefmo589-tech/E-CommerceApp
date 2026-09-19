import 'package:flutter/material.dart';

import '../core/Theme/AppColors/AppColors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hinttext;

  final Widget prefixIcon;

  bool obsecuretext;

  final Widget? suffixIcon;

  TextEditingController controller;

  String? Function(String?)? validator;

  TextFieldWidget({
    required this.hinttext,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    super.key,
    this.validator,
    this.obsecuretext = false,
  });

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return TextFormField(
      obscureText: obsecuretext,
      style: theme.titleSmall?.copyWith(color: AppColors.black, fontSize: 16),
      autovalidateMode: AutovalidateMode.onUnfocus,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: theme.titleSmall?.copyWith(
          color: AppColors.darkgrey,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightgrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightgrey),
        ),
      ),
    );
  }
}
