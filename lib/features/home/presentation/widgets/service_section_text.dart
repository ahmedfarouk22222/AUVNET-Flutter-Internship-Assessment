
import 'package:flutter/material.dart';

class ServiceSectionText extends StatelessWidget {
  const ServiceSectionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
    
      children: [
        Text(
          'Services:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}