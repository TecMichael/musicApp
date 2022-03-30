import 'package:vgym/core/model/my_notes_model.dart';

abstract class BaseApi {
  Future<MyNotesModel> myNoteApi();
  // Future<MyNotesModel> myNoteApiPost({email, password});
}
