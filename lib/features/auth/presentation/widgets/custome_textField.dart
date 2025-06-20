import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField({
    super.key,
    required this.hint,
    this.email,
    this.password,
    this.obsecure = false,
    required this.onChanged,
    required this.icon,
  });
  final Icon icon;
  final String hint;
  final String? email;
  final String? password;
  Function(String) onChanged;
  bool obsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please fill the field';
        }
      },
      style: TextStyle(color: Color(0xffB4B4B4)),
      onChanged: onChanged,

      decoration: InputDecoration(
        fillColor: Color(0x33C4C4C4),
        filled: true,
        prefixIcon: icon,
        
        hintText: hint,
        hintStyle: TextStyle(color: Color(0xffB4B4B4)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0x33C4C4C4), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
