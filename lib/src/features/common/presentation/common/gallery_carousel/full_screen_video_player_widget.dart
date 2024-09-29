import 'package:riada/src/design_system/ds_color.dart';
import 'package:riada/src/features/common/event_bus/exit_full_screen_event.dart';
import 'package:riada/src/utils/app_event_bus.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayerWidget extends StatefulWidget {
  // MARK: - Properties
  final VideoPlayerController _controller;

  // MARK: - Life cycle
  FullScreenVideoPlayerWidget({
    Key? key,
    required VideoPlayerController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<FullScreenVideoPlayerWidget> createState() =>
      _FullScreenVideoPlayerWidgetState();
}

class _FullScreenVideoPlayerWidgetState
    extends State<FullScreenVideoPlayerWidget> {
  // MARK: - Properties
  VideoPlayerController get _controller => widget._controller;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_videoListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: DSColor.neutral100,
        child: SafeArea(
          child: _controller.value.isInitialized ? _content() : _loader(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_videoListener);
  }

  // MARK: - Private
  Widget _content() {
    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
        Positioned(
          left: 40.0,
          bottom: 20.0,
          right: 40.0,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: DSColor.secondary100,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: DSColor.neutral5,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.fullscreen_exit,
                  color: DSColor.neutral5,
                ),
                onPressed: () {
                  AppEventBus.instance.fire(ExitFullScreenEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _loader() {
    return Center(
      child: CircularProgressIndicator(color: DSColor.secondary100),
    );
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
