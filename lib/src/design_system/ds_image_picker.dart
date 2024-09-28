import 'dart:io';

import 'package:template_flutter_app/src/design_system/ds_border_radius.dart';
import 'package:template_flutter_app/src/design_system/ds_color.dart';
import 'package:template_flutter_app/src/design_system/ds_image_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/ds_image_type.dart';
import 'package:template_flutter_app/src/design_system/ds_spacing.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DSImagePicker extends StatefulWidget {
  final DSImageType _type;
  final DSImagePickerController _controller;

  DSImagePicker({
    Key? key,
    required DSImageType type,
    required DSImagePickerController controller,
  })  : _type = type,
        _controller = controller;

  @override
  State<DSImagePicker> createState() => _DSImagePickerState();
}

class _DSImagePickerState extends State<DSImagePicker> {
  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<File> field) {
        BorderRadius? borderRadius;
        if (widget._type != DSImageType.small) {
          borderRadius = BorderRadius.circular(DSBorderRadius.input);
        }
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
                  color: DSColor.neutral10,
                  borderRadius: borderRadius,
                ),
                child: _contentWidget(),
              ),
            ),
            if (field.hasError) ...[
              const SizedBox(height: DSSpacing.sizeXxs),
              Row(
                children: [
                  const SizedBox(width: DSSpacing.sizeXs),
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
        return Image.network(
          widget._controller.imageUrl!,
          fit: BoxFit.cover,
        );
      case DSImagePickerContent.empty:
        return Center(
          child: Icon(
            Icons.add,
            color: DSColor.primary100,
            size: widget._type.iconSize,
          ),
        );
    }
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        widget._controller.image = File(pickedFile.path);
      });
    }
  }
}
