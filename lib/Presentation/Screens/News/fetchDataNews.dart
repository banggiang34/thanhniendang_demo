import 'dart:convert';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedNewsData.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CategoryObject {
  final int value;
  final String label;

  CategoryObject(this.value, this.label);
}

Future<List<CategorizedNewsData>> fetchCategorizedNews() async {
  final response = await http
      .get(Uri.parse('https://intern.try0.xyz/api/v1/article/news/?category/'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> items = jsonData['items'];

    final List<dynamic> categoriesData =
        jsonData['extra']['options']['categories'];
    final List<CategoryObject> categoryObjects = categoriesData
        .map((category) => CategoryObject(category['value'], category['label']))
        .toList();

    return items.map((item) {
      final List<int> categoryIds = List<int>.from(item['categories']);
      final List<String> newsItemCategories = [];

      for (var categoryId in categoryIds) {
        final CategoryObject categoryObject = categoryObjects.firstWhere(
            (category) => category.value == categoryId,
            orElse: () => CategoryObject(categoryId, 'Unknown Category'));
        newsItemCategories.add(categoryObject.label);
      }

      DateTime dateTime = DateTime.parse(item['created_at']);
      String parsedDate = DateFormat.Md().format(dateTime);

      DateTime todateTime = DateTime.parse(item['updated_at']);
      String parsedtoDate = DateFormat.Md().format(todateTime);

      DateTime timeTime = DateTime.parse(item['updated_at']);
      String parsedTime = DateFormat.Hm().format(timeTime);

      return CategorizedNewsData(
        imagePath: item['cover_image'],
        categoryimagePath: '',
        category: newsItemCategories.join(', '),
        joined: '',
        title: item['title'],
        date: parsedDate,
        todate: parsedtoDate,
        time: parsedTime,
        callBack: () {},
        id: item['id'],
      );
    }).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
