import 'package:flutter/material.dart';
import 'package:nasa_apod/src/utils/elvis.dart';
import 'package:nasa_apod/values/dimens.dart';

final class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.text,
    this.child,
    this.enabled,
    this.onPressed,
    this.disableColor,
    this.activeColor,
    this.valueTextStyle,
    this.disabledValueTextStyle,
    this.buttonPadding,
    this.suffixIcon,
    this.boxShadow,
    this.containerColor,
    this.isRemoveBoxShadow = false,
    this.width,
  });

  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool? enabled;
  final Color? disableColor;
  final Color? activeColor;
  final TextStyle? valueTextStyle;
  final TextStyle? disabledValueTextStyle;
  final EdgeInsets? buttonPadding;
  final Widget? suffixIcon;
  final BoxShadow? boxShadow;
  final Color? containerColor;
  final bool isRemoveBoxShadow;

  final double? width;

  Text _getText(final BuildContext context) {
    return Text(
      text.orEmpty(),
      maxLines: 1,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
      style: enabled.orTrue() ? valueTextStyle : disabledValueTextStyle,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: buttonPadding ?? EdgeInsets.zero,
      width: width,
      decoration: BoxDecoration(
        color: containerColor,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            enabled.orTrue() ? activeColor : disableColor,
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: enabled.orTrue() ? onPressed : null,
        child: Padding(
          padding: suffixIcon != null
              ? AppPaddings.allPaddingSSM
              : AppPaddings.allPaddingM,
          child: () {
            if (child != null) {
              return child;
            }
            if (suffixIcon != null) {
              return Row(
                children: <Widget>[
                  Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: suffixIcon.orEmpty(),
                  ),
                  Expanded(child: _getText(context)),
                  suffixIcon.orEmpty(),
                ],
              );
            }
            return _getText(context);
          }(),
        ),
      ),
    );
  }
}
