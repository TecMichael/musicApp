import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

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
