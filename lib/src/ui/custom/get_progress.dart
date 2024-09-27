import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/theme/extensions/theme_extension.dart';
import 'package:nasa_apod/src/core/ui/states/base_view_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';

final class GetProgress extends BaseStatefulWidget {
  const GetProgress({
    this.isStackProgress = false,
    this.progressHeight,
    this.progressWidth,
    this.stackBackgroundColor,
    super.key,
  });

  final bool isStackProgress;
  final double? progressWidth;
  final double? progressHeight;
  final Color? stackBackgroundColor;

  @override
  State<GetProgress> createState() => _GetProgressState();
}

final class _GetProgressState extends BaseViewState<GetProgress> {
  @override
  Widget build(final BuildContext context) {
    if (widget.isStackProgress) {
      return Container(
        height: widget.progressHeight,
        width: widget.progressWidth,
        color: widget.stackBackgroundColor ??
            context.colors.grey1.withOpacity(0.3),
        child: _buildProgress(),
      );
    }
    return _buildProgress();
  }

  Widget _buildProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
