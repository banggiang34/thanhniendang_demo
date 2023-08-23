import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalTile extends StatelessWidget {
  final String imagePath;
  final String categoryimagePath;
  final String category;
  final String title;
  final String date;
  final String todate;
  final String time;

  const HorizontalTile({
    super.key,
    required this.imagePath,
    required this.categoryimagePath,
    required this.category,
    required this.title,
    required this.date,
    required this.todate,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      //height: 100000,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              //width: 185,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Stack(
                  children: [
                    Image.asset(imagePath, fit: BoxFit.fill),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 160,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xff00B191),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Image.asset(categoryimagePath),
                                SizedBox(width: 3),
                                Center(
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 3, right: 3),
              width: 175,
              //height: 13,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: SizedBox(height: 5)),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Flexible(child: SizedBox(height: 10)),
                    Row(
                      children: [
                        Image.asset('images/calendar1.png'),
                        SizedBox(width: 3),
                        Text(
                          'Từ ' + date + ' đến ' + todate,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9B9B9B),
                          ),
                        ),
                      ],
                    ),
                    Flexible(child: SizedBox(height: 10)),
                    Visibility(
                      visible: time.isNotEmpty, // Check if time is not blank
                      child: Row(
                        children: [
                          Image.asset('images/clock1.png'),
                          SizedBox(width: 3),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9B9B),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
