import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_catalog_test_act/admin_catalog_test_act_widget.dart';
import '/components/catalog_package_item/catalog_package_item_widget.dart';
import '/components/catalog_test_item/catalog_test_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestListCatalogModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for CatalogTestActions.
  late AdminCatalogTestActModel catalogTestActionsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    catalogTestActionsModel =
        createModel(context, () => AdminCatalogTestActModel());
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    catalogTestActionsModel.dispose();
  }

  /// Additional helper methods are added here.

}
