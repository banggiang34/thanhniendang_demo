import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Data/Campaigns/campaignDetailData.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedTilesData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/Page/detailCampaignPage.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/horizontalTile.dart';
import 'package:thanh_nien_da_nang/Data/Campaigns/fetchDataDetailCampaign.dart';

class HorizontalScrollSectionCampaign extends StatefulWidget {
  final Future<List<CategorizedTilesData>> Function() fetchData;

  HorizontalScrollSectionCampaign({required this.fetchData});

  @override
  _HorizontalScrollSectionCampaignState createState() =>
      _HorizontalScrollSectionCampaignState();
}

class _HorizontalScrollSectionCampaignState
    extends State<HorizontalScrollSectionCampaign> {
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

  Future<CampaignDetailData> fetchCampaignData(int id) async {
    final contestData = await fetchDataDetailCampaign.fetchDataById(id);
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
                    fetchCampaignData(id).then((contestData) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailCampaignPage(
                            id: id,
                            campaignData: contestData,
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
