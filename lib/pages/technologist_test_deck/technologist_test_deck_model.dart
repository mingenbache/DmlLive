import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/booked_tests/booked_tests_widget.dart';
import '/components/tested_test_actions/tested_test_actions_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TechnologistTestDeckModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for bookedTests component.
  late BookedTestsModel bookedTestsModel;
  // Model for TestedTestActions component.
  late TestedTestActionsModel testedTestActionsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bookedTestsModel = createModel(context, () => BookedTestsModel());
    testedTestActionsModel =
        createModel(context, () => TestedTestActionsModel());
  }

  void dispose() {
    bookedTestsModel.dispose();
    testedTestActionsModel.dispose();
  }

  /// Additional helper methods are added here.

}
