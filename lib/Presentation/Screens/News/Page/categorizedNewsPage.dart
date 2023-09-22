import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Data/News/fetching/fetchDataCategorizedNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/UISection/categorizedNewsBlankPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/Page/newsCategoriesPage.dart';
import 'package:thanh_nien_da_nang/Data/News/dataTypes/newsTilesData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/UISection/verticalScrollSectionNews.dart';

class CategorizedNewsPage extends StatefulWidget {
  final int value;
  final String headerTitle;

  const CategorizedNewsPage({
    Key? key,
    required this.value,
    required this.headerTitle,
  }) : super(key: key);

  @override
  State<CategorizedNewsPage> createState() => _CategorizedNewsPageState();
}

class _CategorizedNewsPageState extends State<CategorizedNewsPage> {
  final FetchDataCategorizedNews fetchDataCategorizedNews =
      FetchDataCategorizedNews();

  List<NewsTilesData> categorizedNewsList = [];

  @override
  void initState() {
    super.initState();
    fetchDataCategorizedNews.fetchDataByValue(widget.value).then(
      (List<NewsTilesData> newsList) {
        setState(() {
          categorizedNewsList = newsList;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            widget.headerTitle,
            maxLines: 1,
            style: const TextStyle(
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
                MaterialPageRoute(
                    builder: (context) => const NewsCategoriesPage()),
              );
            },
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0269E9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: categorizedNewsList.isEmpty
                  ? const CategorizedNewsBlankPage()
                  : VerticalScrollSectionNews(
                      newsDataList: categorizedNewsList),
            ),
          ),
        ),
      ),
    );
  }
}
