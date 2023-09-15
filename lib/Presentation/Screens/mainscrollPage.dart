import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/campaignBlankPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/campaignGridPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/horizontalScrollSectionCampaign.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Campaigns/fetchDataCampaign.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/fetchDataContest.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/VerticleScrollSectionNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/highlightNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/loginScreen.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedTilesData.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/contestBlankPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/contestGridPage.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/fetchDataHighLightNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/fetchDataLatestNews.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/horizontalScrollSectionContest.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsTilesData.dart';

class MainScrollPage extends StatefulWidget {
  final String userName;
  final bool isLoggedIn;
  MainScrollPage(
      {this.userName = 'Xin chào, Bạn chưa đăng nhập',
      this.isLoggedIn = false});

  @override
  State<MainScrollPage> createState() => _MainScrollPageState();
}

class _MainScrollPageState extends State<MainScrollPage> {
  late Future<List<CategorizedTilesData>> contestsFuture;
  late Future<List<NewsTilesData>> latestNewsFuture;
  final campaignsDataFuture = ApiService.fetchAllCampaigns();
  final newsDataContest = ApiServiceContest.fetchAllContests();

  @override
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
      backgroundColor: const Color(0xffFFFFFF),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/login.png',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      color: Colors.blue.withOpacity(0.5),
                      colorBlendMode: BlendMode.overlay,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            const Color(0xff0269E9).withOpacity(0.2),
                            const Color(0xff0269E9).withOpacity(0.5),
                            const Color(0xff0269E9).withOpacity(0.6),
                            const Color(0xff0269E9).withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ListTile(
                            title: const Text(
                              'Tuổi trẻ Đà Nẵng',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            subtitle: Text(
                              widget.userName,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.85),
                              ),
                            ),
                            trailing: widget.isLoggedIn
                                ? Container(
                                    width: 10,
                                    height: 10,
                                  )
                                : TextButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          '\nĐăng nhập',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          children: [
                                            const SizedBox(height: 23),
                                            Image.asset(
                                              'images/arrow-circle-right1.png',
                                              width: 22,
                                              height: 22,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 50),
                      child: Image.asset(
                        'images/logodcs.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 50),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () => print('conmeo'),
                          icon: Image.asset(
                            'images/bellnoti.png',
                            fit: BoxFit.fill,
                          ),
                          iconSize: 50,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 350,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 138,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF0F6FD)
                                            .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll1.png'),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Tình nguyện',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF0F6FD)
                                            .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll2.png'),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Cuộc thi',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF0F6FD)
                                            .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll3.png'),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Tin tức',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF0F6FD)
                                            .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll4.png'),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Cá nhân',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                HighLightNews(
                  highlightNewsList: highLightNewsList,
                ),

                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CampaignGridPage(
                              fetchDataOnGoing: () =>
                                  ApiService.fetchOngoingCampaigns(),
                              fetchDataComingSoon: () =>
                                  ApiService.fetchComingSoonCampaigns(),
                              fetchDataFinished: () =>
                                  ApiService.fetchFinishedCampaigns(),
                              blankPage: const CampaignBlankPage(),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Đợt tình nguyện',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff8A8A8A),
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                HorizontalScrollSectionCampaign(
                  fetchData: () => campaignsDataFuture,
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContestGridPage(
                              fetchDataOnGoing: () =>
                                  ApiServiceContest.fetchOngoingContests(),
                              fetchDataComingSoon: () =>
                                  ApiServiceContest.fetchComingSoonContests(),
                              fetchDataFinished: () =>
                                  ApiServiceContest.fetchFinishedContests(),
                              blankPage: const ContestBlankPage(),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Cuộc thi đang diễn ra',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff8A8A8A),
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                HorizontalScrollSectionContest(
                  fetchData: () => newsDataContest,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE3E3E3),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/facebook.png'),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tham gia fanpage Tuổi trẻ Đà Nẵng',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Nơi cung cấp, định hướng thông tin, nắm bắt tình hình cơ sở.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Tham gia ngay',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff0269E9),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffE8F2FF),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color(0xff0269E9),
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 70),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset('images/Vectorlike.png'),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 90),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset('images/Vectorheart.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Text(
                              'Tin tức mới',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff8A8A8A),
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                VerticalScrollSectionNews(newsDataList: latestNewsList),
                Stack(
                  children: [
                    Container(
                      height: 270,
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff8A8A8A),
                            ),
                            children: [
                              TextSpan(
                                text: '© 2023. Ứng dụng',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' Tuổi trẻ Đà Nẵng',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '\n Một sản phẩm của Thành đoàn Đà Nẵng.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'images/footer.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ), //Bottom background image
              ],
            ),
          ),
        ),
      ),
    );
  }
}
