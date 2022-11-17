import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TrimAudioScreen extends StatefulWidget {
 final String? audioFilePath;
  const TrimAudioScreen({Key? key,this.audioFilePath}) : super(key: key);

  @override
  _TrimAudioScreenState createState() => _TrimAudioScreenState();
}

class _TrimAudioScreenState extends State<TrimAudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  PlayerState audioPlayerState = PlayerState.PAUSED;
  double? maxPosition=0.0,currPosition=0.0,endPosition=0.0;
  RangeValues? range=RangeValues(0.0,100);
  static const barWidth = 5.0;
  double bar1Position = 60.0;
  double bar2Position = 180.0;
  List<int> bars = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // generate random bars
    // Random r = Random();
    // for (var i = 0; i < 50; i++) {
    //   bars.add(r.nextInt(50));
    // }
    audioPlayer.play(widget.audioFilePath!,isLocal: true);
    audioPlayer.pause();

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      audioPlayerState = s;
    });
    audioPlayer.onDurationChanged.listen((Duration duration) {
      print('max duration: ${duration.inSeconds}');
      setState(() {
        maxPosition = duration.inSeconds.toDouble();
        endPosition=duration.inSeconds.toDouble();
      });
    });



    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      print('current: ${duration.inSeconds}');
      print('end: ${duration.inSeconds}');

      setState(() {
        if(currPosition! <  endPosition!){
        currPosition = duration.inSeconds.toDouble();
        }
      });
    });




  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(icon: Icon(Icons.play_circle_fill),onPressed: () async{
            await audioPlayer.play(widget.audioFilePath!,isLocal: true);
             print(maxPosition);

            setState(()  {
            });


          },),

          IconButton(icon: Icon(Icons.stop_circle),onPressed: (){
          },),

     RangeSlider(
    values: RangeValues(currPosition!/60,endPosition!/60),
    max: maxPosition!/60,
    activeColor: Colors.indigoAccent,
    labels: RangeLabels(
      currPosition!.round().toString(),
         endPosition!.round().toString(),
       ),
       onChanged: (r){
         audioPlayer.pause();
         setState(() {
           currPosition=r.start;
           endPosition=r.end;
           print(r.start);
           print(r.end);

         });
         audioPlayer.seek(Duration(seconds: r.start.toInt()));
         audioPlayer.resume();
         print('changing start');
       },
    ),
          // Center(
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: bars.map((int height) {
          //             Color color =
          //             i >= bar1Position / barWidth && i <= bar2Position / barWidth
          //                 ? Colors.deepPurple
          //                 : Colors.blueGrey;
          //             i++;
          //
          //             return Container(
          //               color: color,
          //               height: height.toDouble(),
          //               width: 5.0,
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //       Bar(
          //         position: bar2Position,
          //         callback: (DragUpdateDetails details) {
          //           setState(() {
          //             bar2Position += details.delta.dx;
          //           });
          //         },
          //       ),
          //       Bar(
          //         position: bar1Position,
          //         callback: (DragUpdateDetails details) {
          //           setState(() {
          //             bar1Position += details.delta.dx;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }


}
class Bar extends StatelessWidget {
  final double? position;
  final GestureDragUpdateCallback? callback;

  Bar({this.position, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: position! >= 0.0 ? position! : 0.0),
      child: GestureDetector(
        onHorizontalDragUpdate: callback,
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 70.0,
              width: 5.0,
            ),
            Container(
              color: Colors.red,
              height: 30.0,
              width: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
