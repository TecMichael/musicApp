import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vgym/screens/categories/music.dart';
import 'package:vgym/utility/user_store.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserStore>(
        builder: (context, data, child) => Column(
          children: [
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
