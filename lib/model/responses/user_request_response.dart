import 'item_by_category_response.dart';

class UserRequestsResponse {
  bool? error;
  List<Item>? data;

  UserRequestsResponse({this.error, this.data});

  UserRequestsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <Item>[];
      json['data'].forEach((v) {
        data!.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

