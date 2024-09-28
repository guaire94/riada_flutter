import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/features/common/datasource/base_data_source.dart';
import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:template_flutter_app/src/features/list/entity/product_status.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDataSource extends BaseDataSource {
  // MARK: - Properties
  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;
  final int _perPage = 10;

  // MARK: - Public
  Future<List<Product>> getProducts() async {
    if (!_hasMore) {
      return [];
    }
    Query query = await productCollection()
        .orderBy('createdDate', descending: true)
        .where("status", isEqualTo: ProductStatus.approved.name)
        .where("isAvailable", isEqualTo: true);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    query = query.limit(_perPage);

    final querySnapshot = await query.get();

    if (querySnapshot.docs.length < _perPage) {
      _hasMore = false;
    }

    _lastDocument = querySnapshot.docs.isNotEmpty
        ? querySnapshot.docs[querySnapshot.docs.length - 1]
        : null;

    return querySnapshot.docs.map((product) {
      final data = product.data() as Map<String, dynamic>?;
      if (data == null) {
        throw NoDataAvailableException();
      }
      return Product.fromJson(data);
    }).toList();
  }

  Future<List<Product>> getLatestProducts({
    required int limit,
  }) async {
    Query query = await productCollection()
        .orderBy('createdDate', descending: true)
        .where("status", isEqualTo: ProductStatus.approved.name)
        .where("isAvailable", isEqualTo: true)
        .limit(limit);

    final querySnapshot = await query.get();

    return querySnapshot.docs.map((product) {
      final data = product.data() as Map<String, dynamic>?;
      if (data == null) {
        throw NoDataAvailableException();
      }
      return Product.fromJson(data);
    }).toList();
  }

  Future<Product> getProductFrom(String productId) async {
    final product = await productReference(productId).get();
    final data = product.data() as Map<String, dynamic>?;
    if (data == null) {
      throw new NoDataAvailableException();
    }
    return Product.fromJson(data);
  }

  Future<Product> getProductBy({
    required DocumentReference reference,
  }) async {
    final product = await reference.get();
    final data = product.data() as Map<String, dynamic>?;
    if (data == null) {
      throw new NoDataAvailableException();
    }
    return Product.fromJson(data);
  }

  reset() {
    _lastDocument = null;
    _hasMore = true;
  }
}
