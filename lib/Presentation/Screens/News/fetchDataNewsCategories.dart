import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchNewsCategories() async {
  final url = Uri.parse(
      'https://intern.try0.xyz/api/v1/article/news?type=1&category=1&status=1');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> items = jsonData['items'];
    final firstCategoryLabel =
        jsonData['extra']['options']['categories'][0]['label'];
    List<String> newsCategoriesList = [];

    // for (var item in jsonData['items']) {
    //   newsCategoriesList.add(
    //     NewsTilesData(
    //       imagePath: item['cover_image'],
    //       title: item['title'],
    //       time: parsedDate,
    //       id: item['id'],
    //     ),
    //   );
    // }
  } else {
    throw Exception('Failed to load data');
  }
  ;
}
