import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/verticleTile.dart';
import 'mainscrollPage.dart';

class LatestNews extends StatelessWidget {
  final int index;
  final List<LatestNewsData> newsDataList;

  const LatestNews({
    required this.index,
    required this.newsDataList,
  });

  @override
  Widget build(BuildContext context) {
    final newsData = newsDataList[index];
    return VerticleTile(
        imagePath: newsData.imagePath,
        title: newsData.title,
        time: newsData.time);
  }
}
