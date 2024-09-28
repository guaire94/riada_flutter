import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/gen/fonts.gen.dart';
import 'package:template_flutter_app/src/design_system/ds_icon_button.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_elevated_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_outline_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_section_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_text_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Button",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Elevated',
                          style: context.textTheme.bodyLarge,
                        ),
                        SizedBox(height: DSSpacingV2.m),
                        DSButtonElevatedV2(
                          onPressed: () => {},
                          text: 'Default',
                        ),
                        SizedBox(height: DSSpacingV2.xxs),
                        DSButtonElevatedV2(
                          onPressed: () => {},
                          text: 'Disable',
                          isEnable: false,
                        ),
                        SizedBox(height: DSSpacingV2.xxs),
                        DSButtonElevatedV2(
                          onPressed: () => {},
                          text: '',
                          isLoading: true,
                        ),
                        SizedBox(height: DSSpacingV2.xxs),
                        Text(
                          'Outlined',
                          style: context.textTheme.bodyLarge,
                        ),
                        SizedBox(height: DSSpacingV2.xxs),
                        DSButtonOutlineV2(
                          onPressed: () => {},
                          text: 'Outline',
                        ),
                        SizedBox(height: DSSpacingV2.xxs),
                        DSButtonOutlineV2(
                          onPressed: () => {},
                          text: '',
                          isLoading: true,
                        ),
                        SizedBox(height: DSSpacingV2.s),
                        Text(
                          'DSButtonSectionType',
                          style: context.textTheme.headlineLarge,
                        ),
                        Text(
                          'medium',
                          style: context.textTheme.bodyLarge,
                        ),
                        SizedBox(height: DSSpacingV2.m),
                        DSButtonSectionV2(
                          onPressed: () => {},
                          type: DSButtonSectionType.medium,
                          image: Assets.images.icons.v2.add,
                          text: 'Vous avez un cheval à vendre ?',
                        ),
                        SizedBox(height: DSSpacingV2.m),
                        Text(
                          'Small',
                          style: context.textTheme.bodyLarge,
                        ),
                        SizedBox(height: DSSpacingV2.m),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              DSButtonSectionV2(
                                onPressed: () => {},
                                type: DSButtonSectionType.small,
                                image: Assets.images.icons.v2.home,
                                text: 'Marketplace',
                              ),
                              SizedBox(height: DSSpacingV2.xs),
                              DSButtonSectionV2(
                                onPressed: () => {},
                                type: DSButtonSectionType.small,
                                image: Assets.images.icons.v2.horse,
                                text: 'Horses',
                              ),
                              SizedBox(height: DSSpacingV2.xs),
                              DSButtonSectionV2(
                                onPressed: () => {},
                                type: DSButtonSectionType.small,
                                image: Assets.images.icons.v2.service,
                                text: 'Services',
                              ),
                              SizedBox(height: DSSpacingV2.xs),
                              DSButtonSectionV2(
                                onPressed: () => {},
                                type: DSButtonSectionType.small,
                                image: Assets.images.icons.v2.event,
                                text: 'Events',
                              ),
                              SizedBox(height: DSSpacingV2.xs),
                              DSButtonSectionV2(
                                onPressed: () => {},
                                type: DSButtonSectionType.small,
                                image: Assets.images.icons.v2.secondHand,
                                text: 'Second hand',
                              ),
                              SizedBox(height: DSSpacingV2.xs),
                              DSButtonSectionV2(
                                onPressed: () => {},
                                type: DSButtonSectionType.small,
                                image: Assets.images.icons.v2.setting,
                                text: 'Setting',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DSButtonTextV2(
                              onPressed: () => {},
                              text: 'Voir tout',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.all(DSSpacingV2.s),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Button Icon',
                            style: context.textTheme.displayLarge,
                          ),
                          SizedBox(height: DSSpacingV2.m),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DSIconButton(
                                type: DSIconButtonType.apple,
                                onPressed: () => {},
                              ),
                              DSIconButton(
                                type: DSIconButtonType.google,
                                onPressed: () => {},
                              ),
                            ],
                          )
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
