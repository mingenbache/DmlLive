import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_actions_widget/chat_actions_widget_widget.dart';
import '/components/user_activity/user_activity_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllChatsPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for Chat_actions_widget component.
  late ChatActionsWidgetModel chatActionsWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatActionsWidgetModel =
        createModel(context, () => ChatActionsWidgetModel());
  }

  void dispose() {
    chatActionsWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
