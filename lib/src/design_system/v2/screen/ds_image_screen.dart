import 'package:template_flutter_app/gen/fonts.gen.dart';
import 'package:template_flutter_app/src/design_system/ds_image_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_picker_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image",
          style: TextStyle(
            fontFamily: FontFamily.rufina,
            fontSize: 36,
            color: DSColorV2.primary,
          ),
        ),
      ),
      backgroundColor: DSColorV2.neutral35,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(DSSpacingV2.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avatar',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DSImagePickerV2(
                            type: DSImageTypeV2.avatar,
                            controller: DSImagePickerController(),
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.avatar,
                            url: "https://picsum.photos/80/80",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      'XL',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    DSImagePickerV2(
                      type: DSImageTypeV2.xl,
                      controller: DSImagePickerController(),
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    DSImageV2(
                      type: DSImageTypeV2.xl,
                      url: "https://picsum.photos/340/280",
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      'Short Long',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    DSImagePickerV2(
                      type: DSImageTypeV2.shortLong,
                      controller: DSImagePickerController(),
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    DSImageV2(
                      type: DSImageTypeV2.shortLong,
                      url: "https://picsum.photos/340/136",
                    ),
                    Text(
                      'Full Long',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    DSImagePickerV2(
                      type: DSImageTypeV2.fullLong,
                      controller: DSImagePickerController(),
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    DSImageV2(
                      type: DSImageTypeV2.fullLong,
                      url: "https://picsum.photos/340/136",
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      'L',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DSImagePickerV2(
                            type: DSImageTypeV2.l,
                            controller: DSImagePickerController(),
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.l,
                            url: "https://picsum.photos/200/184",
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.l,
                            url: "https://picsum.photos/200/184",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      'M',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DSImagePickerV2(
                            type: DSImageTypeV2.m,
                            controller: DSImagePickerController(),
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.m,
                            url: "https://picsum.photos/168/152",
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.m,
                            url: "https://picsum.photos/168/152",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      'S',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: DSSpacingV2.xxxs),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DSImagePickerV2(
                            type: DSImageTypeV2.s,
                            controller: DSImagePickerController(),
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.s,
                            url: "https://picsum.photos/152/136",
                          ),
                          SizedBox(width: DSSpacingV2.s),
                          DSImageV2(
                            type: DSImageTypeV2.s,
                            url: "https://picsum.photos/152/136",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
