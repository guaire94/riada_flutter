import 'package:carousel_slider/carousel_slider.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:template_flutter_app/src/features/common/presentation/common/gallery_carousel/image_viewer.dart';
import 'package:template_flutter_app/src/features/common/presentation/common/gallery_carousel/video_player_widget.dart';
import 'package:flutter/widgets.dart';

class GalleryCarousel extends StatelessWidget {
  // MARK: Dependencies
  final List<String> images;
  final List<String> videos;

  // MARK: LifeCycle
  const GalleryCarousel({
    super.key,
    required this.images,
    this.videos = const [],
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length + videos.length,
      itemBuilder: (context, index, realIndex) {
        if (index < videos.length)
          return VideoPlayerWidget(videoUrl: videos[index]);

        return ImageViewer(photoUrl: images[index - videos.length]);
      },
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: DSImageTypeV2.xl.height,
        enableInfiniteScroll: false,
      ),
    );
  }
}
