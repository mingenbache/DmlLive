import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/package_details_popup_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingPackageItemWidget extends StatefulWidget {
  const BookingPackageItemWidget({
    Key? key,
    this.package,
    this.index,
    this.listSize,
    this.booking,
  }) : super(key: key);

  final TestPackagesRecord? package;
  final int? index;
  final int? listSize;
  final BookingsRecord? booking;

  @override
  _BookingPackageItemWidgetState createState() =>
      _BookingPackageItemWidgetState();
}

class _BookingPackageItemWidgetState extends State<BookingPackageItemWidget>
    with TickerProviderStateMixin {
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 280.ms,
          duration: 1300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 280.ms,
          duration: 1300.ms,
          begin: Offset(-92, 0),
          end: Offset(0, 0),
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
          begin: Offset(63, 0),
          end: Offset(0, 0),
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
          duration: 950.ms,
          begin: Offset(-58, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -73),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-96, 0),
          end: Offset(0, 0),
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
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 100,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          if (widget.booking!.testPackages!
                              .toList()
                              .contains(widget.package!.reference))
                            InkWell(
                              onTap: () async {
                                if (widget.booking!.testPackages!
                                    .toList()
                                    .contains(widget.package!.reference)) {
                                  final bookingsUpdateData = {
                                    ...createBookingsRecordData(
                                      totalPrice: functions.removeFromCart(
                                          widget.booking!.totalPrice,
                                          widget.package!.price),
                                    ),
                                    'testPackages': FieldValue.arrayRemove(
                                        [widget.package!.reference]),
                                    'testPackTests':
                                        functions.removeBookingPackageTests(
                                            widget.package!.testsIncluded!
                                                .toList(),
                                            widget.booking!.testPackTests!
                                                .toList()),
                                  };
                                  await widget.booking!.reference
                                      .update(bookingsUpdateData);
                                } else {
                                  return;
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Test Removed.',
                                      style: TextStyle(),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC9FFFF),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(16),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Icon(
                                            Icons.highlight_off_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation1']!,
                                hasBeenTriggered: hasContainerTriggered1),
                          if (!widget.booking!.testPackages!
                              .toList()
                              .contains(widget.package!.reference))
                            InkWell(
                              onTap: () async {
                                if (widget.booking!.hasTestPackages!) {
                                  if (!widget.booking!.testPackages!
                                      .toList()
                                      .contains(widget.package!.reference)) {
                                    final bookingsUpdateData = {
                                      ...createBookingsRecordData(
                                        totalPrice: functions.addCartTotal(
                                            widget.booking!.totalPrice,
                                            widget.package!.price),
                                        hasTestPackages: true,
                                      ),
                                      'testPackages': FieldValue.arrayUnion(
                                          [widget.package!.reference]),
                                      'testPackTests':
                                          functions.addBookingPackageTests(
                                              widget.booking!.testPackTests!
                                                  .toList(),
                                              widget.package!.testsIncluded!
                                                  .toList()),
                                    };
                                    await widget.booking!.reference
                                        .update(bookingsUpdateData);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Tests Added.',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    return;
                                  } else {
                                    return;
                                  }
                                } else {
                                  final bookingsUpdateData = {
                                    ...createBookingsRecordData(
                                      totalPrice: functions.addCartTotal(
                                          widget.booking!.totalPrice,
                                          widget.package!.price),
                                      hasTestPackages: true,
                                    ),
                                    'testPackages': FieldValue.arrayUnion(
                                        [widget.package!.reference]),
                                    'testPackTests':
                                        functions.addBookingPackageTests(
                                            widget.booking!.testPackTests!
                                                .toList(),
                                            widget.package!.testsIncluded!
                                                .toList()),
                                  };
                                  await widget.booking!.reference
                                      .update(bookingsUpdateData);
                                  return;
                                }
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(16),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
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
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                constraints: BoxConstraints(
                  maxWidth: 370,
                ),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: PackageDetailsPopupWidget(
                                          package: widget.package,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  height: 100,
                                  constraints: BoxConstraints(
                                    maxWidth: 370,
                                    maxHeight: 130,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: AutoSizeText(
                                                  functions
                                                      .add1(widget.index)!
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                          maxChars: 2),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Text(
                                                    functions
                                                        .camelCase(widget
                                                            .package!
                                                            .packageName)
                                                        .maybeHandleOverflow(
                                                            maxChars: 25),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 11,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: 70,
                                    constraints: BoxConstraints(
                                      maxWidth: 320,
                                      maxHeight: 130,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xA3FFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
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
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.75,
                                                  height: 30,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 320,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xC9FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                      topLeft:
                                                          Radius.circular(12),
                                                      topRight:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            9,
                                                                            4,
                                                                            6,
                                                                            4),
                                                                    child: Text(
                                                                      widget
                                                                          .package!
                                                                          .category!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        4,
                                                                        12,
                                                                        4),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Icon(
                                                                  Icons.timer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20,
                                                                ),
                                                                Text(
                                                                  '${widget.package!.durationResults?.toString()} Hrs',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto Mono',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 1,
                                                child: Container(
                                                  width: 170,
                                                  height: 2,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.75,
                                                  height: 30,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 380,
                                                    maxHeight: 30,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .delivery_dining,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3,
                                                                          2,
                                                                          3,
                                                                          2),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if (widget.package!.atHome ??
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1, 0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.check_circle_outline,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 16,
                                                                            ),
                                                                          ),
                                                                        if (widget.package!.atHome ??
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1, 0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.not_interested,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 16,
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
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2,
                                                                        0,
                                                                        2,
                                                                        0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        formatNumber(
                                                                          widget
                                                                              .package!
                                                                              .price!,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                          currency:
                                                                              'Ksh ',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              17,
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
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
