import 'package:http/http.dart' as http;
import 'dart:convert';

typedef void UserInfoCallback(String userName);

Future fetchUserInfo({
  required String inputEmail,
  required int inputPassword,
  required UserInfoCallback callback,
}) async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  final data = json.decode(response.body);

  for (var user in data) {
    if (user['email'] == inputEmail && user['id'] == inputPassword) {
      final userName = "Xin chào, ${user['name']}";
      callback(userName);
      break;
    }
  }
}
