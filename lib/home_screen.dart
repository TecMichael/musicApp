import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vgym/screens/categories/music.dart';
import 'bottom_bar.dart';
import 'music_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _controller = PageController();
  List<String> title = [
    'Trending',
    'Music',
    'Funny',
    'Exclamation',
    'Nature',
    'Animal',
    'Quote',
    'Greeting'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/home.svg',
              isActive: true,
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/search2.svg',
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/copy.svg',
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/fave.svg',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/search.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.short_text_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: title.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    buildCategory(index),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                // musicList(),
                musicList(),
                musicList(),
                musicList(),
                const MusicCategory(),
                musicList(),
                musicList(),
                musicList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget musicList() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
            MusicList(
            txt: 'Time of Our lives',
            img: 'assets/images/product_2.png',
            mtime: '3:20',
            txt2: 'Kathryn Stantiago',
          ),
          SizedBox(height: 10.h),
            MusicList(
            txt: 'Dont Stop The Party',
            img: 'assets/images/product_2.png',
            mtime: '4:20',
            txt2: 'Estelle Patterson',
          ),
          SizedBox(height: 12.h),
            MusicList(
            txt: 'Let me Love You',
            img: 'assets/images/product_2.png',
            mtime: '5:25',
            txt2: 'Kathryn Stantiago',
          ),
          SizedBox(height: 12.h),
            MusicList(
            txt: 'Give me Everything',
            img: 'assets/images/product_2.png',
            mtime: '3:40',
            txt2: 'Kathryn Stantiago',
          ),
          SizedBox(height: 12.h),
            MusicList(
            txt: 'Hey Baby',
            img: 'assets/images/product_2.png',
            mtime: '3:20',
            txt2: 'Estelle Patterson',
          ),
          SizedBox(height: 12.h),
            MusicList(
            txt: 'Back in Time',
            img: 'assets/images/product_2.png',
            mtime: '3:20',
            txt2: 'Corey Morton',
          ),
          SizedBox(height: 12.h),
            MusicList(
            txt: 'Shut Down',
            img: 'assets/images/product_2.png',
            mtime: '4:20',
            txt2: 'Kathryn Stantiago',
          ),
          SizedBox(height: 12.h),
            MusicList(
            txt: 'Echa Palla',
            img: 'assets/images/product_2.png',
            mtime: '3:20',
            txt2: 'Corey Morton',
          ),
        ],
      ),
    );
  }

  Widget buildCategory(int index) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title[index],
              style: TextStyle(
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2,
              width: 30,
              color: _currentIndex == index ? Colors.blue : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
