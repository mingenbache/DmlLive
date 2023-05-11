import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/choose_technologist/choose_technologist_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmTestsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for labReference widget.
  TextEditingController? labReferenceController;
  String? Function(BuildContext, String?)? labReferenceControllerValidator;
  // State field(s) for pathologist widget.
  String? pathologistValue;
  FormFieldController<String>? pathologistValueController;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  BookedTestsRecord? newBookedTest;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  BookedTestsRecord? newTestPackBookedTest;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SpecialTestsRecord? newSpecialTest;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    labReferenceController?.dispose();
  }

  /// Additional helper methods are added here.

}
