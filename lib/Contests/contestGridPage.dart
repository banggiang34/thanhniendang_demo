import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Elements/Buttons/oninoutGoingButton.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/horizontalTile.dart';
import '../Elements/Tiles/categorizedNewsData.dart';
import 'package:thanh_nien_da_nang/Contests/fetchDataDetailContest.dart';
import 'package:thanh_nien_da_nang/Contests/contestDetailData.dart';
import 'package:thanh_nien_da_nang/Contests/detailContestPage.dart';

class ContestGridPage extends StatefulWidget {
  final Future<List<CategorizedNewsData>> Function() fetchData1;
  final Future<List<CategorizedNewsData>> Function() fetchData2;
  final Future<List<CategorizedNewsData>> Function() fetchData3;
  final Widget blankPage;

  const ContestGridPage(
      {Key? key,
      required this.fetchData1,
      required this.fetchData2,
      required this.fetchData3,
      required this.blankPage});

  @override
  State<ContestGridPage> createState() => _ContestGridPageState();
}

class _ContestGridPageState extends State<ContestGridPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  late Future<List<ContestDetailData>> contestDetailFuture;

  List<CategorizedNewsData>? data1;
  List<CategorizedNewsData>? data2;
  List<CategorizedNewsData>? data3;
  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;

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

  Future<ContestDetailData> fetchContestData(int id) async {
    final contestData = await fetchDataDetailContest.fetchDataById(id);
    return contestData;
  }

  Future<void> fetchData(int index) async {
    setState(() {
      switch (index) {
        case 1:
          isLoading1 = true;
          break;
        case 2:
          isLoading2 = true;
          break;
        case 3:
          isLoading3 = true;
          break;
      }
    });

    List<CategorizedNewsData>? data;
    switch (index) {
      case 1:
        data = await widget.fetchData1();
        break;
      case 2:
        data = await widget.fetchData2();
        break;
      case 3:
        data = await widget.fetchData3();
        break;
    }

    setState(() {
      switch (index) {
        case 1:
          isLoading1 = false;
          data1 = data;
          break;
        case 2:
          isLoading2 = false;
          data2 = data;
          break;
        case 3:
          isLoading3 = false;
          data3 = data;
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
          'Cuộc thi',
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
            child: OnInOutGoingButton(
              selectedButtonIndex: _currentPage,
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
                AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: isLoading1
                                  ? const CircularProgressIndicator()
                                  : (data1 == null || data1!.isEmpty)
                                      ? widget.blankPage
                                      : GestureDetector(
                                          child: SingleChildScrollView(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 0,
                                                  mainAxisSpacing: 0,
                                                  childAspectRatio: 99 / 185,
                                                ),
                                                itemCount: data1?.length ?? 0,
                                                itemBuilder: (context, index) {
                                                  final contest = data1![index];
                                                  return HorizontalTile(
                                                    id: contest.id,
                                                    imagePath:
                                                        contest.imagePath,
                                                    categoryimagePath: contest
                                                        .categoryimagePath,
                                                    category: contest.category,
                                                    title: contest.title,
                                                    date: contest.date,
                                                    todate: contest.todate,
                                                    time: contest.time,
                                                    joined: contest.joined,
                                                    callBack: () {
                                                      int id = data1![index].id;
                                                      fetchContestData(id)
                                                          .then((contestData) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailContestPage(
                                                              id: id,
                                                              contestData:
                                                                  contestData,
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                  );
                                                },
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
                ),
                AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: isLoading2
                                  ? const CircularProgressIndicator()
                                  : (data2 == null || data2!.isEmpty)
                                      ? widget.blankPage
                                      : GestureDetector(
                                          child: SingleChildScrollView(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 0,
                                                  mainAxisSpacing: 0,
                                                  childAspectRatio: 99 / 185,
                                                ),
                                                itemCount: data2?.length ?? 0,
                                                itemBuilder: (context, index) {
                                                  final campaign =
                                                      data2![index];
                                                  return HorizontalTile(
                                                    id: campaign.id,
                                                    imagePath:
                                                        campaign.imagePath,
                                                    categoryimagePath: campaign
                                                        .categoryimagePath,
                                                    category: campaign.category,
                                                    title: campaign.title,
                                                    date: campaign.date,
                                                    todate: campaign.todate,
                                                    time: campaign.time,
                                                    joined: campaign.joined,
                                                    callBack: () {
                                                      int id = data2![index].id;
                                                      fetchContestData(id)
                                                          .then((contestData) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailContestPage(
                                                              id: id,
                                                              contestData:
                                                                  contestData,
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                  );
                                                },
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
                ),
                AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: isLoading3
                                  ? const CircularProgressIndicator()
                                  : (data3 == null || data3!.isEmpty)
                                      ? widget.blankPage
                                      : GestureDetector(
                                          child: SingleChildScrollView(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 0,
                                                  mainAxisSpacing: 0,
                                                  childAspectRatio: 99 / 185,
                                                ),
                                                itemCount: data3?.length ?? 0,
                                                itemBuilder: (context, index) {
                                                  final contest = data3![index];
                                                  return HorizontalTile(
                                                    id: contest.id,
                                                    imagePath:
                                                        contest.imagePath,
                                                    categoryimagePath: contest
                                                        .categoryimagePath,
                                                    category: contest.category,
                                                    title: contest.title,
                                                    date: contest.date,
                                                    todate: contest.todate,
                                                    time: contest.time,
                                                    joined: contest.joined,
                                                    callBack: () {
                                                      int id = data3![index].id;
                                                      fetchContestData(id)
                                                          .then((contestData) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailContestPage(
                                                              id: id,
                                                              contestData:
                                                                  contestData,
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                  );
                                                },
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
