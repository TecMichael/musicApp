import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vgym/audio_module/screens/home_screen/home_screen.dart';
import 'package:vgym/screens/trim_audio_screen.dart';

class ChooseRecordOption extends StatefulWidget {
  const ChooseRecordOption({Key? key}) : super(key: key);

  @override
  _ChooseRecordOptionState createState() => _ChooseRecordOptionState();
}

class _ChooseRecordOptionState extends State<ChooseRecordOption> {
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  FileType _pickingType = FileType.audio;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      // print(_paths!.first.extension);
      _fileName =
      _paths != null ? _paths![0].path : '...';
    });
    openTrimAudioScreen();
    // if(_paths!=null && _paths!.isNotEmpty){
    // }
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result! ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  openTrimAudioScreen(){
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
              heightFactor: 0.7,
              child: TrimAudioScreen(audioFilePath: _fileName,));

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
            InkResponse(
              onTap: () {
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
                          heightFactor: 0.7,
                          child: AudioHomeScreen());
                    });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.indigo.withOpacity(0.3),
                      child: Icon(Icons.mic,color: Colors.indigo,)),
                  SizedBox(height: 10,),
                  Text('Record')
                ],
              ),
            ),

            InkResponse(
              onTap: (){
                _openFileExplorer();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.indigo.withOpacity(0.3),
                      child: Icon(Icons.library_music_rounded,color: Colors.indigo,)),
                  SizedBox(height: 10,),
                  Text('Choose Audio')
                ],
              ),
            ),
      ],
    ),
          ],
        ));
  }
}
