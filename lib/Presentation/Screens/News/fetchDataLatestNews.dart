import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'latestNewsData.dart';

Future<List<LatestNewsData>> fetchLatestNews() async {
  final apiUrl = 'https://intern.try0.xyz/api/v1/article/news/?category/';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    List<LatestNewsData> latestNewsList = [];

    for (var item in jsonData['items']) {
      DateTime dateTime = DateTime.parse(item['updated_at']);
      String parsedDate = DateFormat.yMd().format(dateTime);

      latestNewsList.add(
        LatestNewsData(
          imagePath: item['cover_image'],
          title: item['title'],
          time: parsedDate,
          id: item['id'],
        ),
      );
    }

    return latestNewsList;
  } else {
    throw Exception('Failed to load latest news');
  }
}
