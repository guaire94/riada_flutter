import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/datePicker/ds_year_picker_controller.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../ds_spacing.dart';

class DSYearPickerTextField extends StatefulWidget {
  // MARK: Dependencies
  final bool _obscureText;
  final String? _hintText;
  final String? _errorText;
  final String? _label;
  final DSYearPickerController? _controller;
  final StringValidationCallback? _validate;
  final FocusNode? _focusNode;
  final ValueChanged<String>? _onChanged;

  // MARK: LifeCycle
  const DSYearPickerTextField({
    Key? key,
    bool obscureText = false,
    String? label,
    String? hintText,
    String? errorText,
    DSYearPickerController? controller,
    FocusNode? focusNode,
    StringValidationCallback? validate,
    ValueChanged<String>? onChanged,
  })  : _hintText = hintText,
        _errorText = errorText,
        _label = label,
        _obscureText = obscureText,
        _controller = controller,
        _validate = validate,
        _focusNode = focusNode,
        _onChanged = onChanged,
        super(key: key);

  @override
  State<DSYearPickerTextField> createState() => _DSYearPickerTextFieldState();
}

class _DSYearPickerTextFieldState extends State<DSYearPickerTextField> {
  // MARK: Constants
  final DateTime _firstDate = DateTime(1900);
  static const double _size = 300;

  // MARK: Properties
  final TextEditingController _controller = TextEditingController();

  // MARK: LifeCycle
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

          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(context.l10N.select_year),
                content: SizedBox(
                  height: _size,
                  width: _size,
                  child: YearPicker(
                    firstDate: _firstDate,
                    lastDate: DateTime.now(),
                    selectedDate: DateTime.now(),
                    onChanged: (DateTime dateTime) {
                      if (widget._controller != null) {
                        setState(() {
                          widget._controller!.date = dateTime;
                          _controller.text = widget._controller!.content;
                          context.router.popForced();
                        });
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
