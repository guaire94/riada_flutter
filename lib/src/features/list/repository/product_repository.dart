import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_more_data_available_exception.dart';
import 'package:template_flutter_app/src/features/list/datasource/product_data_source.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductRepository {
  // MARK: -  Dependency
  final ProductDataSource _productDataSource;

  // MARK: - Properties
  List<Product> _items = [];

  // MARK: -  LifeCycle
  ProductRepository({
    required ProductDataSource productDataSource,
  })  : _productDataSource = productDataSource,
        super();

  // MARK: - Public
  List<Product> get items => _items;

  Future loadMore() async {
    final products = await _productDataSource.getProducts();

    if (products.isEmpty) {
      if (_items.isEmpty) throw NoDataAvailableException();

      throw NoMoreDataAvailableException();
    }

    _items.addAll(products);
  }

  Future<Product> getProductFrom(String productId) async {
    return _productDataSource.getProductFrom(productId);
  }

  reset() {
    _productDataSource.reset();
    _items = [];
  }
}
