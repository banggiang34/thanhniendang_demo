import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuildLogSignInBtn extends StatelessWidget {
  final String labeltext;
  final Function callback;
  const BuildLogSignInBtn({required this.labeltext, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => callback(),
        child: Text(labeltext),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          primary: Color(0xff0269E9),
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
