import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModifyTestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for testName widget.
  TextEditingController? testNameController;
  String? Function(BuildContext, String?)? testNameControllerValidator;
  // State field(s) for test_description widget.
  TextEditingController? testDescriptionController;
  String? Function(BuildContext, String?)? testDescriptionControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for at_home_toggle widget.
  bool? atHomeToggleValue;
  // State field(s) for test_duration_text widget.
  TextEditingController? testDurationTextController;
  String? Function(BuildContext, String?)? testDurationTextControllerValidator;
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

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
    testPriceControllerValidator = _testPriceControllerValidator;
  }

  void dispose() {
    topActionsModel.dispose();
    testNameController?.dispose();
    testDescriptionController?.dispose();
    testDurationTextController?.dispose();
    resultsDurationTextController?.dispose();
    testPriceController?.dispose();
  }

  /// Additional helper methods are added here.

}
