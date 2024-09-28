import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  // MARK: - Constants
  static final double borderRadius = 20;
  static final double blurRadius = 4;

  // MARK: - Life cycle
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        child: Assets.images.icons.backButton.svg(),
        onTap: () {
          context.router.popForced();
        },
      ),
    );
  }
}
