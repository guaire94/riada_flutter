import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class DSPhoneNumberField extends StatefulWidget {
  /// MARK: Dependencies
  final TextEditingController _controller;
  final Color _color;

  /// MARK: LifeCycle
  DSPhoneNumberField({
    Key? key,
    required TextEditingController controller,
    required Color color,
  })  : _controller = controller,
        _color = color,
        super(key: key);

  @override
  State<DSPhoneNumberField> createState() => _DSPhoneNumberFieldState();
}

class _DSPhoneNumberFieldState extends State<DSPhoneNumberField> {
  /// MARK: Constants
  final _config = SelectorConfig(
    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
    showFlags: true,
    useEmoji: true,
    leadingPadding: DSSpacingV2.xxxs,
  );

  final double _height = 50;

  /// MARK: Properties
  String _countryCode = "AE";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacingV2.s,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: widget._color),
        borderRadius: BorderRadius.circular(
          DSBorderRadiusV2.input,
        ),
      ),
      child: InternationalPhoneNumberInput(
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: widget._color,
        spaceBetweenSelectorAndTextField: 0,
        inputBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(DSBorderRadiusV2.input),
          ),
        ),
        hintText: context.l10N.signup_phone_number,
        hintStyle: context.textTheme.bodyLarge?.copyWith(
          color: widget._color,
        ),
        textStyle: context.textTheme.bodyLarge?.copyWith(
          color: DSColorV2.secondary,
        ),
        selectorTextStyle: context.textTheme.bodyLarge?.copyWith(
          color: DSColorV2.secondary,
        ),
        initialValue: PhoneNumber(
          isoCode: _countryCode,
        ),
        selectorConfig: _config,
        autoValidateMode: AutovalidateMode.disabled,
        countrySelectorScrollControlled: true,
        onInputChanged: (PhoneNumber value) {
          _countryCode = value.isoCode ?? _countryCode;
          if (value.phoneNumber != null) {
            widget._controller.text = value.phoneNumber!;
          }
        },
        ignoreBlank: true,
      ),
    );
  }
}
