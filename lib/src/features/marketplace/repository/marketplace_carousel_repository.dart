import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/item/marketplace_carousel_item.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:template_flutter_app/src/features/list/datasource/product_data_source.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarketplaceCarouselRepository {
  //MARK: -  Dependency
  final ProductDataSource _productDataSource;

  //MARK: - Properties
  List<MarketplaceCarouselItem> _items = [];

  // MARK: - Getter
  List<MarketplaceCarouselItem> get items => _items;

  //MARK: -  LifeCycle
  MarketplaceCarouselRepository({
    required ProductDataSource productDataSource,
  })  : _productDataSource = productDataSource,
        super();

  //MARK: - Public
  Future load({
    required MarketplaceCarouselType type,
  }) async {
    if (items.isEmpty) {
      switch (type) {
        case MarketplaceCarouselType.list:
          await _loadSecondHands();
          break;
      }
    }
  }

  // MARK: - Private
  Future _loadSecondHands() async {
    List<Product> products =
        await _productDataSource.getLatestProducts(limit: 5);
    _items.addAll(products.map((e) => ProductMarketplaceItem(product: e)));
  }
}
