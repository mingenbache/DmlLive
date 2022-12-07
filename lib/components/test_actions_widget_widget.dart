import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
          begin: 1,
          end: 1,
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
          begin: 1,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthUserStreamWidget(
          child: StreamBuilder<BookingsRecord>(
            stream: BookingsRecord.getDocument(
                currentUserDocument!.currentBooking!),
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
              final containerBookingsRecord = snapshot.data!;
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                constraints: BoxConstraints(
                  maxWidth: 330,
                  maxHeight: 80,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 22),
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
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: Color(0x00B3B2B2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation1']!,
                              hasBeenTriggered: hasButtonTriggered1);
                        },
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (!containerBookingsRecord.testsIncluded!
                              .toList()
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
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0x00B3B2B2),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w500,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(30),
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
