import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Data/Contests/contestDetailData.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/horizontalTile.dart';
import 'package:thanh_nien_da_nang/Data/Contests/fetchDataDetailContest.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/Page/detailContestPage.dart';

class GridSection extends StatefulWidget {
  final bool loadingBoolean;
  final List dataList;
  final Widget blankPage;
  const GridSection({
    super.key,
    required this.loadingBoolean,
    required this.dataList,
    required this.blankPage,
  });

  @override
  State<GridSection> createState() => _GridSectionState();
}

class _GridSectionState extends State<GridSection> {
  Future<ContestDetailData> fetchContestData(int id) async {
    final contestData = await fetchDataDetailContest.fetchDataById(id);
    return contestData;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.loadingBoolean
                      ? const CircularProgressIndicator()
                      : (widget.dataList == null || widget.dataList!.isEmpty)
                          ? widget.blankPage
                          : Wrap(
                              spacing: 0,
                              runSpacing: 0,
                              children: [
                                for (final contest in widget.dataList!)
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: HorizontalTile(
                                      id: contest.id,
                                      imagePath: contest.imagePath,
                                      categoryimagePath:
                                          contest.categoryimagePath,
                                      category: contest.category,
                                      title: contest.title,
                                      date: contest.date,
                                      todate: contest.todate,
                                      time: contest.time,
                                      joined: contest.joined,
                                      callBack: () {
                                        int id = contest.id;
                                        fetchContestData(id)
                                            .then((contestData) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailContestPage(
                                                id: id,
                                                contestData: contestData,
                                              ),
                                            ),
                                          );
                                        });
                                      },
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
    );
  }
}
