import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/highlightNews.dart';
import 'package:thanh_nien_da_nang/loginScreen.dart';
import 'package:http/http.dart' as http;

class MainScrollPage extends StatefulWidget {
  const MainScrollPage({super.key});

  @override
  State<MainScrollPage> createState() => _MainScrollPageState();
}

class _MainScrollPageState extends State<MainScrollPage> {
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
                              'Xin chào, Bạn chưa đăng nhập',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.85),
                              ),
                            ),
                            trailing: TextButton(
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
                                  SizedBox(
                                      width:
                                          5), // Adjust the spacing between text and icon
                                  Column(
                                    children: [
                                      SizedBox(height: 23),
                                      Image.asset(
                                        'images/arrow-circle-right1.png', // Replace with your asset path
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
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 350,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 120,
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
                SizedBox(height: 20),
                Container(
                  child: HighLightNews(
                      imagePath: 'images/highlight1.png',
                      articleName:
                          'Tuổi trẻ Đà Nẵng sôi nổi cùng các hoạt động hỗ trợ “Tiếp sức mùa thi 2023”'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
