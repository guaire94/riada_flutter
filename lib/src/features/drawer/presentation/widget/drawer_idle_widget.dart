import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/features/drawer/presentation/widget/drawer_button.dart';
import 'package:template_flutter_app/src/features/drawer/presentation/widget/drawer_profile_widget.dart';
import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/router/routes.gr.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DrawerIdleWidget extends StatelessWidget {
  // MARK: - Properties
  final User? _user;
  final void Function() _onLogout;

  // MARK: - Life cycle
  const DrawerIdleWidget({
    Key? key,
    required User? user,
    required void Function() onLogout,
  })  : _user = user,
        _onLogout = onLogout,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DSSpacingV2.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: <Widget>[
                DrawerProfileWidget(user: _user),
                SizedBox(height: DSSpacingV2.l),
                CustomDrawerButton(
                  onPressed: () {
                    context.router.navigate(MarketplaceRoute());
                    _closeEndDrawer(context: context);
                  },
                  image: Assets.images.icons.v2.home,
                  text: context.l10N.drawer_home,
                ),
                SizedBox(height: DSSpacingV2.l),
                CustomDrawerButton(
                  onPressed: () {
                    context.router.navigate(ListRoute());
                    _closeEndDrawer(context: context);
                  },
                  image: Assets.images.icons.v2.horse,
                  text: context.l10N.drawer_list,
                ),
              ],
            ),
            Column(
              children: [
                CustomDrawerButton(
                  onPressed: () {
                    if (_user == null) {
                      context.router.push(SignUpRoute());
                    } else {
                      context.router.push(MyProfileRoute());
                    }
                    _closeEndDrawer(context: context);
                  },
                  image: Assets.images.icons.v2.setting,
                  text: _user == null
                      ? context.l10N.login_title
                      : context.l10N.drawer_profile,
                ),
                SizedBox(height: DSSpacingV2.l),
                if (_user != null)
                  GestureDetector(
                    onTap: _onLogout,
                    child: Center(
                      child: Text(
                        context.l10N.logout,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: DSColorV2.danger,
                        ),
                      ),
                    ),
                  ),
                if (_user != null) SizedBox(height: DSSpacingV2.l),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // MARK: - Privates
  void _closeEndDrawer({
    required BuildContext context,
  }) {
    context.router.popForced();
  }
}