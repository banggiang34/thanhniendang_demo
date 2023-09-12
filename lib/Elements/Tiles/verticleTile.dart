import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticleTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;

  const VerticleTile({
    required this.imagePath,
    required this.title,
    required this.time,
  });

  VerticleTile.withKey({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('conmeo');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: 130,
                //height: 150,
                child: Stack(
                  children: [
                    Image.network(imagePath, fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset('images/calendar1.png'),
                      const SizedBox(width: 5),
                      Text(
                        time,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
