// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      shopId: json['shop_id'] as int?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      shortdescription: json['shortdescription'] as String?,
      unit: json['unit'] as String?,
      quantity: json['quantity'] as String?,
      manageQuantity: json['manage_quantity'] as String?,
      totalQuantity: json['total_quantity'] as int?,
      price: json['price'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'shop_id': instance.shopId,
      'name': instance.name,
      'photo': instance.photo,
      'shortdescription': instance.shortdescription,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'manage_quantity': instance.manageQuantity,
      'total_quantity': instance.totalQuantity,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
