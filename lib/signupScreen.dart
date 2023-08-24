import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanh_nien_da_nang/buildemailBox.dart';
import 'package:thanh_nien_da_nang/buildfillBox.dart';
import 'package:thanh_nien_da_nang/buildlogsigninBtn.dart';
import 'package:http/http.dart' as http;
import 'package:thanh_nien_da_nang/dialogPopUp.dart';

import 'buildconfirmpassBox.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> _registerUser() async {
    final apiUrl =
        Uri.parse('https://intern.try0.xyz/api/v1/account/member/register/');

    final body = jsonEncode({
      'email': _emailController.text,
      'password': _passwordController.text,
      'full_name': _fullNameController.text,
      'mobile': _phoneNumberController.text,
    });

    final response = await http.post(apiUrl,
        body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print('con meo thanh cong');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'conmeo',
              callBack: () {},
              content: 'banlaconmeo',
              btnText: 'conmeook',
            );
          });
    } else {
      print('that bai con meo');
      print(response.body);
      print(_phoneNumberController.text);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'conmeo',
              callBack: () {},
              content: 'An error occurred: ${response.body}',
              btnText: 'conmeook',
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Đăng ký tài khoản',
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
                    'Nhập thông tin để đăng ký tài khoản',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff484848),
                    ),
                  ),
                  SizedBox(height: 20),
                  BuildFillBox(
                      hinttext: 'Họ tên', controller: _fullNameController),
                  SizedBox(height: 20),
                  BuildEmailBox(
                      controller: _emailController, hinttext: 'Địa chỉ email'),
                  SizedBox(height: 20),
                  BuildFillBox(
                      hinttext: 'Số điện thoại',
                      controller: _phoneNumberController),
                  SizedBox(height: 20),
                  BuildConfirmPasswordBox(controller: _passwordController),
                  SizedBox(height: 20),
                  BuildLogSignInBtn(
                      labeltext: 'Đăng ký',
                      callback: () {
                        _registerUser();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
