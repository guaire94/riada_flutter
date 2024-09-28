import 'package:template_flutter_app/gen/fonts.gen.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:flutter/material.dart';

class DSColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Color",
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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.neutral70,
                        child: Text(
                          'Neutral 70',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: DSSpacingV2.xxxs),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.neutral35,
                        child: Text(
                          'Neutral 35',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: DSSpacingV2.xxxs),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.neutral10,
                        child: Text(
                          'Neutral 10',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DSSpacingV2.xxxs),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: DSColorV2.primary,
                    child: Text(
                      'Primary',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: DSSpacingV2.xxxs),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.secondary,
                        child: Text(
                          'Secondary',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: DSSpacingV2.xxxs),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.secondary30,
                        child: Text(
                          'Secondary 30',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DSSpacingV2.xxxs),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.success,
                        child: Text(
                          'Success',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: DSSpacingV2.xxxs),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.danger,
                        child: Text(
                          'Danger',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: DSSpacingV2.xxxs),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColorV2.alert,
                        child: Text(
                          'Alert',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
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
