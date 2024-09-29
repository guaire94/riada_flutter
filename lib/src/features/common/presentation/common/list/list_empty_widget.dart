import 'package:flutter/material.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class ListEmptyWidget extends StatefulWidget {
  // MARK: - Life cycle
  @override
  State<ListEmptyWidget> createState() => _ListEmptyWidgetState();
}

class _ListEmptyWidgetState extends State<ListEmptyWidget> {
  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Text(
              context.l10N.common_empty_message,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
