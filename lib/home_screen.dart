import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vgym/audio_module/screens/home_screen/home_screen.dart';
import 'package:vgym/model/responses/home_response.dart';
import 'package:vgym/screens/categories/music.dart';
import 'package:vgym/utility/user_store.dart';
import 'bottom_bar.dart';
import 'music_list.dart';
import 'screens/choose_record_option.dart';
import 'screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _controller = PageController();
  List<String> title = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserStore>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   height: 60,
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       BottomNavItem(
      //         press: () {},
      //         svgSrc: 'assets/icons/home.svg',
      //         isActive: true,
      //       ),
      //       BottomNavItem(
      //         press: () {},
      //         svgSrc: 'assets/icons/search2.svg',
      //       ),
      //       BottomNavItem(
      //         press: () {},
      //         svgSrc: 'assets/icons/copy.svg',
      //       ),
      //       BottomNavItem(
      //         press: () {},
      //         svgSrc: 'assets/icons/fave.svg',
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text('Slimsic'),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset('assets/icons/search.svg'),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.8,
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Container(
                              height:3,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            SizedBox(height: 15,),

                            Expanded(child: SearchScreen()),
                          ],
                        ));
                  });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     showModalBottomSheet(
          //         context: context,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0),
          //         ),
          //         backgroundColor: Colors.white,
          //         isScrollControlled: true,
          //         isDismissible: true,
          //         builder: (context) {
          //           return FractionallySizedBox(
          //               heightFactor: 0.2,
          //               child: ChooseRecordOption());
          //         });
          //   },
          //   icon: const Icon(
          //     Icons.mic_rounded,
          //     color: Colors.white,
          //   ),
          // )
        ],
      ),
      body: Consumer<UserStore>(builder: (context, data, child) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: SizedBox(
                    height: 25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.categoryList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          buildCategory(data.categoryList[index], index),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    itemCount: data.categoryList.length,
                    itemBuilder: (ctx, pos) {
                      return MusicCategory(id: data.categoryList[pos].id,scrollAssist: false,);
                    },
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: data.currentlyPlayingNote == null
                  ? Container()
                  : Container(
                      height: 80,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade500,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Now Playing',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(data.currentlyPlayingNote!.title!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              data.currentlyPlayingNote == null
                                  ? data.playMusic(data.currentlyPlayingNote!)
                                  : data.currentlyPlayingNote!.id ==
                                          data.currentlyPlayingNote!.id
                                      ? data.audioPlayerState ==
                                              PlayerState.PLAYING
                                          ? data.pauseMusic()
                                          : data.playMusic(
                                              data.currentlyPlayingNote!)
                                      : data.playMusic(
                                          data.currentlyPlayingNote!);
                            },
                            icon: Icon(
                              data.currentlyPlayingNote == null
                                  ? Icons.play_arrow_rounded
                                  : data.currentlyPlayingNote!.id ==
                                          data.currentlyPlayingNote!.id
                                      ? data.audioPlayerState ==
                                              PlayerState.PLAYING
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded
                                      : Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
            )
          ],
        );
      }),
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
              color:
                  _currentIndex == index ? Colors.indigo : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
