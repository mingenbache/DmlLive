import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_actions_widget/admin_actions_widget_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/notification_list_item/notification_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsWidgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for admin_actions_widget component.
  late AdminActionsWidgetModel adminActionsWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminActionsWidgetModel =
        createModel(context, () => AdminActionsWidgetModel());
  }

  void dispose() {
    adminActionsWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
