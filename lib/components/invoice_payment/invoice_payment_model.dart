import '/backend/backend.dart';
import '/components/date_widget_small/date_widget_small_widget.dart';
import '/components/invoice_sheet/invoice_sheet_widget.dart';
import '/components/report_payments_list/report_payments_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvoicePaymentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for dateWidgetSmall component.
  late DateWidgetSmallModel dateWidgetSmallModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for ReportPaymentsList component.
  late ReportPaymentsListModel reportPaymentsListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dateWidgetSmallModel = createModel(context, () => DateWidgetSmallModel());
    reportPaymentsListModel =
        createModel(context, () => ReportPaymentsListModel());
  }

  void dispose() {
    dateWidgetSmallModel.dispose();
    reportPaymentsListModel.dispose();
  }

  /// Additional helper methods are added here.

}
