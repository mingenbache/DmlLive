import '/backend/backend.dart';
import '/components/test_item_widget/test_item_widget_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScheduledTestsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Models for TestItemWidget dynamic component.
  late FlutterFlowDynamicModels<TestItemWidgetModel> testItemWidgetModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    testItemWidgetModels =
        FlutterFlowDynamicModels(() => TestItemWidgetModel());
  }

  void dispose() {
    topActionsModel.dispose();
    testItemWidgetModels.dispose();
  }

  /// Additional helper methods are added here.

}
