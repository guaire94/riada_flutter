// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: const DecimalJsonConverter().fromJson(json['price'] as String),
      status:
          const ProductStatusJsonConverter().fromJson(json['status'] as String),
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'price': const DecimalJsonConverter().toJson(instance.price),
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'status': const ProductStatusJsonConverter().toJson(instance.status),
      'isAvailable': instance.isAvailable,
    };
