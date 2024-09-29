import 'package:riada/src/design_system/ds_color.dart';
import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class MyPostButton extends StatelessWidget {
  // MARK: - Constants
  static final double _iconSize = 15;

  // MARK: - Properties
  final IconData _icon;
  final String _text;
  final Color _tintColor;
  final Function() _onTap;

  // MARK: - Life cycle
  const MyPostButton({
    Key? key,
    required IconData icon,
    required String text,
    Color tintColor = DSColor.primary100,
    required Function() onTap,
  })  : _icon = icon,
        _text = text,
        _tintColor = tintColor,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: _onTap,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Icon(
                _icon,
                size: _iconSize,
                color: _tintColor,
              ),
              SizedBox(width: DSSpacing.sizeXxxs),
              Text(
                _text,
                style: context.textTheme.bodySmall?.copyWith(color: _tintColor),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
