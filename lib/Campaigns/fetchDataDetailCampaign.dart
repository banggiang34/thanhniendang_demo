import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:thanh_nien_da_nang/Campaigns/campaignDetailData.dart';

class fetchDataDetailCampaign {
  static Future<CampaignDetailData> fetchDataById(int id) async {
    final url =
        'https://intern.try0.xyz/api/v1/activity/campaign/' + id.toString();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));

        final List<Map<String, dynamic>> beneficiaryTypes =
            List<Map<String, dynamic>>.from(data['beneficiary_types_obj']);

        DateTime dateTime = DateTime.parse(data['registration_from']);
        String parsedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        DateTime todateTime = DateTime.parse(data['registration_to']);
        String parsedToDate = DateFormat('dd/MM/yyyy').format(todateTime);

        DateTime postedDate = DateTime.parse(data['created_at']);
        String parsedpostedDate = DateFormat('dd/MM/yyyy').format(postedDate);

        return CampaignDetailData(
          imagePath: data['cover_image'],
          category: data['type_obj']['label'],
          title: data['title'],
          postedDate: parsedpostedDate,
          date: parsedDate,
          toDate: parsedToDate,
          occurTime: data['occurring_time'],
          location: data['place'],
          BenefitedSubject: beneficiaryTypes
              .map((beneficiaryType) => beneficiaryType['label'])
              .join(', '),
          content: data['content'],
          phone: data['contact_mobile'],
          email: data['contact_email'],
          id: data['id'],
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
