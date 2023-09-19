import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsTilesData.dart';

class FetchDataRelatedNews {
  Future<NewsTilesData> fetchDataById(int id) async {
    final url =
        'https://intern.try0.xyz/api/v1/article/news/related/' + id.toString();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));

        String title = data['title'] ?? 'null';
        String imagePath = data['cover_image'] ?? 'null';
        String parsedDate = '';

        if (data['created_at'] != null) {
          DateTime dateTime = DateTime.parse(data['created_at']);
          parsedDate = DateFormat('dd/MM/yyyy').format(dateTime);
        }

        return NewsTilesData(
          imagePath: imagePath,
          title: title,
          time: parsedDate,
          id: id,
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
