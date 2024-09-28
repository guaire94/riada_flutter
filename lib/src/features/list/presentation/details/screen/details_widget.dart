import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/features/common/presentation/common/gallery_carousel/gallery_carousel.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  // MARK: Dependencies
  final Product _product;

  // MARK: LifeCycle
  DetailsWidget({
    super.key,
    required Product product,
  }) : _product = product;

  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: DSSpacingV2.l,
            left: DSSpacingV2.l,
            right: DSSpacingV2.l,
          ),
          child: Column(
            children: [
              SizedBox(
                height: DSSpacingV2.xs,
              ),
              Container(
                height: DSImageTypeV2.xl.height,
                child: GalleryCarousel(
                  images: _product.images,
                  videos: [],
                ),
              ),
              SizedBox(height: DSSpacingV2.l),
            ],
          ),
        ),
      ),
    );
  }
}
