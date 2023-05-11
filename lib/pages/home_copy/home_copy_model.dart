import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/client_notifications_widget/client_notifications_widget_widget.dart';
import '/components/new_booking_sheet/new_booking_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for clientNotificationsWidget component.
  late ClientNotificationsWidgetModel clientNotificationsWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    clientNotificationsWidgetModel =
        createModel(context, () => ClientNotificationsWidgetModel());
  }

  void dispose() {
    clientNotificationsWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
