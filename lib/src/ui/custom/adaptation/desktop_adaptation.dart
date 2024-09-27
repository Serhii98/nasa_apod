import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:nasa_apod/values/dimens.dart';

final class AppDesktopAdaptation extends BaseStatelessWidget {
  const AppDesktopAdaptation({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.size512),
          child: child,
        ),
      );
}
