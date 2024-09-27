import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/messaging/message_type.dart';
import 'package:nasa_apod/src/core/theme/extensions/theme_extension.dart';
import 'package:nasa_apod/src/ui/utils/screen_utils.dart';
import 'package:toastification/toastification.dart';

final class InAppNotificationManager {
  factory InAppNotificationManager() {
    _instance ??= InAppNotificationManager._internal();
    return _instance!;
  }

  InAppNotificationManager._internal();

  static InAppNotificationManager? _instance;

  ToastificationType _getType(final MessageType messageType) {
    if (messageType == MessageType.error) {
      return ToastificationType.error;
    }
    if (messageType == MessageType.success) {
      return ToastificationType.success;
    }
    if (messageType == MessageType.warning) {
      return ToastificationType.warning;
    }
    return ToastificationType.info;
  }

  int _getTimeToDisplay(final String message) {
    return max(
      1500,
      ((message.split(AppStrings.emptyStringSpace).length / 3).round() + 1) *
          1000,
    );
  }

  void _prepareAndShow(
    final BuildContext context,
    final String message,
    final MessageType messageType,
    final int millisToDisplay,
  ) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      title: Text(message),
      autoCloseDuration: Duration(milliseconds: millisToDisplay),
      alignment: isDesktopSize(context)
          ? Alignment.bottomRight
          : Alignment.bottomCenter,
      type: _getType(messageType),
      showProgressBar: false,
      primaryColor: context.colors.primary,
      backgroundColor: context.colors.background,
      foregroundColor: context.colors.onBackground,
      style: ToastificationStyle.flatColored,
    );
  }

  /// Shows message with calculated duration
  /// Will cancel previous messages
  /// Will skip if message is null or empty
  Future<void> showMessage(
    final BuildContext context,
    final String? message, {
    final MessageType messageType = MessageType.error,
  }) async {
    if (message == null || message.trim().isEmpty) {
      return;
    }
    final int millisToDisplay = _getTimeToDisplay(message);
    _prepareAndShow(context, message, messageType, millisToDisplay);
  }
}
