import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'caetgory_tabs.dart';
import 'music_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryTab(
                    title: 'Trending',
                    press: () {},
                    isActive: true,
                  ),
                  CategoryTab(
                    title: 'Music',
                    press: () {},
                  ),
                  CategoryTab(
                    title: 'Funny',
                    press: () {},
                  ),
                  CategoryTab(
                    title: 'Exclamation',
                    press: () {},
                  ),
                  CategoryTab(
                    title: 'Nature',
                    press: () {},
                  ),
                  CategoryTab(
                    title: 'Animal',
                    press: () {},
                  ),
                  CategoryTab(
                    title: 'Quote',
                    press: () {},
                  ),
                  CategoryTab(
                    title: 'Greeting',
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const MusicList(
                  txt: 'Time of Our lives',
                  img: 'assets/images/product_2.png',
                  mtime: '3:20',
                  txt2: 'Kathryn Stantiago',
                ),
                SizedBox(height: 10.h),
                const MusicList(
                  txt: 'Dont Stop The Party',
                  img: 'assets/images/product_2.png',
                  mtime: '4:20',
                  txt2: 'Estelle Patterson',
                ),
                SizedBox(height: 12.h),
                const MusicList(
                  txt: 'Let me Love You',
                  img: 'assets/images/product_2.png',
                  mtime: '5:25',
                  txt2: 'Kathryn Stantiago',
                ),
                SizedBox(height: 12.h),
                const MusicList(
                  txt: 'Give me Everything',
                  img: 'assets/images/product_2.png',
                  mtime: '3:40',
                  txt2: 'Kathryn Stantiago',
                ),
                SizedBox(height: 12.h),
                const MusicList(
                  txt: 'Hey Baby',
                  img: 'assets/images/product_2.png',
                  mtime: '3:20',
                  txt2: 'Estelle Patterson',
                ),
                SizedBox(height: 12.h),
                const MusicList(
                  txt: 'Back in Time',
                  img: 'assets/images/product_2.png',
                  mtime: '3:20',
                  txt2: 'Corey Morton',
                ),
                SizedBox(height: 12.h),
                const MusicList(
                  txt: 'Shut Down',
                  img: 'assets/images/product_2.png',
                  mtime: '4:20',
                  txt2: 'Kathryn Stantiago',
                ),
                SizedBox(height: 12.h),
                const MusicList(
                  txt: 'Echa Palla',
                  img: 'assets/images/product_2.png',
                  mtime: '3:20',
                  txt2: 'Corey Morton',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
