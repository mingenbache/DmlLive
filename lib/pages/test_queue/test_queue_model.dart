import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestQueueModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in testQueueItem widget.
  TestedTestsRecord? newTestedtest;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    topActionsModel.dispose();
  }

  /// Additional helper methods are added here.

}
