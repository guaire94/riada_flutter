import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSTextVariationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text variations",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Display large',
                    style: context.textTheme.displayLarge,
                  ),
                  SizedBox(height: DSSpacingV2.xxxs),
                  Text(
                    'Headline large',
                    style: context.textTheme.headlineLarge,
                  ),
                  SizedBox(height: DSSpacingV2.xxxs),
                  Text(
                    'Title large',
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    'Body large',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
