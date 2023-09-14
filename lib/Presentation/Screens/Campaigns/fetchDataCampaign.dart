import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thanh_nien_da_nang/Elements/Tiles/categorizedNewsData.dart';

class ApiService {
  static Future<List<CategorizedNewsData>> fetchOngoingCampaigns() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/campaign/'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final currentDate = DateTime.now();
      final ongoingList = <CategorizedNewsData>[];

      items.forEach((campaign) {
        DateTime fromDate = DateTime.parse(campaign['registration_from']);
        DateTime toDate = DateTime.parse(campaign['registration_to']);

        if (currentDate.isAfter(fromDate) && currentDate.isBefore(toDate)) {
          ongoingList.add(_createCategorizedNewsData(campaign));
        }
      });

      return ongoingList;
    } else {
      throw Exception('Failed to load ongoing campaigns');
    }
  }

  static Future<List<CategorizedNewsData>> fetchFinishedCampaigns() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/campaign'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final currentDate = DateTime.now();
      final finishedList = <CategorizedNewsData>[];

      items.forEach((campaign) {
        DateTime toDate = DateTime.parse(campaign['registration_to']);

        if (currentDate.isAfter(toDate)) {
          finishedList.add(_createCategorizedNewsData(campaign));
        }
      });

      return finishedList;
    } else {
      throw Exception('Failed to load finished campaigns');
    }
  }

  static Future<List<CategorizedNewsData>> fetchComingSoonCampaigns() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/campaign'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final currentDate = DateTime.now();
      final comingSoonList = <CategorizedNewsData>[];

      items.forEach((campaign) {
        DateTime fromDate = DateTime.parse(campaign['registration_from']);

        if (currentDate.isBefore(fromDate)) {
          comingSoonList.add(_createCategorizedNewsData(campaign));
        }
      });

      return comingSoonList;
    } else {
      throw Exception('Failed to load coming soon campaigns');
    }
  }

  static Future<List<CategorizedNewsData>> fetchAllCampaigns() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/campaign'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final newsDataList = items.map<CategorizedNewsData>((campaign) {
        DateTime dateTime = DateTime.parse(campaign['registration_from']);
        String parsedDate = DateFormat('dd/MM').format(dateTime);

        DateTime todateTime = DateTime.parse(campaign['registration_to']);
        String parsedToDate = DateFormat('dd/MM').format(todateTime);

        return CategorizedNewsData(
          imagePath: campaign['cover_image'],
          categoryimagePath: '',
          category: campaign['type_obj']['label'],
          title: campaign['title'],
          date: parsedDate,
          todate: parsedToDate,
          time: '',
          joined: '',
          callBack: () {},
          id: campaign['id'],
        );
      }).toList();

      return newsDataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static CategorizedNewsData _createCategorizedNewsData(
      Map<String, dynamic> campaign) {
    DateTime dateTime = DateTime.parse(campaign['registration_from']);
    String parsedDate = DateFormat('dd/MM').format(dateTime);

    DateTime todateTime = DateTime.parse(campaign['registration_to']);
    String parsedToDate = DateFormat('dd/MM').format(todateTime);

    return CategorizedNewsData(
      imagePath: campaign['cover_image'],
      categoryimagePath: '',
      category: campaign['type_obj']['label'],
      title: campaign['title'],
      date: parsedDate,
      todate: parsedToDate,
      time: '',
      joined: '',
      callBack: () {},
      id: campaign['id'],
    );
  }
}
