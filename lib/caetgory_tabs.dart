import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required this.title,
    this.isActive = false,
    required this.press,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(title,
                style: isActive
                    ? const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)
                    : const TextStyle(fontSize: 13,fontWeight: FontWeight.w400)),
            if (isActive)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
          ],
        ),
      ),
    );
  }
}
