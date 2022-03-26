import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.svgSrc,
    required this.press,
    this.isActive = false,
  }) : super(key: key);
  final String svgSrc;
  final VoidCallback press;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgSrc,
            height: 25,
            color: isActive ? Colors.blue : Colors.black,
          )
        ],
      ),
    );
  }
}
