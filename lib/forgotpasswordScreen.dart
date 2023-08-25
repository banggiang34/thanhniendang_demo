import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/buildemailBox.dart';
import 'package:thanh_nien_da_nang/buildlogsigninBtn.dart';
import 'package:thanh_nien_da_nang/dialogPopUp.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendForgotPasswordRequest() async {
    final String apiUrl =
        'https://intern.try0.xyz/api/v1/account/user/forgot-password/';
    final String email = _emailController.text;

    final Map<String, String> requestBody = {
      'email': email,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(requestBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
                callBack: () {
                  Navigator.of(context).pop();
                },
                title: 'Đã gửi mật khẩu mới',
                content:
                    'Mật khẩu mới đã được gửi đến địa chỉ email bạn sử dụng để đăng ký tài khoản.\n\nVui lòng kiểm tra hộp thư đến và làm theo hướng dẫn.',
                btnText: 'Đã hiểu');
          });
    } else {
      print('Error sending password reset request: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Quên mật khẩu',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xff1F1F1F),
          ),
        ),
        backgroundColor: Color(0xffFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nhập địa chỉ email bạn đã đăng ký',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff484848),
                    ),
                  ),
                  SizedBox(height: 15),
                  BuildEmailBox(
                      controller: _emailController, hinttext: 'Địa chỉ email'),
                  SizedBox(height: 20),
                  BuildLogSignInBtn(
                    labeltext: 'Tiếp tục',
                    callback: _sendForgotPasswordRequest,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
