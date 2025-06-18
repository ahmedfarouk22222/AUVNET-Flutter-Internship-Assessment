import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 89,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(-2, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 78.90,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                 
                Positioned.fill(
                  top: -4,
                  child: Image.asset(
                    'assets/images/Security Vault.png',
                    fit: BoxFit.cover,
                  ),
                ),

              
                Image.asset('assets/images/nawel 5.png', width: 24, height: 24),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Got a code !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Add your code and save on your/norder',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 128),
                  fontSize: 10,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
