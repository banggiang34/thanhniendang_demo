import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Data/Campaigns/fetchDataDetailCampaign.dart';
import 'package:thanh_nien_da_nang/Elements/Buttons/oninoutGoingButton.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedTilesData.dart';
import 'package:thanh_nien_da_nang/Data/Campaigns/campaignDetailData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/UISection/gridSectionCampaign.dart';

class CampaignGridPage extends StatefulWidget {
  final Future<List<CategorizedTilesData>> Function() fetchDataOnGoing;
  final Future<List<CategorizedTilesData>> Function() fetchDataComingSoon;
  final Future<List<CategorizedTilesData>> Function() fetchDataFinished;
  final Widget blankPage;

  const CampaignGridPage(
      {Key? key,
      required this.fetchDataOnGoing,
      required this.fetchDataComingSoon,
      required this.fetchDataFinished,
      required this.blankPage});

  @override
  State<CampaignGridPage> createState() => _CampaignGridPageState();
}

class _CampaignGridPageState extends State<CampaignGridPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  late Future<List<CampaignDetailData>> campaignDetailFuture;

  List<CategorizedTilesData>? dataOnGoing;
  List<CategorizedTilesData>? dataComingSoon;
  List<CategorizedTilesData>? dataFinished;
  bool isLoadingOnGoing = true;
  bool isLoadingComingSoon = true;
  bool isLoadingFinished = true;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });

    fetchData(1);
  }

  Future<CampaignDetailData> fetchCampaignData(int id) async {
    final campaignData = await fetchDataDetailCampaign.fetchDataById(id);
    return campaignData;
  }

  Future<void> fetchData(int index) async {
    setState(() {
      switch (index) {
        case 1:
          isLoadingOnGoing = true;
          break;
        case 2:
          isLoadingComingSoon = true;
          break;
        case 3:
          isLoadingFinished = true;
          break;
      }
    });

    List<CategorizedTilesData>? data;
    switch (index) {
      case 1:
        data = await widget.fetchDataOnGoing();
        break;
      case 2:
        data = await widget.fetchDataComingSoon();
        break;
      case 3:
        data = await widget.fetchDataFinished();
        break;
    }

    setState(() {
      switch (index) {
        case 1:
          isLoadingOnGoing = false;
          dataOnGoing = data;
          break;
        case 2:
          isLoadingComingSoon = false;
          dataComingSoon = data;
          break;
        case 3:
          isLoadingFinished = false;
          dataFinished = data;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Đợt tình nguyện',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xff1F1F1F),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
            child: Center(
              child: OnInOutGoingButton(
                selectedButtonIndex: _currentPage,
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
                fetchData(index + 1);
              },
              children: [
                GridSectionCampaign(
                  loadingBoolean: isLoadingOnGoing,
                  dataList: dataOnGoing,
                  blankPage: widget.blankPage,
                ),
                GridSectionCampaign(
                  loadingBoolean: isLoadingComingSoon,
                  dataList: dataComingSoon,
                  blankPage: widget.blankPage,
                ),
                GridSectionCampaign(
                  loadingBoolean: isLoadingFinished,
                  dataList: dataFinished,
                  blankPage: widget.blankPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
