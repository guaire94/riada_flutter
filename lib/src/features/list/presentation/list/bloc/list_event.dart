part of 'list_bloc.dart';

abstract class ListEvent {}

class LoadEvent extends ListEvent {}

class RefreshEvent extends ListEvent {}
