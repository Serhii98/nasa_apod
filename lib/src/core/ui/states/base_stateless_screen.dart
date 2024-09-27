import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateless_widget.dart';

abstract class BaseStatelessScreen extends BaseStatelessWidget {
  BaseStatelessScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppbar(context),
      body: SafeArea(child: buildBody(context)),
      bottomNavigationBar: buildBottomMenu(),
      floatingActionButton: buildFab(),
      resizeToAvoidBottomInset: true,
    );
  }

  /// should be overridden in extended widget if needs
  PreferredSizeWidget? buildAppbar(final BuildContext context) {
    return null;
  }

  /// should be overridden in extended widget
  Widget buildBody(final BuildContext context);

  // Should be overridden if user needs to display fab
  Widget? buildFab() {
    return null;
  }

  // Should be overridden if user needs to display bottom menu
  Widget? buildBottomMenu() {
    return null;
  }
}
