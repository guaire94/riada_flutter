import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decimal/decimal.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/decimal_json_converter.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/firestore_document_reference_json_converter.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:template_flutter_app/src/features/list/entity/json_converter/product_status_json_converter.dart';
import 'package:template_flutter_app/src/features/list/entity/product_status.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:template_flutter_app/src/utils/constants.dart';
import 'package:template_flutter_app/src/utils/decimal_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@FirestoreDocumentReferenceJsonConverter()
@DecimalJsonConverter()
@ProductStatusJsonConverter()
class Product {
  final String id;
  final String title;
  final List<String> images;
  final Decimal price;
  final Timestamp createdDate;
  final ProductStatus status;
  bool isAvailable;

  Product({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.status,
    required this.createdDate,
    required this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.toNewProduct({
    required String title,
    required DateTime purchaseDate,
    required String? size,
    required Decimal price,
    required DocumentReference seller,
  }) =>
      Product(
        id: EntityConstants.NO_ID,
        title: title,
        images: [],
        price: price,
        status: ProductStatus.approved,
        createdDate: Timestamp.now(),
        isAvailable: true,
      );

  Product copyWith({
    String? id,
    String? title,
    List<String>? images,
    Decimal? price,
    ProductStatus? status,
    bool? isAvailable,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      images: images ?? this.images,
      price: price ?? this.price,
      status: status ?? this.status,
      createdDate: createdDate,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  String priceDescription(BuildContext context) {
    return context.l10N.price(price.formatPrice());
  }
}
