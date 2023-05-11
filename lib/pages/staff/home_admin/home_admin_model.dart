import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/all_chats_popup/all_chats_popup_widget.dart';
import '/components/notifications_widget/notifications_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeAdminModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for NotificationsWidget component.
  late NotificationsWidgetModel notificationsWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notificationsWidgetModel =
        createModel(context, () => NotificationsWidgetModel());
  }

  void dispose() {
    notificationsWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
