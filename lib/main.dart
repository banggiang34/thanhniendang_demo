import 'package:flutter/material.dart';
import 'package:thanh_nien_da_nang/Screens/mainscrollPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thanh nien vn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SF-Pro'),
      home: MainScrollPage(),
    );
  }
}
