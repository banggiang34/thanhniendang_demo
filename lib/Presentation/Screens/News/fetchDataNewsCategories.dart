import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thanh_nien_da_nang/Presentation/Screens/News/newsCategoriesData.dart';

Future<List<NewsCategoriesData>> fetchNewsCategories() async {
  final url = Uri.parse(
      'https://intern.try0.xyz/api/v1/article/news?type=1&category=1&status=1');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> categories = jsonData['extra']['options']['categories'];
    List<NewsCategoriesData> newsCategoriesList = [];

    extractCategories(categories, newsCategoriesList);
    return newsCategoriesList;
  } else {
    throw Exception('Failed to load data');
  }
}

void extractCategories(
    List<dynamic> categories, List<NewsCategoriesData> result) {
  for (var category in categories) {
    final List<String> subCategories = [];
    if (category['children'] != null && category['children'].isNotEmpty) {
      extractSubCategories(category['children'], subCategories);
    }
    final data = NewsCategoriesData(
      category: [category['label'], ...subCategories],
      subCategories: subCategories,
      value: category['value'],
    );
    result.add(data);
  }
}

void extractSubCategories(List<dynamic> subCategoryList, List<String> result) {
  for (var subCategory in subCategoryList) {
    result.add(subCategory['label']);
  }
}
