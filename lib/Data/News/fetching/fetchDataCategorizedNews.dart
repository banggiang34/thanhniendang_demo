import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thanh_nien_da_nang/Data/News/dataTypes/newsTilesData.dart';

class FetchDataCategorizedNews {
  Future<List<NewsTilesData>> fetchDataByValue(int value) async {
    final url = 'https://intern.try0.xyz/api/v1/article/news?category=' +
        value.toString();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));

        final List<dynamic> items = responseData['items'];

        final List<NewsTilesData> relatedNewsList = items.map((item) {
          return NewsTilesData(
            imagePath: item['cover_image'] ?? 'null',
            title: item['title'] ?? 'null',
            time: DateFormat('dd/MM/yyyy')
                .format(DateTime.parse(item['created_at'])),
            id: item['id'] ?? 0,
          );
        }).toList();

        return relatedNewsList;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
