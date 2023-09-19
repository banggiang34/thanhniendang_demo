import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/VerticleScrollSectionNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsDetailData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsTilesData.dart';
import 'fetchDataRelatedNews.dart';

class DetailNewsPage extends StatefulWidget {
  final int id;
  final NewsDetailData newsData;

  const DetailNewsPage({
    Key? key,
    required this.newsData,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailNewsPage> createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  final FetchDataRelatedNews fetchDataRelatedNews = FetchDataRelatedNews();

  void initState() {
    super.initState();
    fetchDataRelatedNews.fetchDataById(widget.id).then(
      (NewsTilesData newsData) {
        setState(() {
          relatedNewsList = [newsData];
        });
      },
    );
  }

  List<NewsTilesData> relatedNewsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              widget.newsData.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xff1F1F1F),
              ),
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
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.newsData.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset('images/calendar1.png'),
                            SizedBox(width: 5),
                            Text(
                              'Đăng vào ' + widget.newsData.date,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8A8A8A),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            spacing: 4,
                            runSpacing: 8,
                            children:
                                widget.newsData.categories.map((category) {
                              return Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffF5F5F5),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6A6A6A),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Html(
                          data: widget.newsData.content,
                          style: {"p": Style(fontFamily: 'SF-Pro')},
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Bài viết liên quan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 20),
                        VerticalScrollSectionNews(newsDataList: relatedNewsList)
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
