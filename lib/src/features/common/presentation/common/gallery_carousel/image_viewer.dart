import 'package:riada/src/design_system/ds_image.dart';
import 'package:riada/src/design_system/ds_image_type.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/features/common/event_bus/exit_full_screen_event.dart';
import 'package:riada/src/utils/app_event_bus.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  // MARK: - Properties
  final String _photoUrl;

  // MARK: - Life cycle
  const ImageViewer({
    Key? key,
    required String photoUrl,
  })  : _photoUrl = photoUrl,
        super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  // MARK: - Properties
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
    AppEventBus.instance.on<ExitFullScreenEvent>().listen((event) {
      setState(() {
        _exitFullscreen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        _switchToFullscreen();
      },
      child: Container(
        child: Stack(
          children: [
            DSImageV2(
              type: DSImageTypeV2.xl,
              url: widget._photoUrl,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [DSColorV2.secondary30, DSColorV2.secondary],
                    ),
                    borderRadius:
                        BorderRadius.circular(DSBorderRadiusV2.normal),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  // MARK: - Private
  _switchToFullscreen() {
    _overlayEntry = OverlayEntry(builder: (context) {
      return Scaffold(
        body: InkWell(
          onDoubleTap: () {
            _exitFullscreen();
          },
          child: Stack(
            children: [
              DSImage(
                type: DSImageType.fullScreen,
                url: widget._photoUrl,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          DSColorV2.secondary30,
                          DSColorV2.secondary
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
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
}
