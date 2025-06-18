import 'package:flutter/material.dart';
import 'package:ecommerce/features/home/domain/entities/shortcut_entity.dart';

class ShortcutsSection extends StatelessWidget {
  final List<ShortcutEntity>? shortcuts;
  const ShortcutsSection({super.key, this.shortcuts});

  @override
  Widget build(BuildContext context) {
    final items = shortcuts ?? [
      ShortcutEntity(title: 'Past\norders', iconUrl: 'assets/images/shortcuts1.png'),
      ShortcutEntity(title: 'Super\nSaver', iconUrl: 'assets/images/shortcuts2back.png'),
      ShortcutEntity(title: 'Must-tries', iconUrl: 'assets/images/Shortcuts3.png'),
      ShortcutEntity(title: 'Give Back', iconUrl: 'assets/images/shortcuts4_hand.png'),
      ShortcutEntity(title: 'Best Sellers', iconUrl: 'assets/images/shortcuts5.png'),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) => ShortcutsFeatureIconRow(
          iconPath: item.iconUrl,
          label: item.title,
        )).toList(),
      ),
    );
  }
}

class CustomShortcutsitem4 extends StatelessWidget {
  const CustomShortcutsitem4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFFFCEFEF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Image.asset('assets/images/shortcuts4_heart-bold - Copy.png'),
              Image.asset('assets/images/shortcuts4_hand.png'),
            ],
          ),
        ),
        Text(
          'Give Back',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ShortcutsFeatureIconRow extends StatelessWidget {
  final String iconPath;
  final String? overlayIconPath;
  final String label;
  final bool isSelected;

  const ShortcutsFeatureIconRow({
    super.key,
    required this.iconPath,
    required this.label,
    this.overlayIconPath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFFCEFEF),
              borderRadius: BorderRadius.circular(16),
              border: isSelected
                  ? Border.all(color: Colors.blue, width: 2)
                  : null,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  iconPath,
                  width: 28,
                  height: 28,
                  color: Colors.purple,
                ),
                if (overlayIconPath != null)
                  Positioned(
                    top: 25,
                    right: 25,
                    child: Image.asset(overlayIconPath!, width: 12, height: 12),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}