import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/verticalScrollSectionNews.dart';
import 'package:thanh_nien_da_nang/Data/News/fetching/fetchDataHighLightNews.dart';
import 'package:thanh_nien_da_nang/Data/News/fetching/fetchDataLatestNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/highlightNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsCategoriesPage.dart';
import 'package:thanh_nien_da_nang/Data/News/dataTypes/newsTilesData.dart';

class NewsCollectionPage extends StatefulWidget {
  const NewsCollectionPage({super.key});
  @override
  State<NewsCollectionPage> createState() => _NewsCollectionPageState();
}

class _NewsCollectionPageState extends State<NewsCollectionPage> {
  void initState() {
    super.initState();
    fetchHighLightNews().then(
      (newsData) {
        setState(() {
          highLightNewsList = newsData;
        });
      },
    );

    fetchLatestNews().then(
      (newsData) {
        setState(() {
          latestNewsList = newsData;
        });
      },
    );
  }

  List<NewsTilesData> latestNewsList = [];
  List<NewsTilesData> highLightNewsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'Tin tức',
            maxLines: 1,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xff1F1F1F),
            ),
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsCategoriesPage()),
              );
            },
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0269E9),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset('images/menu1.png'),
              ),
            ),
          )
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tin nổi bật',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                HighLightNews(
                  highlightNewsList: highLightNewsList,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tin tức mới',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child:
                      VerticalScrollSectionNews(newsDataList: latestNewsList),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
