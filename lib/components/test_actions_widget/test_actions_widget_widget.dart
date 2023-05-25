import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_actions_widget_model.dart';
export 'test_actions_widget_model.dart';

class TestActionsWidgetWidget extends StatefulWidget {
  const TestActionsWidgetWidget({
    Key? key,
    this.test,
    this.bookingRef,
  }) : super(key: key);

  final TestsRecord? test;
  final DocumentReference? bookingRef;

  @override
  _TestActionsWidgetWidgetState createState() =>
      _TestActionsWidgetWidgetState();
}

class _TestActionsWidgetWidgetState extends State<TestActionsWidgetWidget>
    with TickerProviderStateMixin {
  late TestActionsWidgetModel _model;

  var hasButtonTriggered1 = false;
  var hasButtonTriggered2 = false;
  final animationsMap = {
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestActionsWidgetModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthUserStreamWidget(
          builder: (context) => StreamBuilder<BookingsRecord>(
            stream: BookingsRecord.getDocument(
                currentUserDocument!.currentBooking!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final containerBookingsRecord = snapshot.data!;
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                constraints: BoxConstraints(
                  maxWidth: 330.0,
                  maxHeight: 80.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(22.0, 22.0, 22.0, 22.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder<List<UsersRecord>>(
                        future: queryUsersRecordOnce(
                          queryBuilder: (usersRecord) =>
                              usersRecord.where('role', isEqualTo: 'front'),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> buttonUsersRecordList =
                              snapshot.data!;
                          final buttonUsersRecord =
                              buttonUsersRecordList.isNotEmpty
                                  ? buttonUsersRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'Chat',
                                queryParams: {
                                  'chatUser': serializeParam(
                                    buttonUsersRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatUser': buttonUsersRecord,
                                },
                              );
                            },
                            text: 'Chat',
                            icon: FaIcon(
                              FontAwesomeIcons.comment,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x00B3B2B2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation1']!,
                              hasBeenTriggered: hasButtonTriggered1);
                        },
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (!containerBookingsRecord.testsIncluded
                              .contains(widget.test!.reference)) {
                            final bookingsUpdateData = {
                              ...createBookingsRecordData(
                                totalPrice: functions.addCartTotal(
                                    containerBookingsRecord.totalPrice,
                                    widget.test!.price),
                              ),
                              'tests_included': FieldValue.arrayUnion(
                                  [widget.test!.reference]),
                              'total_tests': FieldValue.increment(1),
                            };
                            await containerBookingsRecord.reference
                                .update(bookingsUpdateData);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Test Added.',
                                  style: TextStyle(),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x00000000),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Error. This test is already in your Booking.',
                                  style: TextStyle(),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x00000000),
                              ),
                            );
                            return;
                          }
                        },
                        text: 'Add to Cart',
                        icon: FaIcon(
                          FontAwesomeIcons.shoppingBasket,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x00B3B2B2),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ).animateOnActionTrigger(
                          animationsMap['buttonOnActionTriggerAnimation2']!,
                          hasBeenTriggered: hasButtonTriggered2),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
