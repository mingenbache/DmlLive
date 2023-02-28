import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for test_description widget.
  TextEditingController? testDescriptionController;
  String? Function(BuildContext, String?)? testDescriptionControllerValidator;
  // State field(s) for at_home_toggle widget.
  bool? atHomeToggleValue;
  // State field(s) for test_duration_slider widget.
  double? testDurationSliderValue;
  // State field(s) for results_duration_text widget.
  TextEditingController? resultsDurationTextController;
  String? Function(BuildContext, String?)?
      resultsDurationTextControllerValidator;
  // State field(s) for duration_results_slider widget.
  double? durationResultsSliderValue;
  // State field(s) for Test_price widget.
  TextEditingController? testPriceController;
  String? Function(BuildContext, String?)? testPriceControllerValidator;
  String? _testPriceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'incorrect price entered';
    }

    if (val.length < 2) {
      return 'incorrect price entered';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    testPriceControllerValidator = _testPriceControllerValidator;
  }

  void dispose() {
    textController1?.dispose();
    testDescriptionController?.dispose();
    resultsDurationTextController?.dispose();
    testPriceController?.dispose();
  }

  /// Additional helper methods are added here.

}
