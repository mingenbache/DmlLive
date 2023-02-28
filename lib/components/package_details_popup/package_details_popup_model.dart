import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/package_actions_widget/package_actions_widget_widget.dart';
import '/components/package_test_list_item/package_test_list_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PackageDetailsPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for Package_actions_widget component.
  late PackageActionsWidgetModel packageActionsWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    packageActionsWidgetModel =
        createModel(context, () => PackageActionsWidgetModel());
  }

  void dispose() {
    packageActionsWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
