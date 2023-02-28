import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportListModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TopActions component.
  late TopActionsModel topActionsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
  }

  void dispose() {
    topActionsModel.dispose();
  }

  /// Additional helper methods are added here.

}
