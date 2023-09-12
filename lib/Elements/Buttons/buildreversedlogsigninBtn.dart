import 'package:flutter/material.dart';

class BuildReversedLogSignInBtn extends StatelessWidget {
  final String labeltext;
  final Function callback;
  const BuildReversedLogSignInBtn(
      {required this.labeltext, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => callback(),
        child: Text(labeltext),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            primary: const Color(0xffEFF6FF),
            onPrimary: const Color(0xff0269E9),
            elevation: 0),
      ),
    );
  }
}
