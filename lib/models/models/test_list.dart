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
  int? shop_id;
  String? name;
  String? image_url;
  String? shortdescription;
  String? unit;
  String? quantity;
  int? price;
  int? status;
  String? created_at;
  String? updated_at;

  Data({
    this.id,
    this.shop_id,
    this.name,
    this.image_url,
    this.shortdescription,
    this.unit,
    this.quantity,
    this.price,
    this.status,
    this.created_at,
    this.updated_at,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        shop_id: json['shop_id'],
        name: json['name'],
        image_url: json['image_url'],
        shortdescription: json['shortdescription'],
        unit: json['unit'],
        quantity: json['quantity'],
        price: json['price'],
        status: json['status'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }
}
