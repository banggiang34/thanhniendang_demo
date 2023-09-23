import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedTilesData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/UISection/gridSectionCampaign.dart';

class CampaignGridPage extends StatefulWidget {
  final Future<List<CategorizedTilesData>> Function() fetchDataOnGoing;
  final Future<List<CategorizedTilesData>> Function() fetchDataComingSoon;
  final Future<List<CategorizedTilesData>> Function() fetchDataFinished;
  final Widget blankPage;

  const CampaignGridPage({
    Key? key,
    required this.fetchDataOnGoing,
    required this.fetchDataComingSoon,
    required this.fetchDataFinished,
    required this.blankPage,
  });

  @override
  State<CampaignGridPage> createState() => _CampaignGridPageState();
}

class _CampaignGridPageState extends State<CampaignGridPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<CategorizedTilesData>? dataOnGoing;
  List<CategorizedTilesData>? dataComingSoon;
  List<CategorizedTilesData>? dataFinished;
  bool isLoadingOnGoing = true;
  bool isLoadingComingSoon = true;
  bool isLoadingFinished = true;

  List<String> pageNames = ["Đang diễn ra", "Sắp diễn ra", "Đã kết thúc"];

  double _blueBoxLeft = 0.0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;

        _blueBoxLeft = _currentPage *
            (MediaQuery.of(context).size.width / pageNames.length);
      });
    });

    fetchData(1);
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
        title: Text(
          'Đợt tình nguyện',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xff1F1F1F),
          ),
        ),
        backgroundColor: Color(0xffFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (var i = 0; i < pageNames.length; i++)
                        GestureDetector(
                          onTap: () {
                            // Animate to the selected page with a smooth transition
                            _pageController.animateToPage(
                              i,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pageNames[i],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _currentPage == i
                                    ? Colors.white
                                    : Color(0xff1F1F1F),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: _blueBoxLeft,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xff0269E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        pageNames[_currentPage],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                // PageView
                PageView(
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
