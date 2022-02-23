import '../components/edit_user_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUserWidget extends StatefulWidget {
  const EditUserWidget({Key key}) : super(key: key);

  @override
  _EditUserWidgetState createState() => _EditUserWidgetState();
}

class _EditUserWidgetState extends State<EditUserWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: EditUserDetailsWidget(),
      ),
    );
  }
}
