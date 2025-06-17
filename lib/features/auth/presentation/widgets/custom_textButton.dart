import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(0, 0),
      ),
      child: Text(
        'Create an account',
        style: TextStyle(
          color: Color(0xFF1877F2),
          fontSize: 14,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
