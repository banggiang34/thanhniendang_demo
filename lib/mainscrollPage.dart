import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/categorizedNews.dart';
import 'package:thanh_nien_da_nang/highlightNews.dart';
import 'package:thanh_nien_da_nang/loginScreen.dart';

class MainScrollPage extends StatefulWidget {
  final String userName;
  final bool isLoggedIn;
  MainScrollPage(
      {this.userName = 'Xin chào, Bạn chưa đăng nhập',
      this.isLoggedIn = false});

  @override
  State<MainScrollPage> createState() => _MainScrollPageState();
}

class CategorizedNewsData {
  final String imagePath;
  final String categoryimagePath;
  final String category;
  final String joined;
  final String title;
  final String date;
  final String todate;
  final String time;

  CategorizedNewsData({
    required this.imagePath,
    required this.categoryimagePath,
    required this.category,
    required this.joined,
    required this.title,
    required this.date,
    required this.todate,
    required this.time,
  });
}

class _MainScrollPageState extends State<MainScrollPage> {
  List<CategorizedNewsData> categorizedNewsList = [
    CategorizedNewsData(
      imagePath: 'images/nguoigia1.png',
      categoryimagePath: 'images/old-people1.png',
      category: 'Giúp đỡ người già',
      joined: '',
      title: 'Giúp đỡ người cao tuổi khó khăn, đau yếu ở huyện Hòa Vang',
      date: '15/07',
      todate: '16/07',
      time: '',
    ),
    CategorizedNewsData(
      imagePath: 'images/hienmau1.png',
      categoryimagePath: 'images/blood-donation1.png',
      category: 'Hiến máu',
      joined: '',
      title: 'Ngày hội Chủ nhật Đỏ lần thứ XIV - năm 2023 tại Đà Nẵng',
      date: '03/07',
      todate: '13/07',
      time: '',
    ),
    CategorizedNewsData(
      imagePath: 'images/login.png',
      categoryimagePath: 'images/old-people1.png',
      category: 'conmeo',
      joined: '',
      title: 'Ngày hội Chủ nhật Đỏ lần thứ XIV - năm 2023 tại Đà Nẵng',
      date: '03/07',
      todate: '13/07',
      time: '',
    ),
  ];
  List<CategorizedNewsData> contestsList = [
    CategorizedNewsData(
      imagePath: 'images/lephatdong.png',
      categoryimagePath: 'images/users1.png',
      category: '',
      joined: '145',
      title:
          'Cuộc thi trực tuyến tìm hiểu nghị định đại hội toàn đoàn lần thứ XII',
      date: '15/07',
      todate: '16/07',
      time: '30',
    ),
    CategorizedNewsData(
      imagePath: 'images/seminar.png',
      categoryimagePath: 'images/users1.png',
      category: '',
      joined: '80',
      title: 'Sáng kiến thanh niên giải quyết vấn đề thúc đẩy bình đẳng giới',
      date: '03/07',
      todate: '13/07',
      time: '15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            Color(0xff0269E9).withOpacity(0.2),
                            Color(0xff0269E9).withOpacity(0.5),
                            Color(0xff0269E9).withOpacity(0.6),
                            Color(0xff0269E9).withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ListTile(
                            title: Text(
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
                                        Text(
                                          '\nĐăng nhập',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        SizedBox(width: 5),
                                        Column(
                                          children: [
                                            SizedBox(height: 23),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                      child: Image.asset(
                        'images/logodcs.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 50),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 350,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 138,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
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
                                        color:
                                            Color(0xffF0F6FD).withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll1.png'),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Tình nguyện',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xffF0F6FD).withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll2.png'),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Cuộc thi',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xffF0F6FD).withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll3.png'),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Tin tức',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xffF0F6FD).withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: IconButton(
                                        onPressed: () => print('conmeo'),
                                        icon: Image.asset(
                                            'images/homescroll4.png'),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Cá nhân',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3A3A3A),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  child: HighLightNews(
                      imagePath: 'images/highlight1.png',
                      articleName:
                          'Tuổi trẻ Đà Nẵng sôi nổi cùng các hoạt động hỗ trợ “Tiếp sức mùa thi 2023”'),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Đợt tình nguyện',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5),
                              ),
                              child: Center(
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
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorizedNewsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CategorizedNews(
                            index: index,
                            newsDataList: categorizedNewsList,
                          ),
                          SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Cuộc thi đang diễn ra',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF5F5F5),
                              ),
                              child: Center(
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
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contestsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CategorizedNews(
                            index: index,
                            newsDataList: contestsList,
                          ),
                          SizedBox(width: 10),
                        ],
                      );
                    },
                  ),
                  // child: CategorizedNews(
                  //   category1: '',
                  //   category2: '',
                  //   category3: '',
                  //   category4: '',
                  //   categoryimagePath1: 'images/users1.png',
                  //   categoryimagePath2: 'images/users1.png',
                  //   categoryimagePath3: 'images/users1.png',
                  //   categoryimagePath4: 'images/users1.png',
                  //   date1: '15/07',
                  //   date2: '03/07',
                  //   date3: '13/08',
                  //   date4: '11/04',
                  //   todate1: '16/07',
                  //   todate2: '13/07',
                  //   todate3: '04/04',
                  //   todate4: '11/04',
                  //   imagePath1: 'images/lephatdong.png',
                  //   imagePath2: 'images/seminar.png',
                  //   imagePath3: 'images/nguoigia1.png',
                  //   imagePath4: 'images/nguoigia1.png',
                  //   time1: '30 phút',
                  //   time2: '15 phút',
                  //   time3: '30 phút',
                  //   time4: '30 phút',
                  //   title1:
                  //       'Giúp đỡ người cao tuổi khó khăn, đau yếu ở huyện Hòa Vang',
                  //   title2:
                  //       'Ngày hội Chủ nhật Đỏ lần thứ XIV - năm 2023 tại Đà Nẵng',
                  //   title3: '25',
                  //   title4: '67',
                  //   joined1: '145',
                  //   joined2: '80',
                  //   joined3: '80',
                  //   joined4: '12',
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
