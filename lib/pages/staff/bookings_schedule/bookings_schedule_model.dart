import '/backend/backend.dart';
import '/components/booking_view_widget/booking_view_widget_widget.dart';
import '/components/booking_widget/booking_widget_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/components/unconfirmed_booking_widget/unconfirmed_booking_widget_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingsScheduleModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

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
