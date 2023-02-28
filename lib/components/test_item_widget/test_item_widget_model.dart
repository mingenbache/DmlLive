import '/backend/backend.dart';
import '/components/begin_test/begin_test_widget.dart';
import '/components/date_widget_vertical/date_widget_vertical_widget.dart';
import '/components/view_test_result/view_test_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestItemWidgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for dateWidgetVertical component.
  late DateWidgetVerticalModel dateWidgetVerticalModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dateWidgetVerticalModel =
        createModel(context, () => DateWidgetVerticalModel());
  }

  void dispose() {
    dateWidgetVerticalModel.dispose();
  }

  /// Additional helper methods are added here.

}
