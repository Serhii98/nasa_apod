import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/theme/extensions/theme_extension.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:nasa_apod/src/ui/custom/buttons/base_button.dart';
import 'package:nasa_apod/values/dimens.dart';
import 'package:nasa_apod/src/utils/elvis.dart';

final class EmptyView extends BaseStatelessWidget {
  const EmptyView({
    this.onButtonClick,
    this.firstText,
    this.secondText,
    this.isEnabledButton,
    this.buttonText,
    this.firstTextStyle,
    this.secondTextStyle,
    this.firstTextAlign,
    this.secondTextAlign,
    super.key,
  });
  final String? firstText;
  final String? secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final TextAlign? firstTextAlign;
  final TextAlign? secondTextAlign;
  final VoidCallback? onButtonClick;
  final bool? isEnabledButton;
  final String? buttonText;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sizeM),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (firstText != null)
            Text(
              firstText.orEmpty(),
              style: firstTextStyle,
              textAlign: firstTextAlign ?? TextAlign.center,
            ),
          if (secondText != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.sizeSSM),
              child: Text(
                secondText.orEmpty(),
                textAlign: secondTextAlign ?? TextAlign.center,
                style: secondTextStyle,
              ),
            ),
          if (onButtonClick != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.sizeM),
              child: BaseButton(
                text: buttonText,
                onPressed: onButtonClick,
                activeColor: context.colors.primary,
                enabled: isEnabledButton ?? true,
              ),
            ),
        ],
      ),
    );
  }
}
