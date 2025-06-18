
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 156,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.00, 0.05),
          end: Alignment(0.93, 1.10),
          colors: [const Color(0xFF8900FE), const Color(0xFFFFDE59)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 35.0,
          right: 30,
          left: 31,
          bottom: 37,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Delivering to',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Al Satwa, 81A Street',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.02,
                  ),
                ),
                Text(
                  'Hi hepa! ',
                  style: TextStyle(
                    color: const Color(0xFFF9F9F9),
                    fontSize: 30,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.30,
                  ),
                ),
              ],
            ),
            Container(
              width: 60,
              height: 60,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Ellipse 26.png'),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}