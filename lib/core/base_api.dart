import 'package:vgym/core/model/my_notes_model.dart';

abstract class BaseApi {
  Future<MyNotesModel> myNoteApi(id);
  Future<MyNotesModel> searchNotes(query);

// Future<MyNotesModel> myNoteApiPost({email, password});
}
