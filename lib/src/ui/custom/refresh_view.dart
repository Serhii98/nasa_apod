import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/errors/error_type.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:nasa_apod/src/core/theme/extensions/theme_extension.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateless_widget.dart';
import 'package:nasa_apod/src/ui/custom/adaptation/desktop_adaptation.dart';
import 'package:nasa_apod/src/ui/custom/buttons/base_button.dart';
import 'package:nasa_apod/values/dimens.dart';

final class RefreshView extends BaseStatelessWidget {
  const RefreshView({
    required this.onClick,
    required this.parsedError,
    super.key,
    this.showAnimation = false,
  });

  final VoidCallback? onClick;
  final ParsedError? parsedError;
  final bool showAnimation;

  Widget _getImage(final BuildContext context) {
    if (parsedError?.errorType == ErrorType.network) {
      return const Icon(
        Icons.network_check_outlined,
        size: AppSizes.sizeXXL,
      );
    }
    if (parsedError?.errorType == ErrorType.pageNotFound || showAnimation) {
      // TODO: add rive animation here
      return const Icon(
        Icons.running_with_errors_outlined,
        size: AppSizes.sizeXXL,
      );
    }
    return Icon(
      Icons.error_outline,
      color: context.colors.primary,
      size: AppSizes.sizeXXL,
    );
  }

  String _getButtonText(final BuildContext context) {
    if (parsedError?.errorType == ErrorType.pageNotFound) {
      return context.tr().backToMain;
    }
    return context.tr().retry;
  }

  @override
  Widget build(final BuildContext context) {
    final String message =
        parsedError?.displayMessage ?? AppStrings.emptyString;
    return Padding(
      padding: AppPaddings.allPaddingM,
      child: AppDesktopAdaptation(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getImage(context),
            if (message.isNotEmpty) const Gap(AppSizes.sizeXL),
            if (message.isNotEmpty)
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
            if (onClick != null) const Gap(AppSizes.sizeL),
            if (onClick != null)
              BaseButton(
                text: _getButtonText(context),
                activeColor: context.colors.primary,
                onPressed: onClick,
              ),
          ],
        ),
      ),
    );
  }
}
