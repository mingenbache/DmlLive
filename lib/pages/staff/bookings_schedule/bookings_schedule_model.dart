import '/backend/backend.dart';
import '/components/booking_update/booking_update_widget.dart';
import '/components/booking_view_widget_copy/booking_view_widget_copy_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/components/unconfirmed_booking_widget/unconfirmed_booking_widget_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingsScheduleModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  DocumentReference? expandedBooking;

  ///  State fields for stateful widgets in this page.

  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // Models for BookingViewWidgetCopy dynamic component.
  late FlutterFlowDynamicModels<BookingViewWidgetCopyModel>
      bookingViewWidgetCopyModels1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Models for BookingViewWidgetCopy dynamic component.
  late FlutterFlowDynamicModels<BookingViewWidgetCopyModel>
      bookingViewWidgetCopyModels2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
    bookingViewWidgetCopyModels1 =
        FlutterFlowDynamicModels(() => BookingViewWidgetCopyModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    bookingViewWidgetCopyModels2 =
        FlutterFlowDynamicModels(() => BookingViewWidgetCopyModel());
  }

  void dispose() {
    topActionsModel.dispose();
    bookingViewWidgetCopyModels1.dispose();
    bookingViewWidgetCopyModels2.dispose();
  }

  /// Additional helper methods are added here.

}
