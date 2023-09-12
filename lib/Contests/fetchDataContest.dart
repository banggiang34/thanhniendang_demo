import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Elements/Tiles/categorizedNewsData.dart';

class ApiServiceContest {
  static Future<List<CategorizedNewsData>> fetchOngoingContests() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/contest/'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final currentDate = DateTime.now();
      final ongoingList = <CategorizedNewsData>[];

      items.forEach((contest) {
        DateTime fromDate = DateTime.parse(contest['start_at']);
        DateTime toDate = DateTime.parse(contest['end_at']);

        if (currentDate.isAfter(fromDate) && currentDate.isBefore(toDate)) {
          ongoingList.add(_createCategorizedNewsData(contest));
        }
      });

      return ongoingList;
    } else {
      throw Exception('Failed to load ongoing contests');
    }
  }

  static Future<List<CategorizedNewsData>> fetchFinishedContests() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/contest/'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final currentDate = DateTime.now();
      final finishedList = <CategorizedNewsData>[];

      items.forEach((contest) {
        DateTime toDate = DateTime.parse(contest['end_at']);

        if (currentDate.isAfter(toDate)) {
          finishedList.add(_createCategorizedNewsData(contest));
        }
      });

      return finishedList;
    } else {
      throw Exception('Failed to load finished contests');
    }
  }

  static Future<List<CategorizedNewsData>> fetchComingSoonContests() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/contest/'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final currentDate = DateTime.now();
      final comingSoonList = <CategorizedNewsData>[];

      items.forEach((contest) {
        DateTime fromDate = DateTime.parse(contest['start_at']);

        if (currentDate.isBefore(fromDate)) {
          comingSoonList.add(_createCategorizedNewsData(contest));
        }
      });

      return comingSoonList;
    } else {
      throw Exception('Failed to load coming soon contests');
    }
  }

  static Future<List<CategorizedNewsData>> fetchAllContests() async {
    final response = await http
        .get(Uri.parse('https://intern.try0.xyz/api/v1/activity/contest/'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      final items = jsonResponse['items'] as List<dynamic>;

      final newsDataList = items.map<CategorizedNewsData>((contest) {
        DateTime dateTime = DateTime.parse(contest['start_at']);
        String parsedDate = DateFormat('dd/MM').format(dateTime);

        DateTime todateTime = DateTime.parse(contest['end_at']);
        String parsedToDate = DateFormat('dd/MM').format(todateTime);

        return CategorizedNewsData(
          imagePath: contest['cover_image'],
          categoryimagePath: '',
          category: '',
          title: contest['title'],
          date: parsedDate,
          todate: parsedToDate,
          time: '${contest['duration']}',
          joined: '${contest['participants']}',
          callBack: () {},
          id: contest['id'],
        );
      }).toList();

      return newsDataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static CategorizedNewsData _createCategorizedNewsData(
      Map<String, dynamic> contest) {
    DateTime dateTime = DateTime.parse(contest['start_at']);
    String parsedDate = DateFormat('dd/MM').format(dateTime);

    DateTime todateTime = DateTime.parse(contest['end_at']);
    String parsedToDate = DateFormat('dd/MM').format(todateTime);

    return CategorizedNewsData(
      imagePath: contest['cover_image'],
      categoryimagePath: '',
      category: '',
      title: contest['title'],
      date: parsedDate,
      todate: parsedToDate,
      time: '${contest['duration']}',
      joined: '${contest['participants']}',
      callBack: () {},
      id: contest['id'],
    );
  }
}
