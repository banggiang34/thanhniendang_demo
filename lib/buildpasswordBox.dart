import 'package:flutter/material.dart';

class BuildPasswordBox extends StatefulWidget {
  const BuildPasswordBox({
    //this.fieldKey,
    this.validator,
    this.onFieldSubmitted,
    required this.controller,
  });

  //final Key? fieldKey;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController controller;

  @override
  _BuildPasswordBoxState createState() => _BuildPasswordBoxState();
}

class _BuildPasswordBoxState extends State<BuildPasswordBox> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      //key: widget.fieldKey,
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      obscureText: _obscureText,
      //onSaved: widget.onSaved,
      validator: widget.validator,
      //onFieldSubmitted: widget.onFieldSubmitted,
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
        //labelText: widget.labelText,
        //helperText: widget.helperText,
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
    );
  }
}
