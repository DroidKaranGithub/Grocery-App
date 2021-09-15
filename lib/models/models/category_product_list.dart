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
  int? shopId;
  String? category;
  String? name;
  String? imageUrl;
  String? shortdescription;
  int? status;
  String? createdAt;
  String? updatedAt;

  CategoryList({
    this.id,
    this.shopId,
    this.category,
    this.name,
    this.imageUrl,
    this.shortdescription,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      id: json['id'],
      shopId: json['shop_id'],
      category: json['category'],
      name: json['name'],
      imageUrl: json['image_url'],
      shortdescription: json['shortdescription'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
