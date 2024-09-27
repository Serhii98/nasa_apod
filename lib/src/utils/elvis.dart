import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';

extension BoolExtensions on bool? {
  bool orFalse() => this ?? false;

  bool orTrue() => this ?? true;
}

extension BoolNExtensions on bool {
  bool not() => !this;
}

extension IntExtensions on int? {
  int orZero() => this ?? 0;

  int orImpossible() => this ?? -1;
}

extension DoubleExtensions on double? {
  double orZero() => this ?? 0.0;
}

extension NumExtensions on num? {
  num orZero() => this ?? 0.0;
}

extension StringExtensions on String? {
  String orEmpty() => this ?? AppStrings.emptyString;

  String? emptyToNull() {
    if (this == null || this!.isEmpty) {
      return null;
    }
    return this;
  }
}

extension ListExtensions<T> on List<T>? {
  List<T> orEmpty() => this ?? <T>[];
}

extension WidgetsExtensions on Widget? {
  Widget orEmpty() => this ?? const SizedBox.shrink();
}

extension IListExtensions<T> on IList<T>? {
  IList<T> orEmpty() => this ?? IList();
}
