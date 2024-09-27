import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/errors/display_mode.dart';
import 'package:nasa_apod/src/core/errors/error_type.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:nasa_apod/src/core/ui/states/base_stateless_screen.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/routing/router.gr.dart';
import 'package:nasa_apod/src/ui/custom/adaptation/desktop_adaptation.dart';
import 'package:nasa_apod/src/ui/custom/refresh_view.dart';

final class PageNotFound extends BaseStatelessScreen {
  PageNotFound({super.key});

  @override
  Widget buildBody(final BuildContext context) {
    return AppDesktopAdaptation(
      child: RefreshView(
        onClick: () {
          AppRouter().popAllAndPush(const SplashScreen());
        },
        parsedError: ParsedError(
            displayMessage: context.tr().unableToOpen,
            errorType: ErrorType.pageNotFound,
            displayMode: DisplayMode.onlyRefresh),
      ),
    );
  }
}
