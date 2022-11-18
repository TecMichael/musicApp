import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'core/model/my_notes_model.dart';
import 'utility/user_store.dart';

class MusicList extends StatefulWidget {
  const MusicList({
    Key? key,
    this.note,
    required this.img,
    required this.txt,
    required this.txt2,
    required this.txt3,
    required this.mtime,
    this.musicFile,
  }) : super(key: key);
  final String img;
  final String txt;
  final String txt2;
  final String txt3;
  final String mtime;
  final String? musicFile;
  final Note? note;

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   audioPlayer.pause();
  //   audioPlayer.stop();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6.5,
            offset: const Offset(1, 9),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<UserStore>(builder: (context, data, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.txt,
                        style: GoogleFonts.roboto(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.txt2}',
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    data.currentlyPlayingNote == null
                        ? data.playMusic(widget.note!)
                        : data.currentlyPlayingNote!.id == widget.note!.id
                            ? data.audioPlayerState == PlayerState.PLAYING
                                ? data.pauseMusic()
                                : data.playMusic(widget.note!)
                            : data.playMusic(widget.note!);
                  },
                  icon: Icon(
                    data.currentlyPlayingNote == null
                        ? Icons.play_arrow_rounded
                        : data.currentlyPlayingNote!.id == widget.note!.id
                            ? data.audioPlayerState == PlayerState.PLAYING
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded
                            : Icons.play_arrow_rounded,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    data.downloadLocally(widget.musicFile, context);
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 18,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            );
          }),
          Text.rich(TextSpan(
              text: '"',
              style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepOrangeAccent),
              children: <InlineSpan>[
                TextSpan(
                  text: '${widget.txt3}',
                  style: GoogleFonts.roboto(
                      fontSize: 16.5.sp,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                TextSpan(
                  text: ' "',
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.deepOrangeAccent),
                )
              ])),
        ],
      ),
    );
  }
}
