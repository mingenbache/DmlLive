import '/backend/backend.dart';
import '/components/view_test_result/view_test_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booked_tests_model.dart';
export 'booked_tests_model.dart';

class BookedTestsWidget extends StatefulWidget {
  const BookedTestsWidget({
    Key? key,
    this.bookingRef,
  }) : super(key: key);

  final DocumentReference? bookingRef;

  @override
  _BookedTestsWidgetState createState() => _BookedTestsWidgetState();
}

class _BookedTestsWidgetState extends State<BookedTestsWidget> {
  late BookedTestsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookedTestsModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: StreamBuilder<List<BookedTestsRecord>>(
        stream: queryBookedTestsRecord(
          queryBuilder: (bookedTestsRecord) => bookedTestsRecord
              .where('booking_ref', isEqualTo: widget.bookingRef),
        ),
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
          List<BookedTestsRecord>
              bookedTestsReportContainerBookedTestsRecordList = snapshot.data!;
          return Container(
            constraints: BoxConstraints(
              maxHeight: 170.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Builder(
                builder: (context) {
                  final bookingTests =
                      bookedTestsReportContainerBookedTestsRecordList.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: bookingTests.length,
                    itemBuilder: (context, bookingTestsIndex) {
                      final bookingTestsItem = bookingTests[bookingTestsIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: StreamBuilder<List<TestedTestsRecord>>(
                          stream: queryTestedTestsRecord(
                            queryBuilder: (testedTestsRecord) =>
                                testedTestsRecord
                                    .where('booking_ref',
                                        isEqualTo: widget.bookingRef)
                                    .where('test_ref',
                                        isEqualTo: bookingTestsItem.testRef),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<TestedTestsRecord>
                                containerTestedTestsRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerTestedTestsRecord =
                                containerTestedTestsRecordList.isNotEmpty
                                    ? containerTestedTestsRecordList.first
                                    : null;
                            return InkWell(
                              onTap: () async {
                                if (bookingTestsItem.sampleCollected!) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: ViewTestResultWidget(
                                          testedTestRef:
                                              containerTestedTestsRecord!
                                                  .reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  return;
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 30.0,
                                constraints: BoxConstraints(
                                  maxWidth: 300.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: StreamBuilder<BookedTestsRecord>(
                                    stream: BookedTestsRecord.getDocument(
                                        bookingTestsItem.reference),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final rowBookedTestsRecord =
                                          snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          StreamBuilder<TestsRecord>(
                                            stream: TestsRecord.getDocument(
                                                bookingTestsItem.testRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final textTestsRecord =
                                                  snapshot.data!;
                                              return Text(
                                                functions.upperCase(
                                                    textTestsRecord.name),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              );
                                            },
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Container(
                                                  height: 35.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 1.0,
                                                        color:
                                                            Color(0x31000000),
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .clock,
                                                                    color: Color(
                                                                        0x32FFFFFF),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .clock,
                                                                    color: Color(
                                                                        0xFFF3F3F3),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .handHoldingMedical,
                                                                    color: Color(
                                                                        0x34FFFFFF),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (bookingTestsItem
                                                                      .sampleCollected ??
                                                                  true)
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .handHoldingMedical,
                                                                      color: Color(
                                                                          0xFFF3F3F3),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .flask,
                                                                    color: Color(
                                                                        0x33FFFFFF),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (functions
                                                                  .testedTestSubmitted(
                                                                      containerTestedTestsRecord))
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .flask,
                                                                      color: Color(
                                                                          0xFFF3F3F3),
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .check_circle_outlined,
                                                                    color: Color(
                                                                        0x34FFFFFF),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (functions
                                                                  .testedTestVerified(
                                                                      containerTestedTestsRecord))
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_circle_outlined,
                                                                      color: Color(
                                                                          0xFFF3F3F3),
                                                                      size:
                                                                          20.0,
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
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
