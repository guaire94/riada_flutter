import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/design_system/v2/ds_bottom_sheet_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneNumberBottomSheetWidget extends StatelessWidget {
  // MARK: - Properties
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  static const _length = 6;
  final TextEditingController _smsCodeController = TextEditingController();
  final Function _onVerifySmsCode;

  // MARK: - Static
  static void show(BuildContext context, Function onVerifySmsCode) {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DSBottomSheetV2(
          title: context.l10N.phone_number_verification_code,
          child: VerifyPhoneNumberBottomSheetWidget(
            onVerifySmsCode: onVerifySmsCode,
          ),
        );
      },
    );
  }

  // MARK: - Life cycle
  VerifyPhoneNumberBottomSheetWidget({
    super.key,
    required Function onVerifySmsCode,
  }) : _onVerifySmsCode = onVerifySmsCode;

  @override
  Widget build(BuildContext context) {
    final _defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: context.textTheme.headlineLarge,
      decoration: BoxDecoration(
        color: DSColorV2.neutral70,
        borderRadius: BorderRadius.circular(DSBorderRadiusV2.light),
        border: Border.all(color: Colors.transparent),
      ),
    );
    final focusedPinTheme = _defaultPinTheme.copyWith(
      height: 64,
      width: 60,
      decoration: _defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: DSColorV2.neutral70),
      ),
    );

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(bottom: DSSpacingV2.s),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Pinput(
                autofocus: true,
                length: _length,
                controller: _smsCodeController,
                defaultPinTheme: _defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                showCursor: true,
                onCompleted: (code) {
                  _onVerifySmsCode(code);
                  context.router.popForced();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
