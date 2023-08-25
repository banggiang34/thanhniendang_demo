import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticleTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;

  const VerticleTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 130,
              //height: 150,
              child: Stack(
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(imagePath),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              children: [
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset('images/calendar1.png'),
                      ),
                      SizedBox(width: 5),
                      Text(
                        time,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
