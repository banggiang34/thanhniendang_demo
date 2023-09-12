import 'dart:convert';
import 'package:http/http.dart' as http;
import 'latestNewsData.dart';

Future<List<LatestNewsData>> fetchHighLightNews() async {
  final apiUrl = 'https://intern.try0.xyz/api/v1/article/news/?type=2';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    List<LatestNewsData> latestNewsList = [];

    for (var item in jsonData['items']) {
      latestNewsList.add(
        LatestNewsData(
          imagePath: item['cover_image'],
          title: item['title'],
          time: '',
          id: item['id'],
        ),
      );
    }

    return latestNewsList;
  } else {
    throw Exception('Failed to load featured news');
  }
}
