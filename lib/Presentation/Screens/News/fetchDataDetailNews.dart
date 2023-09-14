import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsDetailData.dart';

class fetchDataDetailNews {
  static Future<NewsDetailData> fetchDataById(int id) async {
    final url = 'https://intern.try0.xyz/api/v1/article/news/' + id.toString();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));

        String title = data['title'] ?? 'null';
        String parsedDate = '';

        if (data['created_at'] != null) {
          DateTime dateTime = DateTime.parse(data['created_at']);
          parsedDate = DateFormat('dd/MM/yyyy').format(dateTime);
        }

        List<String> categories = [];

        if (data['categories_obj'] != null) {
          for (var category in data['categories_obj']) {
            if (category['label'] != null) {
              categories.add(category['label'].toString());
            }
          }
        }

        String content = data['content'] ?? '';

        return NewsDetailData(
          title: title,
          date: parsedDate,
          categories: categories,
          content: content,
        );
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading data: $e');
      throw Exception('Failed to load data');
    }
  }
}
