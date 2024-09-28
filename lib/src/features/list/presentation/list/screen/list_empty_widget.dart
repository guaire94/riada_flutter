import 'package:template_flutter_app/src/features/list/presentation/list/bloc/list_bloc.dart';
import 'package:flutter/material.dart';

class ListEmptyWidget extends StatefulWidget {
  // MARK: - Dependencies
  final EmptyState _state;

  // MARK: - Life cycle
  const ListEmptyWidget({
    Key? key,
    required EmptyState state,
  })  : _state = state,
        super(key: key);
  @override
  State<ListEmptyWidget> createState() => _ListEmptyWidgetState();
}

class _ListEmptyWidgetState extends State<ListEmptyWidget> {
  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [],
      ),
    );
  }
}
