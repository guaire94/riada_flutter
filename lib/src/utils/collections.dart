extension CollectionsExtension<E> on List<E> {
  E? firstOrNull() {
    return isEmpty ? null : first;
  }

  E? lastOrNull() {
    return isEmpty ? null : last;
  }

  E? firstWhereOrNull(bool Function(E) test) {
    try {
      return firstWhere(test);
    } catch (_) {
      return null;
    }
  }
}
