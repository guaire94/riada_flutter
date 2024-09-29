import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';

import 'ds_border_radius.dart';
import 'ds_spacing.dart';

enum DSTextFieldType { text, number, smsCode, email, multiline }

extension DSTextFieldExtention on DSTextFieldType {
  TextInputType? get keyboardType {
    switch (this) {
      case DSTextFieldType.text:
        return null;
      case DSTextFieldType.number:
        return TextInputType.number;
      case DSTextFieldType.smsCode:
        return TextInputType.number;
      case DSTextFieldType.email:
        return TextInputType.emailAddress;
      case DSTextFieldType.multiline:
        return TextInputType.multiline;
    }
  }

  List<TextInputFormatter>? get inputFormatters {
    switch (this) {
      case DSTextFieldType.text:
        return null;
      case DSTextFieldType.number:
        return [FilteringTextInputFormatter.digitsOnly];
      case DSTextFieldType.smsCode:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ];
      case DSTextFieldType.email:
      case DSTextFieldType.multiline:
        return null;
    }
  }
}

class DSTextField extends StatelessWidget {
  final bool _obscureText;
  final String? _hintText;
  final String? _errorText;
  final String? _label;
  final int _maxLines;
  final TextEditingController? _controller;
  final StringValidationCallback? _validate;
  final DSTextFieldType _type;
  final FocusNode? _focusNode;
  final ValueChanged<String>? _onChanged;
  final bool _readOnly;
  final bool _showCursor;

  const DSTextField({
    Key? key,
    bool obscureText = false,
    DSTextFieldType type = DSTextFieldType.text,
    String? label,
    String? hintText,
    String? errorText,
    int maxLines = 1,
    TextEditingController? controller,
    FocusNode? focusNode,
    StringValidationCallback? validate,
    ValueChanged<String>? onChanged,
    bool readOnly = false,
    bool showCursor = true,
  })  : _hintText = hintText,
        _errorText = errorText,
        _label = label,
        _maxLines = maxLines,
        _obscureText = obscureText,
        _controller = controller,
        _validate = validate,
        _type = type,
        _focusNode = focusNode,
        _onChanged = onChanged,
        _readOnly = readOnly,
        _showCursor = showCursor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: context.textTheme.bodyLarge?.copyWith(
          color: DSColorV2.secondary,
        ),
        autofocus: false,
        keyboardType: _type.keyboardType,
        onChanged: _onChanged,
        inputFormatters: _type.inputFormatters,
        validator: (value) => _validate != null ? _validate(value) : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _controller,
        obscureText: _obscureText,
        maxLines: _maxLines,
        focusNode: _focusNode,
        cursorColor: DSColorV2.secondary,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
            borderSide: const BorderSide(color: DSColorV2.neutral70),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSBorderRadius.input),
            borderSide: const BorderSide(color: DSColorV2.neutral70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSBorderRadius.input),
            borderSide: const BorderSide(color: DSColorV2.neutral70),
          ),
          labelStyle: context.textTheme.bodyLarge?.copyWith(
            color: DSColorV2.secondary,
          ),
          hintText: _hintText,
          errorText: _errorText,
          labelText: _label,
          contentPadding: EdgeInsets.symmetric(
            horizontal: DSSpacing.sizeL,
            vertical: DSSpacing.sizeXs,
          ),
          alignLabelWithHint: true,
        ),
        readOnly: _readOnly,
        showCursor: _showCursor,
      ),
    );
  }
}
