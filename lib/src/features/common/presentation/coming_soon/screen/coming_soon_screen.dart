import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ComingSoonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DSAppBarV2(
        title: context.l10N.coming_soon_title,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            child: Text(
              context.l10N.coming_soon_message,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
