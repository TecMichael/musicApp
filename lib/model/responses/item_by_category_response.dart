class ItemByCategoryResponse {
  bool? error;
  List<Item>? data;

  ItemByCategoryResponse({this.error, this.data});

  ItemByCategoryResponse.fromJson(Map<String, dynamic> json) {
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

class Item {
  String? id;
  String? itemName;
  String? timecreated;
  String? itemDescription;
  String? itemImage;
  String? categoryId;
  String? categoryName;
  String? status;

  Item(
      {this.id,
        this.status,
        this.itemName,
        this.timecreated,
        this.itemDescription,
        this.itemImage,
        this.categoryId,
        this.categoryName});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    itemName = json['item_name'];
    timecreated = json['timecreated'];
    itemDescription = json['item_description'];
    itemImage = json['item_image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['item_name'] = this.itemName;
    data['timecreated'] = this.timecreated;
    data['item_description'] = this.itemDescription;
    data['item_image'] = this.itemImage;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    return data;
  }
}
