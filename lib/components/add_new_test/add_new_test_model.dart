import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewTestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for testCategory widget.
  String? testCategoryValue;
  // State field(s) for at_home_toggle widget.
  bool? atHomeToggleValue;
  // State field(s) for test_description widget.
  TextEditingController? testDescriptionController;
  String? Function(BuildContext, String?)? testDescriptionControllerValidator;
  // State field(s) for test_duration_slider widget.
  double? testDurationSliderValue;
  // State field(s) for results_duration_slider widget.
  double? resultsDurationSliderValue;
  // State field(s) for Test_price widget.
  TextEditingController? testPriceController;
  String? Function(BuildContext, String?)? testPriceControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TestsRecord? newTestId;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    testDescriptionController?.dispose();
    testPriceController?.dispose();
  }

  /// Additional helper methods are added here.

}
