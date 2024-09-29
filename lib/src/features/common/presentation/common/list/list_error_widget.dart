import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class ListErrorWidget extends StatefulWidget {
  @override
  State<ListErrorWidget> createState() => _ListErrorWidgetState();
}

class _ListErrorWidgetState extends State<ListErrorWidget> {
  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Text(
              context.l10N.common_error_message,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
