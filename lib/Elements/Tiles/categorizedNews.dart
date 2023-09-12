import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/horizontalTile.dart';
import 'categorizedNewsData.dart';

class CategorizedNews extends StatelessWidget {
  final int index;
  final List<CategorizedNewsData> newsDataList;

  const CategorizedNews({
    required this.index,
    required this.newsDataList,
  });

  @override
  Widget build(BuildContext context) {
    final newsData = newsDataList[index];
    return HorizontalTile(
      id: newsData.id,
      imagePath: newsData.imagePath,
      categoryimagePath: newsData.categoryimagePath,
      category: newsData.category,
      title: newsData.title,
      date: newsData.date,
      todate: newsData.todate,
      time: newsData.time,
      joined: newsData.joined,
      callBack: newsData.callBack,
    );
  }
}
