import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/ui/states/base_view_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';

final class CoreChild extends BaseStatefulWidget {
  const CoreChild(this.child, {super.key});
  final Widget child;

  @override
  State<StatefulWidget> createState() => _CoreChildState();
}

final class _CoreChildState extends BaseViewState<CoreChild> {
  @override
  Widget build(final BuildContext context) => widget.child;
}
