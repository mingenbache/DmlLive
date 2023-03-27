import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class NewBookingSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for isPatient widget.
  bool? isPatientValue;
  // State field(s) for doctorNames widget.
  TextEditingController? doctorNamesController;
  String? Function(BuildContext, String?)? doctorNamesControllerValidator;
  // State field(s) for docemailAddress widget.
  TextEditingController? docemailAddressController;
  String? Function(BuildContext, String?)? docemailAddressControllerValidator;
  // State field(s) for docphoneNumber widget.
  TextEditingController? docphoneNumberController;
  String? Function(BuildContext, String?)? docphoneNumberControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BookingsRecord? newbookingRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    doctorNamesController?.dispose();
    docemailAddressController?.dispose();
    docphoneNumberController?.dispose();
  }

  /// Additional helper methods are added here.

}
