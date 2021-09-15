class TestList {
  bool? success;
  List<Data>? data;
  String? message;

  TestList({this.success, this.data, this.message});

  factory TestList.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Data> dataList = list.map((data) => Data.fromJson(data)).toList();
    return TestList(
      success: json['success'],
      data: dataList,
      message: json['message'],
    );
  }
}

class Data {
  int? id;
  int? shopId;
  String? name;
  String? imageUrl;
  String? shortdescription;
  String? unit;
  String? quantity;
  int? price;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.shopId,
    this.name,
    this.imageUrl,
    this.shortdescription,
    this.unit,
    this.quantity,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        shopId: json['shop_id'],
        name: json['name'],
        imageUrl: json['image_url'],
        shortdescription: json['shortdescription'],
        unit: json['unit'],
        quantity: json['quantity'],
        price: json['price'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
