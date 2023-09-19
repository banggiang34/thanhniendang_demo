import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/verticalTile.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/detailNewsPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsTilesData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/fetchDataDetailNews.dart';

class VerticalScrollSectionNews extends StatefulWidget {
  final List<NewsTilesData> newsDataList;

  const VerticalScrollSectionNews({Key? key, required this.newsDataList})
      : super(key: key);

  @override
  State<VerticalScrollSectionNews> createState() =>
      _VerticalScrollSectionNewsState();
}

class _VerticalScrollSectionNewsState extends State<VerticalScrollSectionNews> {
  List<Widget> buildVerticalTiles(List<NewsTilesData> dataList) {
    return dataList.map(
      (data) {
        return GestureDetector(
          onTap: () {
            int id = data.id;
            FetchDataDetailNews.fetchDataById(id).then((newsData) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailNewsPage(
                    id: id,
                    newsData: newsData,
                  ),
                ),
              );
            });
          },
          child: VerticalTile(
            title: data.title,
            imagePath: data.imagePath,
            time: data.time,
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildVerticalTiles(widget.newsDataList),
    );
  }
}
