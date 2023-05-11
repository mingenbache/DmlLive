import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/choose_technologist/choose_technologist_widget.dart';
import '/components/view_special_test_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmTestsCopyModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int testPackTestsConfirmed = 0;

  int testsConfirmed = 0;

  int specialTestsConfirmed = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for labReference widget.
  TextEditingController? labReferenceController;
  String? Function(BuildContext, String?)? labReferenceControllerValidator;
  // State field(s) for pathologist widget.
  String? pathologistValue;
  FormFieldController<String>? pathologistValueController;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Stores action output result for [Backend Call - Create Document] action in ConfirmTestCard widget.
  BookedTestsRecord? newBookedTestRecord;
  // State field(s) for Checkbox widget.

  Map<DocumentReference, bool> checkboxValueMap1 = {};
  List<DocumentReference> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  BookedTestsRecord? newBookedTestRecord4;
  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  BookedTestsRecord? newBookedTestRecord3;
  // Stores action output result for [Backend Call - Create Document] action in IconUnchecked widget.
  BookedTestsRecord? newBookedTestRecord2;
  // Stores action output result for [Backend Call - Create Document] action in TestPackItem widget.
  BookedTestsRecord? newBookedTestRef;
  // Stores action output result for [Custom Action - getTestDocument] action in TestPackItem widget.
  TestsRecord? testDocument;
  // State field(s) for Checkbox widget.

  Map<DocumentReference, bool> checkboxValueMap2 = {};
  List<DocumentReference> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  BookedTestsRecord? newBookedTestRefCopy;
  // Stores action output result for [Custom Action - getTestDocument] action in Checkbox widget.
  TestsRecord? testDocumentCopy;
  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  BookedTestsRecord? newBookedTestRefCopy2;
  // Stores action output result for [Custom Action - getTestDocument] action in Checkbox widget.
  TestsRecord? testDocumentCopy2;
  // Stores action output result for [Backend Call - Create Document] action in SpecialTestsCard widget.
  SpecialTestsRecord? newSpecialTest;
  // State field(s) for Checkbox widget.

  Map<SpecialTestTypeStruct, bool> checkboxValueMap3 = {};
  List<SpecialTestTypeStruct> get checkboxCheckedItems3 =>
      checkboxValueMap3.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  SpecialTestsRecord? newSpecialTestCopy;
  // Stores action output result for [Backend Call - Create Document] action in Checkbox widget.
  SpecialTestsRecord? newSpecialTestCopy2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    labReferenceController?.dispose();
  }

  /// Additional helper methods are added here.

}
