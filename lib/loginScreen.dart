import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/buildemailBox.dart';
import 'package:thanh_nien_da_nang/buildlogsigninBtn.dart';
import 'package:thanh_nien_da_nang/buildpasswordBox.dart';
import 'package:thanh_nien_da_nang/forgotpasswordScreen.dart';
import 'package:thanh_nien_da_nang/mainscrollPage.dart';
import 'package:thanh_nien_da_nang/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //String _userName = '';
  //String _userInfo = '';

  // void _fetchUserInfo() async {
  //   final String inputEmail = _emailController.text;
  //   final int inputPassword = int.parse(_passwordController.text);
  //
  //   final response =
  //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  //   final data = json.decode(response.body);
  //
  //   for (var user in data) {
  //     if (user['email'] == inputEmail && user['id'] == inputPassword) {
  //       setState(() {
  //         _userInfo = "Name: ${user['name']}\n"
  //             "Email: ${user['email']}\n"
  //             "Username: ${user['username']}\n"
  //             "Phone: ${user['phone']}\n"
  //             "Website: ${user['website']}";
  //         print(_userInfo);
  //         showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return CustomAlertDialog(
  //                 title: 'User found', content: _userInfo, btnText: 'Ok');
  //           },
  //         );
  //       });
  //       break;
  //     } else {
  //       setState(() {
  //         _userInfo = 'User not found';
  //       });
  //     }
  //   }
  // }

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'images/login.png',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        color: Colors.blue.withOpacity(0.5),
                        colorBlendMode: BlendMode.overlay,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.transparent,
                              Color(0xff0269E9).withOpacity(0.2),
                              Color(0xff0269E9).withOpacity(0.5),
                              Color(0xff0269E9).withOpacity(0.6),
                              Color(0xff0269E9).withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 251,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.8),
                              Color(0xffFFFFFF),
                            ],
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Đăng nhập tuổi trẻ Đà Nẵng',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                        child: Image.asset(
                          'images/logodcs.png',
                          width: 70,
                          height: 70,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Chưa có tài khoản?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          ),
                          child: Text(
                            'Đăng ký ngay',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff005CE7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: BuildEmailBox(
                        controller: _emailController,
                        hinttext: 'Địa chỉ email'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: BuildPasswordBox(controller: _passwordController),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        ),
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff005CE7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: BuildLogSignInBtn(
                      labeltext: 'Đăng nhập',
                      callback: () async {
                        final apiEndpoint = Uri.parse(
                            'https://intern.try0.xyz/api/v1/account/user/login/');
                        final response = await http.post(
                          apiEndpoint,
                          headers: {
                            'Content-Type': 'application/json',
                          },
                          body: jsonEncode({
                            'username': _emailController.text,
                            'password': _passwordController.text,
                            'type': 4,
                          }),
                        );

                        if (response.statusCode == 200) {
                          final Map<String, dynamic> responseData =
                              json.decode(response.body);
                          final String fullName =
                              responseData['user']['full_name'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScrollPage(
                                  userName: "Xin chào, $fullName",
                                  isLoggedIn: true),
                            ),
                          );
                        } else {
                          print('Login failed: ${response.statusCode}');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff8A8A8A),
                      ),
                      children: [
                        TextSpan(
                          text: '© 2023. Ứng dụng',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' Tuổi trẻ Đà Nẵng',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\n Một sản phẩm của Thành đoàn Đà Nẵng.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataWidget(context, snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              snapshot.data.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(snapshot.data.description),
          )
        ],
      );
}
