import 'package:form_validator/form_validator.dart';

extension ValidationBuilderExtension on ValidationBuilder {
  ValidationBuilder differentFrom(List<String> items, String message) =>
      add((v) => items.contains(v?.toUpperCase()) ? message : null);
}
