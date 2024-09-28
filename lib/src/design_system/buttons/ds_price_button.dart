import 'package:template_flutter_app/src/design_system/buttons/ds_button_elevated.dart';
import 'package:template_flutter_app/src/design_system/ds_color.dart';
import 'package:template_flutter_app/src/design_system/ds_spacing.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSPriceButton extends StatelessWidget {
  // MARK: - Constants
  static const double _height = 82;
  static const double _radius = 64;

  // MARK: - Properties
  final String _title;
  final String _subTitle;
  final String _cta;
  final bool _isLoading;
  final bool _isEnable;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const DSPriceButton({
    Key? key,
    required String title,
    required String subTitle,
    required String cta,
    required bool isLoading,
    bool isEnable = true,
    void Function()? onPressed,
  })  : _title = title,
        _subTitle = subTitle,
        _cta = cta,
        _isLoading = isLoading,
        _isEnable = isEnable,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = _isLoading == true ? null : _onPressed;

    return Padding(
      padding: const EdgeInsets.all(DSSpacing.sizeS),
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
            _radius,
          )),
          color: DSColor.primary100,
        ),
        child: Padding(
          padding: const EdgeInsets.all(DSSpacing.sizeS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _title,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: DSColor.neutral5,
                      ),
                    ),
                    SizedBox(height: DSSpacing.sizeXxs),
                    Text(
                      _subTitle,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: DSColor.neutral5,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DSButtonElevated(
                  text: _cta,
                  isLoading: _isLoading,
                  isEnable: _isEnable,
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
