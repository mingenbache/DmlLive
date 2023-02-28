import '/components/edit_user_details/edit_user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for editUserDetails component.
  late EditUserDetailsModel editUserDetailsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editUserDetailsModel = createModel(context, () => EditUserDetailsModel());
  }

  void dispose() {
    editUserDetailsModel.dispose();
  }

  /// Additional helper methods are added here.

}
