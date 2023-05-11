import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dashboard_menu_widget_light/dashboard_menu_widget_light_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/notification_list_item/notification_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientNotificationsWidgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for dashboard_menu_widget_light component.
  late DashboardMenuWidgetLightModel dashboardMenuWidgetLightModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dashboardMenuWidgetLightModel =
        createModel(context, () => DashboardMenuWidgetLightModel());
  }

  void dispose() {
    dashboardMenuWidgetLightModel.dispose();
  }

  /// Additional helper methods are added here.

}
