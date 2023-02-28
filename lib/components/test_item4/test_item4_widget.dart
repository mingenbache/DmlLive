import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/test_details_popup/test_details_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_item4_model.dart';
export 'test_item4_model.dart';

class TestItem4Widget extends StatefulWidget {
  const TestItem4Widget({
    Key? key,
    this.test,
    this.index,
    this.booking,
    this.listSize,
  }) : super(key: key);

  final DocumentReference? test;
  final int? index;
  final BookingsRecord? booking;
  final int? listSize;

  @override
  _TestItem4WidgetState createState() => _TestItem4WidgetState();
}

class _TestItem4WidgetState extends State<TestItem4Widget>
    with TickerProviderStateMixin {
  late TestItem4Model _model;

  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-69.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(63.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-58.0, 0.0),
          end: Offset(0.0, 0.0),
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
    _model = createModel(context, () => TestItem4Model());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      child: StreamBuilder<TestsRecord>(
        stream: TestsRecord.getDocument(widget.test!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50.0,
                ),
              ),
            );
          }
          final stackTestsRecord = snapshot.data!;
          return Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            if (widget.booking!.testsIncluded!
                                .toList()
                                .contains(widget.test))
                              InkWell(
                                onTap: () async {
                                  if (widget.booking!.testsIncluded!
                                      .toList()
                                      .contains(widget.test)) {
                                    final bookingsUpdateData = {
                                      ...createBookingsRecordData(
                                        totalPrice: functions.removeFromCart(
                                            widget.booking!.totalPrice,
                                            stackTestsRecord.price),
                                      ),
                                      'tests_included':
                                          FieldValue.arrayRemove([widget.test]),
                                      'total_tests': FieldValue.increment(-1),
                                    };
                                    await widget.booking!.reference
                                        .update(bookingsUpdateData);
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Test Removed.${widget.booking!.testsIncluded!.toList().length.toString()} Tests in Total.',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xA7FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.highlight_off_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation1']!,
                                  hasBeenTriggered: hasContainerTriggered1),
                            if (!widget.booking!.testsIncluded!
                                .toList()
                                .contains(widget.test))
                              InkWell(
                                onTap: () async {
                                  if (!widget.booking!.testsIncluded!
                                      .toList()
                                      .contains(widget.test)) {
                                    final bookingsUpdateData = {
                                      ...createBookingsRecordData(
                                        totalPrice: functions.addCartTotal(
                                            widget.booking!.totalPrice,
                                            stackTestsRecord.price),
                                      ),
                                      'tests_included':
                                          FieldValue.arrayUnion([widget.test]),
                                      'total_tests': FieldValue.increment(1),
                                    };
                                    await widget.booking!.reference
                                        .update(bookingsUpdateData);
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Test Added.${widget.booking!.testsIncluded!.toList().length.toString()} Tests in Total.',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(16.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation2']!,
                                  hasBeenTriggered: hasContainerTriggered2),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['stackOnPageLoadAnimation']!),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 130.0,
                          constraints: BoxConstraints(
                            maxWidth: 380.0,
                            maxHeight: 130.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/l2q14_2.jpg',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TestDetailsPopupWidget(
                                      test: stackTestsRecord,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: 130.0,
                                constraints: BoxConstraints(
                                  maxWidth: 380.0,
                                  maxHeight: 130.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xA3FFFFFF),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          height: 40.0,
                                          constraints: BoxConstraints(
                                            maxWidth: 380.0,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  -1.0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions
                                                        .camelCase(
                                                            stackTestsRecord
                                                                .name)
                                                        .maybeHandleOverflow(
                                                            maxChars: 25),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 1.0,
                                          child: Container(
                                            width: 170.0,
                                            height: 2.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 8.0, 5.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            constraints: BoxConstraints(
                                              maxWidth: 380.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      12.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9.0,
                                                                        4.0,
                                                                        6.0,
                                                                        4.0),
                                                            child: Text(
                                                              stackTestsRecord
                                                                  .category!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                12.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.timer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 20.0,
                                                        ),
                                                        Text(
                                                          '${stackTestsRecord.durationResults?.toString()} Hrs',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto Mono',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 8.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            height: 30.0,
                                            constraints: BoxConstraints(
                                              maxWidth: 380.0,
                                              maxHeight: 30.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .delivery_dining,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 20.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3.0,
                                                                        2.0,
                                                                        3.0,
                                                                        2.0),
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              child: Stack(
                                                                children: [
                                                                  if (stackTestsRecord
                                                                          .homeTest ??
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_circle_outline,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  if (stackTestsRecord
                                                                          .homeTest ??
                                                                      true)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .not_interested,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  formatNumber(
                                                                    stackTestsRecord
                                                                        .price!,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .periodDecimal,
                                                                    currency:
                                                                        'Ksh ',
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        17.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 7.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.listSize! > 1)
                          Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                shape: BoxShape.circle,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    functions
                                        .add1(widget.index)!
                                        .toString()
                                        .maybeHandleOverflow(maxChars: 2),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 16.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
