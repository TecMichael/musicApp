import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vgym/screens/categories/music.dart';
import 'package:vgym/utility/user_store.dart';

class Discover extends StatefulWidget {
  Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<UserStore>(
        builder: (context, data, child) => Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Discover other sounds',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MusicCategory(
                    id: data.categoryList[index].id,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
