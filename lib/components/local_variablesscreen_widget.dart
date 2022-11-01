import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LocalVariablesscreenWidget extends StatefulWidget {
  const LocalVariablesscreenWidget({
    Key? key,
    this.testedTestRef,
  }) : super(key: key);

  final DocumentReference? testedTestRef;

  @override
  _LocalVariablesscreenWidgetState createState() =>
      _LocalVariablesscreenWidgetState();
}

class _LocalVariablesscreenWidgetState extends State<LocalVariablesscreenWidget>
    with TickerProviderStateMixin {
  TextEditingController? localStateDataController;

  @override
  void initState() {
    super.initState();
    localStateDataController = TextEditingController(
        text:
            'Num Tests: ${FFAppState().numTests.toString()}num tests done: ${FFAppState().numTestDone.toString()}');
  }

  @override
  void dispose() {
    localStateDataController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TESTS INFO',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF586B06),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        InkWell(
                          onTap: () async {
                            context.pop();
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 48,
                              icon: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x4DEEEEEE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: localStateDataController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF586B06),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Flag Comments',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF586B06),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF586B06),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF586B06),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 24, 0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF586B06),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            'Tap above to complete request',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}
