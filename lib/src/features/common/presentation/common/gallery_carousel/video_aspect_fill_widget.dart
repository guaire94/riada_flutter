import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAspectFillWidget extends StatefulWidget {
  // MARK: - Properties
  final VideoPlayerController _controller;
  final double _containerWidth;
  final double _containerHeight;

  VideoAspectFillWidget({
    Key? key,
    required VideoPlayerController controller,
    required double containerWidth,
    required double containerHeight,
  })  : _controller = controller,
        _containerWidth = containerWidth,
        _containerHeight = containerHeight,
        super(key: key);

  @override
  State<VideoAspectFillWidget> createState() => _VideoAspectFillWidgetState();
}

class _VideoAspectFillWidgetState extends State<VideoAspectFillWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    late Widget content;

    // For square video, just show the player
    if (widget._controller.value.aspectRatio == 1) {
      content = VideoPlayer(widget._controller);
    }

    Axis axis;
    double width;
    double height;
    double offset;
    if (widget._controller.value.size.width >
        widget._controller.value.size.height) {
      // Horizontal
      axis = Axis.horizontal;
      width = (widget._controller.value.size.width * widget._containerHeight) /
          widget._controller.value.size.height;
      height = widget._containerHeight;
      offset = width / 2;
    } else {
      // Vertical
      axis = Axis.vertical;
      width = widget._containerWidth;
      height = (widget._controller.value.size.height * widget._containerWidth) /
          widget._controller.value.size.width;
      offset = height / 2;
    }
    _scrollController = ScrollController(initialScrollOffset: offset);
    content = SingleChildScrollView(
      scrollDirection: axis,
      controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        constraints: BoxConstraints.loose(
          Size(width, height),
        ),
        child: VideoPlayer(widget._controller),
      ),
    );

    return Container(
      height: DSImageTypeV2.xl.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DSBorderRadiusV2.normal),
        child: AspectRatio(
          aspectRatio: widget._controller.value.aspectRatio,
          child: content,
        ),
      ),
    );
  }
}
