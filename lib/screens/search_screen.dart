import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vgym/model/responses/home_response.dart';
import 'package:vgym/screens/categories/music.dart';
import 'package:vgym/utility/user_store.dart';


class SearchScreen extends StatefulWidget {
  static String routeName = "/home";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentIndex = 0;
  final PageController _controller = PageController();
  List<String> title = [];
  String? query;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),

                      Center(child: MusicCategory(id:'1',scrollAssist: true,searchQuery: query,)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Search by phrases'
                        ),
                        onChanged: (value){
                          setState(() {
                            query=value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
                Consumer<UserStore>(
                builder: (context, data, child) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child:data.currentlyPlayingNote==null?Container(): Container(
                      height: 80,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade500,
                        borderRadius: BorderRadius.circular(15)
                      ),

                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Now Playing',style: TextStyle(color: Colors.white70),),
                              Text(data.currentlyPlayingNote!.title!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500))
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              data.currentlyPlayingNote==null?
                              data.playMusic(data.currentlyPlayingNote!):
                              data.currentlyPlayingNote!.id ==data.currentlyPlayingNote!.id?
                              data.audioPlayerState == PlayerState.PLAYING
                                  ? data.pauseMusic()
                                  : data.playMusic(data.currentlyPlayingNote!):data.playMusic(data.currentlyPlayingNote!);
                            },
                            icon: Icon(
                              data.currentlyPlayingNote==null?Icons.play_arrow_rounded:
                              data.currentlyPlayingNote!.id ==data.currentlyPlayingNote!.id?
                              data.audioPlayerState == PlayerState.PLAYING
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded:Icons.play_arrow_rounded,
                              color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  );},
                )
              ],
            );
  }


  Widget buildCategory(Category category, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _controller.jumpToPage(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.categoryName!,
              style: TextStyle(
                  color: _currentIndex == index ? Colors.indigo : Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2,
              width: 30,
              color: _currentIndex == index ? Colors.indigo : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
