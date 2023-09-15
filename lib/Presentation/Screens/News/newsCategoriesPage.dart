import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/Elements/Buttons/closeButton.dart';

class NewsCategoriesPage extends StatefulWidget {
  const NewsCategoriesPage({super.key});

  @override
  State<NewsCategoriesPage> createState() => _NewsCategoriesPageState();
}

class _NewsCategoriesPageState extends State<NewsCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/newscategories.png',
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
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'Danh mục tin tức',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30, top: 50),
                      child: CloseBtn(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
