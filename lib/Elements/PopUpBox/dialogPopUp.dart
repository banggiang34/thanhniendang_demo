import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String btnText;
  final Function callBack;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.btnText,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff6A6A6A),
          ),
        ),
      ),
      actions: [
        Container(
          width: 190,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              callBack();
            },
            child: Text(btnText),
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              primary: const Color(0xff0269E9),
              onPrimary: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
