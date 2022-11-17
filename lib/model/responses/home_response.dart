import 'item_by_category_response.dart';

class HomeResponse {
  bool? error;
  Data? data;

  HomeResponse({this.error, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Item>? items;
  List<Category>? categories;

  Data({this.items, this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(new Item.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Category {
  String? id;
  String? categoryName;
  String? categoryImage;
  String? categoryIcon;
  String? itemCount;

  Category(
      {this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['name'];
    // categoryImage = json['category_image'];
    // categoryIcon = json['category_icon'];
    // itemCount = json['item_count'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.categoryName;
    // data['category_image'] = this.categoryImage;
    // data['category_icon'] = this.categoryIcon;
    // data['item_count'] = this.itemCount;

    return data;
  }
}
