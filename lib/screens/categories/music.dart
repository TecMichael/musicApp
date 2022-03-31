import 'package:flutter/material.dart';
import 'package:vgym/core/api.dart';
import 'package:vgym/core/model/my_notes_model.dart';
import 'package:vgym/music_list.dart';

class MusicCategory extends StatefulWidget {
  const MusicCategory({Key? key}) : super(key: key);

  @override
  State<MusicCategory> createState() => _MusicCategoryState();
}

class _MusicCategoryState extends State<MusicCategory> {
  Future<MyNotesModel>? notes;

  @override
  void initState() {
    notes = Api().myNoteApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyNotesModel>(
      future: notes,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center();
          case ConnectionState.waiting:
            return const Center(child:  CircularProgressIndicator());
          case ConnectionState.active:
            return const Center();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Center(
                child: Text('Unable to get Music List. Kindly Refresh'),
              );
            } else if (snapshot.hasData) {
              return musicWidget(snapshot.data!);
            } else {
              return const Text('No Internet Connection');
            }
        }
      },
    );
  }

  Widget musicWidget(MyNotesModel data) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: data.data!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MusicList(
            txt: '${data.data![index].phrase}',
            img: 'assets/images/product_2.png',
            mtime: '3:20',
            txt2: '${data.data![index].source}',
            musicFile: data.data![index].file,
          );
        },
      ),
    );
  }
}
