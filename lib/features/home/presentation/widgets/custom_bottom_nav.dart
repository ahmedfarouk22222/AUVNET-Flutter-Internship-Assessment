
import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> navItems = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'Categories', 'icon': Icons.category},
    {'label': 'Deliver', 'icon': Icons.delivery_dining},
    {'label': 'Cart', 'icon': Icons.shopping_cart},
    {'label': 'Profile', 'icon': Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // الخط العلوي للعنصر المحدد
          Positioned(
            left: 23.0 + (selectedIndex * 78.0),
            top: 0,
            child: Container(
              width: 51,
              height: 6,
              decoration: ShapeDecoration(
                color: Color(0xFF8900FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
          ),

          // العناصر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: SizedBox(
                  width: 73.8,
                  height: 46,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'],
                        size: 24,
                        color: isSelected
                            ? Color(0xFF8900FE)
                            : Color(0xFF474B51),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item['label'],
                        style: TextStyle(
                          color: isSelected
                              ? Color(0xFF8900FE)
                              : Color(0xFF474B51),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
