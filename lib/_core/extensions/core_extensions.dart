import 'dart:convert';

// String extensions
extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool isValidEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }
}

extension NullableStringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

// Map extensions
extension MapExtensions<K, V> on Map<K, V> {
  V? getOrDefault(K key, V defaultValue) {
    return containsKey(key) ? this[key] : defaultValue;
  }

  Map<K, V> merge(Map<K, V> other) {
    return {...this, ...other};
  }

  String toJsonString() {
    return jsonEncode(this);
  }
}

// List extensions
extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  List<T> sortedBy(Comparable Function(T) keyExtractor) {
    return [...this]
      ..sort((a, b) => keyExtractor(a).compareTo(keyExtractor(b)));
  }

  List<R> mapIndexed<R>(R Function(int index, T item) convert) {
    return asMap()
        .entries
        .map((entry) => convert(entry.key, entry.value))
        .toList();
  }
}
