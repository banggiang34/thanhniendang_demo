import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dialogPopUp.dart';

Future<void> fetchUserInfo({
  required String inputEmail,
  required int inputPassword,
  required BuildContext context,
  required String popupLabel,
  required String popupBtnText,
  required Function callBack,
}) async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  final data = json.decode(response.body);

  for (var user in data) {
    if (user['email'] == inputEmail && user['id'] == inputPassword) {
      final userInfo = "Name: ${user['name']}\n"
          "Email: ${user['email']}\n"
          "Username: ${user['username']}\n"
          "Phone: ${user['phone']}\n"
          "Website: ${user['website']}";

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: popupLabel,
            content: userInfo,
            btnText: popupBtnText,
            callBack: callBack,
          );
        },
      );
      break;
    }
  }
}
