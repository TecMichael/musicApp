import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<String> categories = [
    'Trending',
    'Music',
    'Funny',
    'Exclamation',
    'Nature',
    'Animal',
    'Quote',
    'Greeting'
  ];
  int selcetedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selcetedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  color: selcetedIndex == index ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2,
              width: 30,
              color: selcetedIndex == index ? Colors.blue : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
