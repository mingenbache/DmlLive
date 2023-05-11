import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewInvoiceSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for InvoiceAmount widget.
  TextEditingController? invoiceAmountController;
  String? Function(BuildContext, String?)? invoiceAmountControllerValidator;
  String? _invoiceAmountControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvoicesRecord? newInvoice;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    invoiceAmountControllerValidator = _invoiceAmountControllerValidator;
  }

  void dispose() {
    invoiceAmountController?.dispose();
  }

  /// Additional helper methods are added here.

}
