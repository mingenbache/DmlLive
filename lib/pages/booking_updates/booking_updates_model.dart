import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/booking_actions/booking_actions_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingUpdatesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // Model for bookingActions component.
  late BookingActionsModel bookingActionsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
    bookingActionsModel = createModel(context, () => BookingActionsModel());
  }

  void dispose() {
    topActionsModel.dispose();
    bookingActionsModel.dispose();
  }

  /// Additional helper methods are added here.

}
