import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/date_widget_small/date_widget_small_widget.dart';
import '/components/invoice_payment/invoice_payment_widget.dart';
import '/components/report_widget_booked_test_widget.dart';
import '/components/reportwizardspecial_test_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportWizardModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<BookedTestsRecord> bookedTestDocs = [];
  void addToBookedTestDocs(BookedTestsRecord item) => bookedTestDocs.add(item);
  void removeFromBookedTestDocs(BookedTestsRecord item) =>
      bookedTestDocs.remove(item);
  void removeAtIndexFromBookedTestDocs(int index) =>
      bookedTestDocs.removeAt(index);

  List<SpecialTestsRecord> specialTests = [];
  void addToSpecialTests(SpecialTestsRecord item) => specialTests.add(item);
  void removeFromSpecialTests(SpecialTestsRecord item) =>
      specialTests.remove(item);
  void removeAtIndexFromSpecialTests(int index) => specialTests.removeAt(index);

  String pathologistNotes = ' ';

  List<DocumentReference> bookedTestRefs = [];
  void addToBookedTestRefs(DocumentReference item) => bookedTestRefs.add(item);
  void removeFromBookedTestRefs(DocumentReference item) =>
      bookedTestRefs.remove(item);
  void removeAtIndexFromBookedTestRefs(int index) =>
      bookedTestRefs.removeAt(index);

  List<DocumentReference> specialTestRefs = [];
  void addToSpecialTestRefs(DocumentReference item) =>
      specialTestRefs.add(item);
  void removeFromSpecialTestRefs(DocumentReference item) =>
      specialTestRefs.remove(item);
  void removeAtIndexFromSpecialTestRefs(int index) =>
      specialTestRefs.removeAt(index);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for dateWidgetSmall component.
  late DateWidgetSmallModel dateWidgetSmallModel;
  // Models for reportWidgetBookedTest dynamic component.
  late FlutterFlowDynamicModels<ReportWidgetBookedTestModel>
      reportWidgetBookedTestModels;
  // State field(s) for CheckboxListTile widget.

  Map<DocumentReference, bool> checkboxListTileValueMap1 = {};
  List<DocumentReference> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.

  Map<DocumentReference, bool> checkboxListTileValueMap2 = {};
  List<DocumentReference> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for patientRecipientCheckbox widget.
  bool? patientRecipientCheckboxValue;
  // State field(s) for regUserRecipientCheckbox widget.
  bool? regUserRecipientCheckboxValue;
  // State field(s) for doctorRecipientCheckboxListTile widget.
  bool? doctorRecipientCheckboxListTileValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReportsRecord? reportRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dateWidgetSmallModel = createModel(context, () => DateWidgetSmallModel());
    reportWidgetBookedTestModels =
        FlutterFlowDynamicModels(() => ReportWidgetBookedTestModel());
  }

  void dispose() {
    dateWidgetSmallModel.dispose();
    reportWidgetBookedTestModels.dispose();
  }

  /// Additional helper methods are added here.

}
