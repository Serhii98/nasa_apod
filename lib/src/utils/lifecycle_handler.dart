import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {

  LifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
  });
  final AsyncCallback? resumeCallBack;
  final AsyncCallback? suspendingCallBack;

  @override
  Future<void> didChangeAppLifecycleState(final AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumeCallBack?.call();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        await suspendingCallBack?.call();
        break;
    }
  }
}
