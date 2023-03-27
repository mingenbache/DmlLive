import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_doctor_form/add_doctor_form_widget.dart';
import '/components/add_special_test_booking/add_special_test_booking_widget.dart';
import '/components/confirm_tests_copy/confirm_tests_copy_widget.dart';
import '/components/package_details_popup/package_details_popup_widget.dart';
import '/components/special_test_list_item/special_test_list_item_widget.dart';
import '/components/test_list_booking_sheet/test_list_booking_sheet_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BookingConfirmationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TopActions component.
  late TopActionsModel topActionsModel;
  // State field(s) for labRefNum widget.
  TextEditingController? labRefNumController;
  String? Function(BuildContext, String?)? labRefNumControllerValidator;
  String? _labRefNumControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Invalid lab reference number';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for refDoctor widget.
  String? refDoctorValue;
  FormFieldController<String>? refDoctorController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topActionsModel = createModel(context, () => TopActionsModel());
    labRefNumControllerValidator = _labRefNumControllerValidator;
  }

  void dispose() {
    topActionsModel.dispose();
    labRefNumController?.dispose();
  }

  /// Additional helper methods are added here.

}
