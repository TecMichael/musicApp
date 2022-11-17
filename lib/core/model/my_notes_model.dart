import 'package:vgym/model/responses/home_response.dart';

class MyNotesModel {
  bool? error;
  List<Note>? data;
  List<Category>? categories;
  MyNotesModel({this.error, this.data,this.categories});

  MyNotesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <Note>[];
      json['data'].forEach((v) {
        data!.add(Note.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Note {
  String? id;
  String? source;
  String? phrase;
  String? file;
  String? title;
  String? categoryId;
  String? categoryName;

  Note(
      {this.id,
      this.source,
      this.phrase,
      this.file,
        this.title,
      this.categoryId,
      this.categoryName});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    phrase = json['phrase'];
    file = json['file'];
    title = json['title'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    data['phrase'] = phrase;
    data['file'] = file;
    data['title'] = title;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
