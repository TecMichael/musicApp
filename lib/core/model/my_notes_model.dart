class MyNotesModel {
  bool? error;
  List<Data>? data;

  MyNotesModel({this.error, this.data});

  MyNotesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? source;
  String? phrase;
  String? file;
  String? categoryId;
  String? categoryName;

  Data(
      {this.id,
      this.source,
      this.phrase,
      this.file,
      this.categoryId,
      this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    phrase = json['phrase'];
    file = json['file'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    data['phrase'] = phrase;
    data['file'] = file;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
