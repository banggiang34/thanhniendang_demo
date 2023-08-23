import 'package:flutter/material.dart';

class BuildFillBox extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  const BuildFillBox({required this.hinttext, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(
              color: Color(0xffA3A3A3),
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xffDDDDDD).withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0269E9), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 20)),
      ),
    );
  }
}
