import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class MusicList extends StatefulWidget {
  const MusicList({
    Key? key,
    required this.img,
    required this.txt,
    required this.txt2,
    required this.mtime,
     this.musicFile,

  }) : super(key: key);
  final String img;
  final String txt;
  final String txt2;
  final String mtime;
  final String? musicFile;

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  AudioPlayer audioPlayer = AudioPlayer();

  PlayerState audioPlayerState = PlayerState.PAUSED;
  String? url;



  @override
  void initState() {
    super.initState();
     url = 'https://www.slimsic.com/web/media/${widget.musicFile}';

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.pause();
    audioPlayer.stop();
  }

  playMusic() async {
    await audioPlayer.play(url!);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

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
            image: DecorationImage(
                image: AssetImage(widget.img), fit: BoxFit.fitWidth),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(
          widget.txt,
          style: GoogleFonts.roboto(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        subtitle: Text(
          widget.txt2,
        ),
        onTap: () {},
        dense: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.mtime,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(width: 13),
            IconButton(
              onPressed: () {
                audioPlayerState == PlayerState.PLAYING
                    ? pauseMusic()
                    : playMusic();
              },
              icon: Icon(audioPlayerState == PlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded),
            )
          ],
        ),
      ),
    );
  }
}
