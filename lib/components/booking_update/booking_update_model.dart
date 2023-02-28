import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/booked_tests/booked_tests_widget.dart';
import '/components/booking_actions/booking_actions_widget.dart';
import '/components/invoice_sheet/invoice_sheet_widget.dart';
import '/components/report_payments_list/report_payments_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingUpdateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for bookedTests component.
  late BookedTestsModel bookedTestsModel;
  // Model for ReportPaymentsList component.
  late ReportPaymentsListModel reportPaymentsListModel;
  // Model for bookingActions component.
  late BookingActionsModel bookingActionsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bookedTestsModel = createModel(context, () => BookedTestsModel());
    reportPaymentsListModel =
        createModel(context, () => ReportPaymentsListModel());
    bookingActionsModel = createModel(context, () => BookingActionsModel());
  }

  void dispose() {
    bookedTestsModel.dispose();
    reportPaymentsListModel.dispose();
    bookingActionsModel.dispose();
  }

  /// Additional helper methods are added here.

}
