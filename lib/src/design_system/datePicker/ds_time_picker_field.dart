import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:riada/src/design_system/datePicker/ds_time_picker_controller.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class DSTimePickerTextField extends StatefulWidget {
  // MARK: Dependencies
  final bool _obscureText;
  final String? _hintText;
  final String? _errorText;
  final String? _label;
  final DSTimePickerController? _controller;
  final StringValidationCallback? _validate;
  final FocusNode? _focusNode;
  final ValueChanged<String>? _onChanged;
  final bool _enabled;

  // MARK: LifeCycle
  const DSTimePickerTextField({
    Key? key,
    bool obscureText = false,
    String? label,
    String? hintText,
    String? errorText,
    DSTimePickerController? controller,
    FocusNode? focusNode,
    StringValidationCallback? validate,
    ValueChanged<String>? onChanged,
    bool enabled = true,
  })  : _hintText = hintText,
        _errorText = errorText,
        _label = label,
        _obscureText = obscureText,
        _controller = controller,
        _validate = validate,
        _focusNode = focusNode,
        _onChanged = onChanged,
        _enabled = enabled,
        super(key: key);

  @override
  State<DSTimePickerTextField> createState() => _DSTimePickerTextFieldState();
}

class _DSTimePickerTextFieldState extends State<DSTimePickerTextField> {
  // MARK: Properties
  final TextEditingController _controller = TextEditingController();

  // MARK: LifeCycle
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
        color: DSColorV2.accent,
      ),
      padding: EdgeInsets.symmetric(
        vertical: DSSpacingV2.xxxs,
        horizontal: DSSpacingV2.s,
      ),
      child: TextFormField(
        enabled: widget._enabled,
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
          hintText: widget._hintText,
          errorText: widget._errorText,
          labelText: widget._label,
          labelStyle: context.textTheme.bodyLarge?.copyWith(
            color: DSColorV2.secondary,
          ),
        ),
        cursorColor: DSColorV2.secondary,
        onTap: () async {
          FocusScope.of(context).requestFocus(new FocusNode());

          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: widget._controller?.time ?? TimeOfDay.now(),
            initialEntryMode: TimePickerEntryMode.inputOnly,
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: DSColorV2.secondary,
                    onSurface: DSColorV2.secondary,
                  ),
                ),
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!,
                ),
              );
            },
          );

          if (time != null && widget._controller != null) {
            setState(() {
              widget._controller!.time = time;
              _controller.text = widget._controller!.content;
            });
          }
        },
      ),
    );
  }
}
