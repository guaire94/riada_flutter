import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/router/routes.gr.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MyProfileListItem {
  information,
  privacyPolicy,
  cgv,
}

class MyProfileListView extends StatelessWidget {
  final MyProfileListItem item;

  MyProfileListView(this.item);

  @override
  Widget build(BuildContext context) {
    String title;
    void Function()? onTap;
    switch (item) {
      case MyProfileListItem.information:
        title = context.l10N.my_profile_informations;
        onTap = () {
          context.router.push(UpdateAdditionalProfileInformationRoute());
        };
        break;
      case MyProfileListItem.privacyPolicy:
        title = context.l10N.my_profile_privacy_policy;
        onTap = () {
          final controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..loadRequest(
                Uri.parse('https://template-5c016.web.app/policy.html'));

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: DSAppBarV2(),
                body: WebViewWidget(controller: controller),
              ),
            ),
          );
        };
        break;
      case MyProfileListItem.cgv:
        title = context.l10N.my_profile_cgv;
        onTap = () {
          final controller = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..loadRequest(Uri.parse('https://template-5c016.web.app/cgv.html'));

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: DSAppBarV2(),
                body: WebViewWidget(controller: controller),
              ),
            ),
          );
        };
        break;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DSSpacingV2.xl,
          vertical: DSSpacingV2.m,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                color: DSColorV2.secondary,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: DSSpacingV2.s),
          ],
        ),
      ),
    );
  }
}
