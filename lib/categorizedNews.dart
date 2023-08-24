import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/horizontalTile.dart';

class CategorizedNews extends StatelessWidget {
  final String imagePath1;
  final String categoryimagePath1;
  final String category1;
  final String joined1;
  final String title1;
  final String date1;
  final String todate1;
  final String time1;
  final String imagePath2;
  final String categoryimagePath2;
  final String category2;
  final String joined2;
  final String title2;
  final String date2;
  final String time2;
  final String todate2;
  final String imagePath3;
  final String categoryimagePath3;
  final String category3;
  final String joined3;
  final String title3;
  final String date3;
  final String todate3;
  final String time3;
  final String imagePath4;
  final String categoryimagePath4;
  final String category4;
  final String joined4;
  final String title4;
  final String date4;
  final String todate4;
  final String time4;

  const CategorizedNews({
    super.key,
    required this.imagePath1,
    required this.categoryimagePath1,
    required this.category1,
    required this.joined1,
    required this.title1,
    required this.date1,
    required this.todate1,
    required this.time1,
    required this.imagePath2,
    required this.categoryimagePath2,
    required this.category2,
    required this.joined2,
    required this.title2,
    required this.date2,
    required this.todate2,
    required this.time2,
    required this.imagePath3,
    required this.categoryimagePath3,
    required this.category3,
    required this.joined3,
    required this.title3,
    required this.date3,
    required this.todate3,
    required this.time3,
    required this.imagePath4,
    required this.categoryimagePath4,
    required this.category4,
    required this.joined4,
    required this.title4,
    required this.todate4,
    required this.date4,
    required this.time4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 2500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HorizontalTile(
              imagePath: imagePath1,
              categoryimagePath: categoryimagePath1,
              category: category1,
              joined: joined1,
              title: title1,
              date: date1,
              todate: todate1,
              time: time1),
          SizedBox(width: 10),
          HorizontalTile(
              imagePath: imagePath2,
              categoryimagePath: categoryimagePath2,
              category: category2,
              joined: joined2,
              title: title2,
              date: date2,
              todate: todate2,
              time: time2),
          SizedBox(width: 10),
          HorizontalTile(
              imagePath: imagePath3,
              categoryimagePath: categoryimagePath3,
              category: category3,
              joined: joined3,
              title: title3,
              date: date3,
              todate: todate3,
              time: time3),
          SizedBox(width: 10),
          HorizontalTile(
              imagePath: imagePath4,
              categoryimagePath: categoryimagePath4,
              category: category4,
              joined: joined4,
              title: title4,
              date: date4,
              todate: todate4,
              time: time4),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
