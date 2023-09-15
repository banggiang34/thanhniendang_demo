import 'package:flutter/material.dart';

class CloseBtn extends StatelessWidget {
  const CloseBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              'images/cross-small1.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
