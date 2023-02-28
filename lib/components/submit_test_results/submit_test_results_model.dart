import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubmitTestResultsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for testMachine widget.
  String? testMachineValue;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for TestResult widget.
  TextEditingController? testResultController;
  String? Function(BuildContext, String?)? testResultControllerValidator;
  String? _testResultControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TestNote widget.
  TextEditingController? testNoteController;
  String? Function(BuildContext, String?)? testNoteControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    testResultControllerValidator = _testResultControllerValidator;
  }

  void dispose() {
    testResultController?.dispose();
    testNoteController?.dispose();
  }

  /// Additional helper methods are added here.

}
