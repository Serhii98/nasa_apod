import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/ui/states/base_controlled_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/utils/elvis.dart';

abstract class BaseStatefulScreen<BSW extends BaseStatefulWidget,
        BS extends BaseBlocState, BB extends BaseBloc<BaseBlocEvent, BS>>
    extends BaseControlledState<BSW, BS, BB> {
  late final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _getMain(final BuildContext context, final BS state) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: buildDrawer(context, state),
      appBar: buildAppbar(context, state),
      body: buildBody(context, state),
      bottomNavigationBar: buildBottomMenu(context, state),
      floatingActionButton: buildFab(context, state),
      resizeToAvoidBottomInset: true,
      backgroundColor: getBackgroundColor(),
    );
  }

  @override
  Widget onBuild(final BuildContext context, final BS state) {
    return DecoratedBox(
      decoration: getBackgroundDecoration(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: getStatusBarColor(),
          statusBarBrightness: getStatusBarIconBrightness() == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: getStatusBarIconBrightness(),
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: getStatusBarIconBrightness(),
        ),
        child: () {
          if (useSafeArea().not()) {
            return _getMain(context, state);
          }
          return SafeArea(
            child: _getMain(context, state),
          );
        }(),
      ),
    );
  }

  @protected
  Color getStatusBarColor() {
    return Colors.transparent;
  }

  @protected
  Color getBackgroundColor() {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  /// should be overridden in extended widget if needs
  PreferredSizeWidget? buildAppbar(final BuildContext context, final BS state) {
    return null;
  }

  Widget? buildDrawer(final BuildContext context, final BS state) {
    return null;
  }

  /// should be overridden in extended widget
  Widget buildBody(final BuildContext context, final BS state);

  // Should be overridden if user needs to display fab
  Widget? buildFab(final BuildContext context, final BS state) {
    return null;
  }

  // Should be overridden if user needs to display bottom menu
  Widget? buildBottomMenu(final BuildContext context, final BS state) {
    return null;
  }

  bool useSafeArea() => true;

  Decoration getBackgroundDecoration() =>
      BoxDecoration(color: getBackgroundColor());

  /// Method below is used to change status bar icons brightness
  Brightness getStatusBarIconBrightness() {
    return Brightness.dark;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: <SystemUiOverlay>[SystemUiOverlay.top],
    );
  }
}
