import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vgym/core/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:vgym/core/base_url.dart';
import 'package:vgym/core/model/my_notes_model.dart';

var urls = BaseUrl();

class Api extends BaseApi {
  @override
  Future<MyNotesModel> myNoteApi(id) async {
    try {
      final response = await http.get(Uri.parse(urls.notesUrl+id));
      print(response);

      if (response.statusCode == 200) {
        var convert = json.decode(response.body);
        MyNotesModel myNote = MyNotesModel.fromJson(convert);
        return myNote;
      } else {
        return MyNotesModel(error: true);
      }
    } catch (e) {
      debugPrint('$e');
      return MyNotesModel(error: true);
    }
  }

  @override
  Future<MyNotesModel> searchNotes(query) async {
    try {

      final response = await http.get(Uri.parse(urls.searchNotesUrl+query));
      print(urls.searchNotesUrl+query);

      if (response.statusCode == 200) {
        var convert = json.decode(response.body);
        MyNotesModel myNote = MyNotesModel.fromJson(convert);
        return myNote;
      } else {
        return MyNotesModel(error: true);
      }
    } catch (e) {
      debugPrint('$e');
      return MyNotesModel(error: true);
    }
  }

  // @override
  // Future<MyNotesModel> myNoteApiPost({email, password}) async {
  //   var body = {
  //     "email": email,
  //     "password": password,
  //   };
  //   try {
  //     final response = await http.post(Uri.parse(urls.notesUrl), body: body);

  //     if (response.statusCode == 200) {
  //       var convert = json.decode(response.body);
  //       MyNotesModel myNote = MyNotesModel.fromJson(convert);
  //       return myNote;
  //     } else {
  //       return MyNotesModel(error: true);
  //     }
  //   } catch (e) {
  //     debugPrint('$e');
  //     return MyNotesModel(error: true);
  //   }
  // }
}
