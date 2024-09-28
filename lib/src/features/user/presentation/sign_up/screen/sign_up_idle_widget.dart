import 'dart:io';

import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/ds_icon_button.dart';
import 'package:template_flutter_app/src/design_system/ds_phone_number_field.dart';
import 'package:template_flutter_app/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_elevated_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/features/user/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:template_flutter_app/src/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpIdleWidget extends StatelessWidget {
  // MARK: - Dependencies
  final IdleState _state;
  final void Function(String) _onPressVerifyPhoneNumber;
  final void Function() _onPressGoogleSignIn;
  final void Function() _onPressAppleSignIn;

  // MARK: - Properties
  final TextEditingController _phoneController = TextEditingController();

  // MARK: - Life cycle
  SignUpIdleWidget({
    Key? key,
    required IdleState state,
    required void Function(String) onPressVerifyPhoneNumber,
    required void Function() onPressGoogleSignIn,
    required void Function() onPressAppleSignIn,
  })  : _state = state,
        _onPressVerifyPhoneNumber = onPressVerifyPhoneNumber,
        _onPressGoogleSignIn = onPressGoogleSignIn,
        _onPressAppleSignIn = onPressAppleSignIn,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.profileBackground.provider(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: DSAppBarV2(),
          body: IgnorePointer(
            ignoring: _state.shouldRemoveGestures(),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(DSSpacingV2.s),
                child: Column(
                  children: [
                    Assets.images.icons.v2.signInLogo.image(),
                    Text(
                      TemplateConstants.appName,
                      style: context.textTheme.displayLarge?.copyWith(
                        color: DSColorV2.secondary,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: DSSpacingV2.l),
                      child: DSPhoneNumberField(
                        controller: _phoneController,
                        color: DSColorV2.secondary30,
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.l),
                    DSButtonElevatedV2(
                      text: context.l10N.signup_button,
                      isLoading: _state.onSubmitLoading,
                      onPressed: () {
                        if (_phoneController.text.isNotEmpty)
                          _onPressVerifyPhoneNumber(
                            _phoneController.text,
                          );
                      },
                    ),
                    SizedBox(height: DSSpacingV2.xl),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (Platform.isIOS)
                              DSIconButton(
                                type: DSIconButtonType.apple,
                                onPressed: () {
                                  _onPressAppleSignIn();
                                },
                                isLoading: _state.onAppleSignInLoading,
                              ),
                            if (Platform.isIOS) SizedBox(width: DSSpacingV2.l),
                            DSIconButton(
                              type: DSIconButtonType.google,
                              onPressed: () {
                                _onPressGoogleSignIn();
                              },
                              isLoading: _state.onGoogleSignInLoading,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: DSSpacingV2.l),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
