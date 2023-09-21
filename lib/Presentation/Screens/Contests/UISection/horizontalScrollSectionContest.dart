import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedTilesData.dart';
import 'package:thanh_nien_da_nang/Data/Contests/contestDetailData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/Page/detailContestPage.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/horizontalTile.dart';
import 'package:thanh_nien_da_nang/Data/Contests/fetchDataDetailContest.dart';

class HorizontalScrollSectionContest extends StatefulWidget {
  final Future<List<CategorizedTilesData>> Function() fetchData;

  HorizontalScrollSectionContest({required this.fetchData});

  @override
  _HorizontalScrollSectionContestState createState() =>
      _HorizontalScrollSectionContestState();
}

class _HorizontalScrollSectionContestState
    extends State<HorizontalScrollSectionContest> {
  List<CategorizedTilesData> newsDataList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateUI();
  }

  Future<void> fetchDataAndUpdateUI() async {
    try {
      List<CategorizedTilesData> data = await widget.fetchData();
      setState(() {
        newsDataList = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<ContestDetailData> fetchContestData(int id) async {
    final contestData = await fetchDataDetailContest.fetchDataById(id);
    return contestData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 320,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsDataList.length,
              itemBuilder: (context, index) {
                CategorizedTilesData newsData = newsDataList[index];
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
                  callBack: () {
                    int id = newsData.id;
                    fetchContestData(id).then((contestData) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailContestPage(
                            id: id,
                            contestData: contestData,
                          ),
                        ),
                      );
                    });
                  },
                );
              },
            ),
    );
  }
}
