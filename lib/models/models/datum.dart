import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  @JsonKey(name: 'shop_id')
  int? shopId;
  String? name;
  String? photo;
  String? shortdescription;
  String? unit;
  String? quantity;
  @JsonKey(name: 'manage_quantity')
  String? manageQuantity;
  @JsonKey(name: 'total_quantity')
  int? totalQuantity;
  int? price;
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.shopId,
    this.name,
    this.photo,
    this.shortdescription,
    this.unit,
    this.quantity,
    this.manageQuantity,
    this.totalQuantity,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Datum &&
        other.id == id &&
        other.shopId == shopId &&
        other.name == name &&
        other.photo == photo &&
        other.shortdescription == shortdescription &&
        other.unit == unit &&
        other.quantity == quantity &&
        other.manageQuantity == manageQuantity &&
        other.totalQuantity == totalQuantity &&
        other.price == price &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      shopId.hashCode ^
      name.hashCode ^
      photo.hashCode ^
      shortdescription.hashCode ^
      unit.hashCode ^
      quantity.hashCode ^
      manageQuantity.hashCode ^
      totalQuantity.hashCode ^
      price.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
