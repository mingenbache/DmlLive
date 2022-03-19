import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/test_details_popup_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TestItemWidget extends StatefulWidget {
  const TestItemWidget({
    Key key,
    this.bookingRef,
    this.testRef,
    this.test,
  }) : super(key: key);

  final BookingsRecord bookingRef;
  final DocumentReference testRef;
  final TestsRecord test;

  @override
  _TestItemWidgetState createState() => _TestItemWidgetState();
}

class _TestItemWidgetState extends State<TestItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        child: Container(
          width: 340,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: 340,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.95, 0),
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
                              test: widget.test,
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFECECEC),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 310,
                                  height: 30,
                                  constraints: BoxConstraints(
                                    maxWidth: 310,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      widget.test.name,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Container(
                                width: 318,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Container(
                                        width: 140,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 5, 0),
                                          child: Text(
                                            widget.test.category,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 24,
                                            ),
                                            Text(
                                              'Results in ${widget.test.durationResults.toString()} Hrs',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
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
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC8C8C8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                child: Stack(
                                                  children: [
                                                    if (widget.test.homeTest ??
                                                        true)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color:
                                                              Color(0xFF586B06),
                                                          size: 16,
                                                        ),
                                                      ),
                                                    Text(
                                                      'Home',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                    if (widget.test.homeTest ??
                                                        true)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Icon(
                                                          Icons.not_interested,
                                                          color:
                                                              Color(0xFFD61B1B),
                                                          size: 16,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 5, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 2, 0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.035,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Text(
                                                        formatNumber(
                                                          widget.test.price,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: 'Ksh ',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Color(
                                                                      0xFF586B06),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 120,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          if (widget.bookingRef.testsIncluded
                                  ?.contains(widget.testRef) ??
                              true)
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.13,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: widget.bookingRef.testsIncluded
                                          ?.contains(widget.test.reference) ??
                                      true,
                                  child: InkWell(
                                    onTap: () async {
                                      if (widget.bookingRef.testsIncluded
                                          .contains(widget.testRef)) {
                                        final bookingsUpdateData = {
                                          ...createBookingsRecordData(
                                            totalPrice:
                                                functions.removeFromCart(
                                                    widget
                                                        .bookingRef.totalPrice,
                                                    widget.test.price),
                                          ),
                                          'tests_included':
                                              FieldValue.arrayRemove(
                                                  [widget.testRef]),
                                          'total_tests': FieldValue.delete(),
                                        };
                                        await widget.bookingRef.reference
                                            .update(bookingsUpdateData);
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Test Removed.${widget.bookingRef.testsIncluded.length.toString()} Tests in Total.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0x00000000),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.remove_circle_sharp,
                                      color: Color(0xFFFF0000),
                                      size: 44,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.bookingRef.testsIncluded
                                  ?.contains(widget.testRef) ??
                              true)
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.13,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: !(widget.bookingRef.testsIncluded
                                          ?.contains(widget.testRef)) ??
                                      true,
                                  child: InkWell(
                                    onTap: () async {
                                      if (!(widget.bookingRef.testsIncluded
                                          .contains(widget.testRef))) {
                                        final bookingsUpdateData = {
                                          ...createBookingsRecordData(
                                            totalPrice: functions.addCartTotal(
                                                widget.bookingRef.totalPrice,
                                                widget.test.price),
                                          ),
                                          'tests_included':
                                              FieldValue.arrayUnion(
                                                  [widget.testRef]),
                                          'total_tests':
                                              FieldValue.increment(0),
                                        };
                                        await widget.bookingRef.reference
                                            .update(bookingsUpdateData);
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Test Added.${widget.bookingRef.testsIncluded.length.toString()} Tests in Total.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0x00000000),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.add_circle_sharp,
                                      color: Color(0xFF586B06),
                                      size: 44,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
