import 'package:flutter/material.dart';

class BuildLogSignInBtn extends StatelessWidget {
  final String labeltext;
  final Function callback;
  const BuildLogSignInBtn({required this.labeltext, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => callback(),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: const Color(0xff0269E9),
            foregroundColor: Colors.white,
            elevation: 0),
        child: Text(labeltext),
      ),
    );
  }
}
