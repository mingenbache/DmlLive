import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/package_test_list/package_test_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewTestPackageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TestPackageName widget.
  TextEditingController? testPackageNameController;
  String? Function(BuildContext, String?)? testPackageNameControllerValidator;
  String? _testPackageNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for packageCategoryDropDown widget.
  String? packageCategoryDropDownValue;
  FormFieldController<String>? packageCategoryDropDownController;
  // State field(s) for package_description widget.
  TextEditingController? packageDescriptionController;
  String? Function(BuildContext, String?)?
      packageDescriptionControllerValidator;
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
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TestPackagesRecord? newTestPackId;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    testPackageNameControllerValidator = _testPackageNameControllerValidator;
    testPriceControllerValidator = _testPriceControllerValidator;
  }

  void dispose() {
    testPackageNameController?.dispose();
    packageDescriptionController?.dispose();
    testDurationTextController?.dispose();
    resultsDurationTextController?.dispose();
    testPriceController?.dispose();
  }

  /// Additional helper methods are added here.

}
