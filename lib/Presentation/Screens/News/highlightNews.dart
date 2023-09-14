import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/detailNewsPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/fetchDataDetailNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/latestNewsData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsDetailData.dart';

class HighLightNews extends StatefulWidget {
  final List<LatestNewsData> highlightNewsList;

  HighLightNews({
    required this.highlightNewsList,
  });

  @override
  _HighLightNewsState createState() => _HighLightNewsState();
}

class _HighLightNewsState extends State<HighLightNews> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<NewsDetailData> fetchNewsData(int id) async {
    final newsData = await fetchDataDetailNews.fetchDataById(id);
    return newsData;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 280,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: widget.highlightNewsList.map((newsItem) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          int id = newsItem.id;
                          fetchDataDetailNews
                              .fetchDataById(id)
                              .then((newsData) {
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 220,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(newsItem.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      alignment: Alignment.center,
                                      width: 120,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff00A9F1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset('images/star.png'),
                                          const SizedBox(width: 5),
                                          const Text(
                                            'Tin nổi bật',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text(
                                  newsItem.title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Container(
          height: 220,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.highlightNewsList.asMap().entries.map((entry) {
                int index = entry.key;
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? const Color(0xff0269E9)
                        : const Color(0xffF5F5F5),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
