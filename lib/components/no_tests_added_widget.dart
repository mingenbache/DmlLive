import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoTestsAddedWidget extends StatefulWidget {
  const NoTestsAddedWidget({Key? key}) : super(key: key);

  @override
  _NoTestsAddedWidgetState createState() => _NoTestsAddedWidgetState();
}

class _NoTestsAddedWidgetState extends State<NoTestsAddedWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.playlist_add,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 50,
        ),
      ],
    );
  }
}
