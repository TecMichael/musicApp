import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vgym/core/api.dart';
import 'package:vgym/core/model/my_notes_model.dart';
import 'package:vgym/music_list.dart';
import 'package:vgym/utility/user_store.dart';

class MusicCategory extends StatefulWidget {
  String? id;
  bool? scrollAssist;
  String? searchQuery;
  MusicCategory({Key? key,this.id,this.scrollAssist,this.searchQuery}) : super(key: key);

  @override
  State<MusicCategory> createState() => _MusicCategoryState();
}

class _MusicCategoryState extends State<MusicCategory> {
  Future<MyNotesModel>? notes;

  @override
  void initState() {
    if(widget.searchQuery!=null){
      // its a search
      notes = Api().searchNotes(widget.searchQuery);
      print(widget.searchQuery);
    }else{
      // its a category
      notes = Api().myNoteApi(widget.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.searchQuery!=null){
      // its a search
      notes = Api().searchNotes(widget.searchQuery);
      print(widget.searchQuery);
    }
    return FutureBuilder<MyNotesModel>(
      future: notes,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center();
          case ConnectionState.waiting:
            return const Center(child:  CircularProgressIndicator(color: Colors.orange,));
          case ConnectionState.active:
            return const Center();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Center(
                child: Text('Unable to get Music List. Kindly Refresh'),
              );
            } else if (snapshot.hasData) {
              if(snapshot.data!.data==null){
                return Center(child: const Text('No Result Found'));
              }else{
                if(snapshot.data!.data!.isEmpty){
                  return Center(child: const Text('No Result Found'));

                }else{
                  return musicWidget(snapshot.data!);

                }
              }
            } else {
              return const Text('No Internet Connection');
            }
        }
      },
    );
  }

  Widget musicWidget(MyNotesModel data) {
    return ListView.builder(
      itemCount: data.data!.length,
      shrinkWrap: widget.scrollAssist!,
      physics: widget.scrollAssist!?NeverScrollableScrollPhysics():AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MusicList(
          txt: '${data.data![index].title}',
          img: 'assets/images/product_2.png',
          mtime: '3:20',
          txt2: '${data.data![index].source}',
          txt3: '${data.data![index].phrase}',
          musicFile: data.data![index].file,
          note:data.data![index] ,
        );
      },
    );
  }
}
