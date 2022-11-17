import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vgym/services/api_service.dart';


import '../core/api.dart';
import '../core/model/my_notes_model.dart';
import '../model/responses/home_response.dart';
import '../model/responses/login_response.dart';
import '../model/responses/sign_up_response.dart';
import '../services/cache_helper.dart';

class UserStore extends ChangeNotifier {
  /// Internal, private state of the cart.
  User? currUser ;
  CacheHelper cacheHelper=CacheHelper();
  List<Category> categoryList=[];

  AudioPlayer audioPlayer = AudioPlayer();

  PlayerState audioPlayerState = PlayerState.PAUSED;
  Note? currentlyPlayingNote;

  bool? isShareLoading=false;

  void fetchCurrentUser( ) async{
    SignInResponse response =await cacheHelper.getCurrentUser();
    currUser = response.account!;
    notifyListeners();
  }

  void getCategories() async{
    MyNotesModel res = await Api().myNoteApi('0');
    categoryList = res.categories!;
    notifyListeners();
  }

  void playMusic(Note note) async{
    print('play music called');
    var url = Uri.encodeFull(note.file!);
    print(url);
    currentlyPlayingNote=note;
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
        audioPlayerState = s;
        notifyListeners();

    });
    await audioPlayer.play(url);
    notifyListeners();
  }

  void pauseMusic() async{
    await audioPlayer.pause();

  }
  Future<void> shareFile(filePath) async {

    await FlutterShare.shareFile(
      title: 'Slimsic',
      text: 'Exchange audio in an interesting way on slimsic',
      filePath: filePath as String,
    );
  }

 Future downloadLocally(url,context) async{
    isShareLoading=true;notifyListeners();
      debugPrint(url);
    try{

      Directory? appDocDir = Directory('/storage/emulated/0/Download');
      final targetPath = appDocDir.path;
      var targetFileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '_slimsic.mp3';
     String? result=await ApiService().downloadFile(url, targetFileName, targetPath);
     if(result.contains("Error")){
       debugPrint(result);
       Flushbar(
         message: 'Oops an error occured!',
         duration: Duration(seconds: 1),
       ).show(context);
     }else{

       shareFile(result);
     }
      isShareLoading=false;notifyListeners();

    }
    catch(e){
      isShareLoading=false;notifyListeners();
      Flushbar(
        message: 'Oops an error occured!',
        duration: Duration(seconds: 1),
      ).show(context);
      debugPrint(e.toString());
    }

 }



}