import 'package:template_flutter_app/src/design_system/datePicker/ds_date_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../ds_spacing.dart';

class DSDatePickerTextField extends StatefulWidget {
  final bool _obscureText;
  final String? _hintText;
  final String? _errorText;
  final String? _label;
  final DSDatePickerController? _controller;
  final StringValidationCallback? _validate;
  final FocusNode? _focusNode;
  final ValueChanged<String>? _onChanged;
  final DateTime _initialDate;
  final DateTime _firstDate;
  final DateTime _lastDate;

  const DSDatePickerTextField({
    Key? key,
    bool obscureText = false,
    String? label,
    String? hintText,
    String? errorText,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DSDatePickerController? controller,
    FocusNode? focusNode,
    StringValidationCallback? validate,
    ValueChanged<String>? onChanged,
  })  : _hintText = hintText,
        _errorText = errorText,
        _label = label,
        _initialDate = initialDate,
        _firstDate = firstDate,
        _lastDate = lastDate,
        _obscureText = obscureText,
        _controller = controller,
        _validate = validate,
        _focusNode = focusNode,
        _onChanged = onChanged,
        super(key: key);

  @override
  State<DSDatePickerTextField> createState() => _DSDatePickerTextFieldState();
}

class _DSDatePickerTextFieldState extends State<DSDatePickerTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: context.textTheme.bodyLarge?.copyWith(
          color: DSColorV2.secondary,
        ),
        onChanged: widget._onChanged,
        validator: (value) =>
            widget._validate != null ? widget._validate!(value) : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _controller,
        obscureText: widget._obscureText,
        focusNode: widget._focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
            borderSide: const BorderSide(color: DSColorV2.neutral70),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
            borderSide: const BorderSide(color: DSColorV2.neutral70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
            borderSide: const BorderSide(color: DSColorV2.neutral70),
          ),
          hintText: widget._hintText,
          errorText: widget._errorText,
          labelText: widget._label,
          contentPadding: EdgeInsets.symmetric(
            horizontal: DSSpacing.sizeL,
            vertical: DSSpacing.sizeXs,
          ),
          labelStyle: context.textTheme.bodyLarge?.copyWith(
            color: DSColorV2.secondary,
          ),
        ),
        cursorColor: DSColorV2.secondary,
        onTap: () async {
          FocusScope.of(context).requestFocus(new FocusNode());

          DateTime? date = await showDatePicker(
            context: context,
            initialDate: widget._initialDate,
            firstDate: widget._firstDate,
            lastDate: widget._lastDate,
          );
          if (date != null && widget._controller != null) {
            setState(() {
              widget._controller!.date = date;
              _controller.text = widget._controller!.content;
            });
          }
        },
      ),
    );
  }
}
