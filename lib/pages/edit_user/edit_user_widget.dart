import '/components/edit_user_details/edit_user_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_user_model.dart';
export 'edit_user_model.dart';

class EditUserWidget extends StatefulWidget {
  const EditUserWidget({Key? key}) : super(key: key);

  @override
  _EditUserWidgetState createState() => _EditUserWidgetState();
}

class _EditUserWidgetState extends State<EditUserWidget> {
  late EditUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'editUser',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: wrapWithModel(
                model: _model.editUserDetailsModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: EditUserDetailsWidget(),
              ),
            ),
          ),
        ));
  }
}
