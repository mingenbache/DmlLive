import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmBookingSheetWidget extends StatefulWidget {
  const ConfirmBookingSheetWidget({
    Key key,
    this.bookingRef,
  }) : super(key: key);

  final DocumentReference bookingRef;

  @override
  _ConfirmBookingSheetWidgetState createState() =>
      _ConfirmBookingSheetWidgetState();
}

class _ConfirmBookingSheetWidgetState extends State<ConfirmBookingSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 340,
          ),
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
                  height: MediaQuery.of(context).size.height * 0.3,
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
                              'CONFIRM BOOKING',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Roboto',
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 48,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
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
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                color: Color(0x34FFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  'Are you sure you would like to proceed with submitting the booking?',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => FFAppState().isSubmitted = true);
                            setState(() => FFAppState().lastBookingPage = true);
                            if (FFAppState().isSubmitted) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('booking  created'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              return;
                            }

                            await Future.delayed(
                                const Duration(milliseconds: 300));
                            context.pop();
                          },
                          text: 'Yes, Continue',
                          options: FFButtonOptions(
                            width: 300,
                            height: 70,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
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
        ),
      ],
    );
  }
}
