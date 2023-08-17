import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class BuildEmailBox extends StatefulWidget {
  const BuildEmailBox({required this.hinttext, required this.controller});

  final String hinttext;
  final TextEditingController controller;

  @override
  State createState() => _BuildEmailBoxState();
}

class _BuildEmailBoxState extends State<BuildEmailBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffDDDDDD).withOpacity(0.2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0269E9),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hinttext,
        hintStyle: TextStyle(
          color: Color(0xffA3A3A3),
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
      validator: (value) {
        if (!EmailValidator.validate(value!)) {
          return 'Địa chỉ email không đúng định dạng';
        }
        return null;
      },
    );
  }
}
