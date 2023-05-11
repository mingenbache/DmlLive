import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/payment_actions_widget/payment_actions_widget_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for Payment_actions_widget component.
  late PaymentActionsWidgetModel paymentActionsWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    paymentActionsWidgetModel =
        createModel(context, () => PaymentActionsWidgetModel());
  }

  void dispose() {
    paymentActionsWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
