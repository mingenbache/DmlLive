import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyTestResultWidget extends StatefulWidget {
  const VerifyTestResultWidget({
    Key key,
    this.testedTestRef,
  }) : super(key: key);

  final DocumentReference testedTestRef;

  @override
  _VerifyTestResultWidgetState createState() => _VerifyTestResultWidgetState();
}

class _VerifyTestResultWidgetState extends State<VerifyTestResultWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 230,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 120),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  TextEditingController pathologistNotesController;

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    pathologistNotesController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: StreamBuilder<TestedTestsRecord>(
        stream: TestedTestsRecord.getDocument(widget.testedTestRef),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          final columnTestedTestsRecord = snapshot.data;
          return Column(
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
                  height: MediaQuery.of(context).size.height * 0.4,
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
                              'VERIFY TEST',
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
                            child: TextFormField(
                              controller: pathologistNotesController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF586B06),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Pathologist Notes',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 40, 24, 0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF586B06),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 6,
                            ).animated([
                              animationsMap['textFieldOnPageLoadAnimation']
                            ]),
                          ),
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
                    StreamBuilder<List<BookedTestsRecord>>(
                      stream: queryBookedTestsRecord(
                        queryBuilder: (bookedTestsRecord) => bookedTestsRecord
                            .where('booking_ref',
                                isEqualTo: columnTestedTestsRecord.bookingRef)
                            .where('has_result', isEqualTo: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitRipple(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<BookedTestsRecord> containerBookedTestsRecordList =
                            snapshot.data;
                        return Container(
                          decoration: BoxDecoration(),
                          child: StreamBuilder<BookingsRecord>(
                            stream: BookingsRecord.getDocument(
                                columnTestedTestsRecord.bookingRef),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final rowBookingsRecord = snapshot.data;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<TestedTestsRecord>>(
                                    stream: queryTestedTestsRecord(
                                      queryBuilder: (testedTestsRecord) =>
                                          testedTestsRecord
                                              .where('booking_ref',
                                                  isEqualTo: rowBookingsRecord
                                                      .reference)
                                              .where('is_verified',
                                                  isEqualTo: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<TestedTestsRecord>
                                          buttonTestedTestsRecordList =
                                          snapshot.data;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          final testedTestsUpdateData =
                                              createTestedTestsRecordData(
                                            isVerified: true,
                                            pathologistRef:
                                                currentUserReference,
                                            verifiedDate: getCurrentTimestamp,
                                            pathologistNote:
                                                pathologistNotesController.text,
                                          );
                                          await widget.testedTestRef
                                              .update(testedTestsUpdateData);
                                          if (rowBookingsRecord.verifiedTests
                                              .toList()
                                              .contains(widget.testedTestRef)) {
                                            final bookingsUpdateData = {
                                              'verifiedTests':
                                                  FieldValue.arrayUnion([
                                                columnTestedTestsRecord
                                                    .reference
                                              ]),
                                            };
                                            await rowBookingsRecord.reference
                                                .update(bookingsUpdateData);
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Test Already Verified!'),
                                                  content: Text(
                                                      'You cannot verify a test twice.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          context.pop();
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Test Verified'),
                                                content: Text(
                                                    'The test report can now be shared with the client.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        text: 'Verify Test',
                                        options: FFButtonOptions(
                                          width: 300,
                                          height: 70,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                          elevation: 2,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 25,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
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
          );
        },
      ),
    );
  }
}
