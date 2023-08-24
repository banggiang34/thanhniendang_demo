import 'package:flutter/material.dart';

class BuildConfirmPasswordBox extends StatefulWidget {
  const BuildConfirmPasswordBox({
    required this.controller,
  });

  final TextEditingController controller;
  @override
  _BuildConfirmPasswordBoxState createState() =>
      _BuildConfirmPasswordBoxState();
}

class _BuildConfirmPasswordBoxState extends State<BuildConfirmPasswordBox> {
  //final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showError = false;
  bool _obscureText = true;

  void _validatePassword() {
    final enteredPassword = widget.controller.text;
    final confirmedPassword = _confirmPasswordController.text;

    setState(() {
      _showError = enteredPassword != confirmedPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Mật khẩu',
            hintStyle: TextStyle(
              color: Color(0xffA3A3A3),
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDDDDDD), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0269E9), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Color(0xffA3A3A3),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Nhập lại mật khẩu',
            errorText: _showError ? 'Passwords do not match' : null,
            hintStyle: TextStyle(
              color: Color(0xffA3A3A3),
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDDDDDD), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0269E9), width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Color(0xffA3A3A3),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          onChanged: (value) {
            _validatePassword();
          },
        ),
      ],
    );
  }
}
