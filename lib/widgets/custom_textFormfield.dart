// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String validateName;

  final Icon? icon;
  final Icon? iconEnd;
  final bool isPassword; // خاصية لتحديد ما إذا كان حقل كلمة مرور
  TextEditingController? textEditingController = TextEditingController();
  final FormFieldValidator<String>? validator;
  TextInputType? keyboardType;
  CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.icon,
    required this.iconEnd,
    this.isPassword = false,
    this.validateName = "name", // القيمة الافتراضية هي false
    required this.validator,
    this.keyboardType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  // حالة لإظهار أو إخفاء كلمة المرور
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      // autovalidateMode: AutovalidateMode.always,
      validator: widget.validator,
      controller: widget.textEditingController,

      obscureText: widget.isPassword
          ? _obscureText
          : false, // إذا كان حقل كلمة مرور، استخدم _obscureText
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // تغيير حالة الإخفاء
                  });
                },
              )
            : widget.iconEnd, // إظهار أيقونة النهاية إذا لم يكن حقل كلمة مرور
        contentPadding:
            const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
      ),
    );
  }
}
