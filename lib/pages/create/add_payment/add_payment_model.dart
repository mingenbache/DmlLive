import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPaymentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an amount';
    }

    return null;
  }

  // State field(s) for first_name widget.
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for last_name widget.
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for transactionReference widget.
  TextEditingController? transactionReferenceController;
  String? Function(BuildContext, String?)?
      transactionReferenceControllerValidator;
  // State field(s) for paymentMethod widget.
  String? paymentMethodValue;
  // State field(s) for paymentNotes widget.
  TextEditingController? paymentNotesController;
  String? Function(BuildContext, String?)? paymentNotesControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? paymentRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  void dispose() {
    textController1?.dispose();
    firstNameController?.dispose();
    lastNameController?.dispose();
    transactionReferenceController?.dispose();
    paymentNotesController?.dispose();
  }

  /// Additional helper methods are added here.

}
