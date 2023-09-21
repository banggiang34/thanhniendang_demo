import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thanh_nien_da_nang/Data/News/dataTypes/newsDetailData.dart';
import 'package:thanh_nien_da_nang/Data/News/dataTypes/newsTilesData.dart';
import 'package:thanh_nien_da_nang/Data/News/fetching/fetchDataRelatedNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/UISection/verticalScrollSectionNews.dart';

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
  List<NewsTilesData> relatedNewsList = [];

  // Add a GlobalKey for RefreshIndicator
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    fetchDataRelatedNews.fetchDataById(widget.id).then(
      (List<NewsTilesData> newsList) {
        setState(() {
          relatedNewsList = newsList;
        });
      },
    );
  }

  Future<void> _refreshData() async {
    // Fetch new related news data here or update the existing data
    // For example:
    // final updatedData = await fetchDataRelatedNews.fetchDataById(widget.id);

    // Simulate a delay for demonstration purposes (you can remove this)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Update the relatedNewsList with the new data
      // relatedNewsList = updatedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              widget.newsData.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
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
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshData,
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
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Image.asset('images/calendar1.png'),
                              const SizedBox(width: 5),
                              Text(
                                'Đăng vào ' + widget.newsData.date,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff8A8A8A),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 8,
                              children:
                                  widget.newsData.categories.map((category) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF5F5F5),
                                  ),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6A6A6A),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Html(
                            data: widget.newsData.content,
                            style: {"p": Style(fontFamily: 'SF-Pro')},
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Bài viết liên quan',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 20),
                          VerticalScrollSectionNews(
                              newsDataList: relatedNewsList)
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
      ),
    );
  }
}
