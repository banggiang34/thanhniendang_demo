import 'package:flutter/material.dart';

class CategorizedNewsBlankPage extends StatelessWidget {
  const CategorizedNewsBlankPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 45),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(360),
              ),
              child: Center(
                child: Image.asset(
                  'images/newsblank.png',
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Không có bài viết nào',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff8A8A8A),
            ),
          ),
          const SizedBox(height: 35),
          const Text(
            'Danh mục không có bài viết nào. Vui lòng kiểm tra lại sau để cập nhật thông tin mới.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff8A8A8A),
            ),
          ),
          const SizedBox(height: 40),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Quay về trang trước',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff005CE7),
              ),
            ),
          )
        ],
      ),
    );
  }
}
