import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/common/presentation/common/gallery_carousel/gallery_carousel.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:flutter/material.dart';

class EventDetailsWidget extends StatelessWidget {
  // MARK: Dependencies
  final Event _event;

  // MARK: LifeCycle
  EventDetailsWidget({
    super.key,
    required Event event,
  }) : _event = event;

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
                  images: [
                    "https://picsum.photos/702/300",
                    "https://picsum.photos/701/300"
                  ],
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
