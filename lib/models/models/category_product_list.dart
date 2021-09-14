class Categories {
  bool? success;
  List<CategoryList>? data;
  String? message;

  Categories({this.success, this.data, this.message});

  factory Categories.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CategoryList> listData =
        list.map((data) => CategoryList.fromJson(data)).toList();
    return Categories(
      success: json['success'],
      data: listData,
      message: json['message'],
    );
  }
}

class CategoryList {
  int? id;
  int? shop_id;
  String? category;
  String? name;
  String? image_url;
  String? shortdescription;
  int? status;
  String? created_at;
  String? updated_at;

  CategoryList({
    this.id,
    this.shop_id,
    this.category,
    this.name,
    this.image_url,
    this.shortdescription,
    this.status,
    this.created_at,
    this.updated_at,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      id: json['id'],
      shop_id: json['shop_id'],
      category: json['category'],
      name: json['name'],
      image_url: json['image_url'],
      shortdescription: json['shortdescription'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
