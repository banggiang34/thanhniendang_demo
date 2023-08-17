import 'package:flutter/material.dart';

class HighLightNews extends StatelessWidget {
  const HighLightNews(
      {super.key, required this.imagePath, required this.articleName});

  final String imagePath;
  final String articleName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  //border: Border.all(color: Colors.white, width: 15),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xff00A9F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset('images/star.png'),
                    SizedBox(width: 5),
                    Text(
                      'Tin nổi bật',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            articleName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
