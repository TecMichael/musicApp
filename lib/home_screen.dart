import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vgym/constants.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best Songs',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
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
                  const SizedBox(height: 10),
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

class MusicList extends StatelessWidget {
  const MusicList({
    Key? key,
    required this.img,
    required this.txt,
    required this.txt2,
    required this.mtime,
  }) : super(key: key);
  final String img;
  final String txt;
  final String txt2;
  final String mtime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6.5,
            offset: const Offset(1, 9),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          height: 70.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultBorderRadius - 5),
            ),
            image:
                DecorationImage(image: AssetImage(img), fit: BoxFit.fitWidth),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          txt,
          style: GoogleFonts.roboto(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        subtitle: Text(
          txt2,
        ),
        onTap: () {},
        dense: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              mtime,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(width: 13),
            SvgPicture.asset(
              'assets/icons/play.svg',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
