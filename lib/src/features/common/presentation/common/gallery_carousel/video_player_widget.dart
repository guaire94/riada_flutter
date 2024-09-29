import 'dart:io';

import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/common/event_bus/exit_full_screen_event.dart';
import 'package:riada/src/features/common/presentation/common/gallery_carousel/full_screen_video_player_widget.dart';
import 'package:riada/src/features/common/presentation/common/gallery_carousel/video_aspect_fill_widget.dart';
import 'package:riada/src/utils/app_event_bus.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  // MARK: - Properties
  final String _videoUrl;

  // MARK: - Life cycle
  const VideoPlayerWidget({
    Key? key,
    required String videoUrl,
  })  : _videoUrl = videoUrl,
        super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  // MARK: - Constants
  static const double _fullScreenControlButtonSize = 30;
  static const double _controlButtonSize = 60;
  static const double _controlSize = 30;
  static const double _controlButtonOpacity = 0.4;

  // MARK: - Properties
  late VideoPlayerController _controller;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    if (widget._videoUrl.startsWith("https")) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget._videoUrl),
      )..initialize().then((_) {
          setState(() {});
        });
    } else {
      File file = File(widget._videoUrl);
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {});
        });
    }
    AppEventBus.instance.on<ExitFullScreenEvent>().listen((event) {
      setState(() {
        _exitFullscreen();
      });
    });
    _controller.addListener(_videoListener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [DSColorV2.secondary30, DSColorV2.secondary],
        ),
        borderRadius: BorderRadius.circular(DSBorderRadiusV2.normal),
      ),
      child: _controller.value.isInitialized ? _content() : _loader(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_videoListener);
    _controller.dispose();
  }

  // MARK: - Private
  Widget _content() {
    return InkWell(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Stack(
        children: [
          VideoAspectFillWidget(
            controller: _controller,
            containerWidth: DSImageTypeV2.xl.width,
            containerHeight: DSImageTypeV2.xl.height,
          ),
          if (!_controller.value.isPlaying)
            Positioned(
              child: Container(
                height: DSImageTypeV2.xl.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [DSColorV2.secondary30, DSColorV2.secondary],
                  ),
                  borderRadius: BorderRadius.circular(DSBorderRadiusV2.normal),
                ),
              ),
            ),
          if (!_controller.value.isPlaying)
            Center(
              child: _controlButton(),
            ),
          Positioned(
            top: DSSpacingV2.xs,
            right: DSSpacingV2.xs,
            child: Container(
              width: _fullScreenControlButtonSize,
              height: _fullScreenControlButtonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DSColorV2.secondary,
              ),
              child: new IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.fullscreen,
                  color: DSColorV2.neutral10,
                ),
                onPressed: () {
                  _switchToFullscreen();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loader() {
    return Center(
      child: CircularProgressIndicator(color: DSColorV2.secondary),
    );
  }

  Widget _controlButton() {
    return Opacity(
      opacity: _controlButtonOpacity,
      child: Container(
        width: _controlButtonSize,
        height: _controlButtonSize,
        child: Center(
          child: Icon(
            Icons.play_arrow,
            color: DSColorV2.neutral10,
            size: _controlSize,
          ),
        ),
      ),
    );
  }

  _switchToFullscreen() {
    _overlayEntry = OverlayEntry(builder: (context) {
      return Scaffold(
        body: FullScreenVideoPlayerWidget(
          controller: _controller,
        ),
      );
    });

    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  _exitFullscreen() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  _videoListener() {
    if (_controller.value.position >= _controller.value.duration) {
      // VIDEO ended
      setState(() {
        _controller.pause();
        _controller.seekTo(Duration(
          hours: 0,
          minutes: 0,
          seconds: 0,
          milliseconds: 0,
        ));
      });
    }
  }
}
