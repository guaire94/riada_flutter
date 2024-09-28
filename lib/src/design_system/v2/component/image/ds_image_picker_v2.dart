import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:template_flutter_app/src/design_system/ds_image_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DSImagePickerV2 extends StatefulWidget {
  final DSImageTypeV2 _type;
  final DSImagePickerController _controller;

  DSImagePickerV2({
    Key? key,
    required DSImageTypeV2 type,
    required DSImagePickerController controller,
  })  : _type = type,
        _controller = controller;

  @override
  State<DSImagePickerV2> createState() => _DSImagePickerState();
}

class _DSImagePickerState extends State<DSImagePickerV2> {
  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<File> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _selectImage,
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: widget._type.height,
                width: widget._type.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: widget._type.borderRadius,
                  border: widget._type.border,
                ),
                child: _contentWidget(),
              ),
            ),
            if (field.hasError) ...[
              const SizedBox(height: DSSpacingV2.xxs),
              Row(
                children: [
                  const SizedBox(width: DSSpacingV2.xs),
                  Text(
                    field.errorText!,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _contentWidget() {
    switch (widget._controller.contentType) {
      case DSImagePickerContent.local:
        return Image.file(widget._controller.image!, fit: BoxFit.cover);
      case DSImagePickerContent.remote:
        return CachedNetworkImage(
          imageUrl: widget._controller.imageUrl!,
          fit: BoxFit.cover,
        );
      case DSImagePickerContent.empty:
        return Center(
          child: Icon(
            Icons.add,
            color: DSColorV2.secondary30,
            size: widget._type.iconSize,
          ),
        );
    }
  }

  Future<void> _selectImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          widget._controller.image = File(pickedFile.path);
        });
      }
    } catch (_) {
      AppSettings.openAppSettings();
    }
  }
}
