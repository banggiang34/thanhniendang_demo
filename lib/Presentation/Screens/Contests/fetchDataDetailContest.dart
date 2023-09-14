import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thanh_nien_da_nang/Presentation/Screens/Contests/contestDetailData.dart';

class fetchDataDetailContest {
  static Future<ContestDetailData> fetchDataById(int id) async {
    final url =
        'https://intern.try0.xyz/api/v1/activity/contest/' + id.toString();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));

        String imagePath = data['cover_image'] ?? '';
        String unit = data['organizational_unit'] ?? '';
        String content = data['description'] ?? '';
        String title = data['title'] ?? '';
        int participants = data['participants'] ?? 0;
        int minScore = data['min_score'] ?? 0;
        int numberOfQuestions = data['number_of_questions'] ?? 0;
        int duration = data['duration'] ?? 0;
        int contestId = data['id'] ?? 0;

        String parsedDate = '';
        String parsedToDate = '';

        if (data['start_at'] != null) {
          DateTime dateTime = DateTime.parse(data['start_at']);
          parsedDate = DateFormat('dd/MM/yyyy').format(dateTime);
        }

        if (data['end_at'] != null) {
          DateTime todateTime = DateTime.parse(data['end_at']);
          parsedToDate = DateFormat('dd/MM/yyyy').format(todateTime);
        }

        return ContestDetailData(
          imagePath: imagePath,
          joined: '$participants',
          title: title,
          date: parsedDate,
          toDate: parsedToDate,
          unit: unit,
          finishCondition: minScore,
          content: content,
          questNum: numberOfQuestions,
          occurTime: duration.toString(),
          id: contestId,
          status: data['status_obj']['label'],
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
