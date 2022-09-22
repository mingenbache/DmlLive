import '../backend/backend.dart';
import '../components/begin_test_widget.dart';
import '../components/booking_update_widget.dart';
import '../components/date_widget_small_widget.dart';
import '../components/view_test_result_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingViewWidgetWidget extends StatefulWidget {
  const BookingViewWidgetWidget({
    Key? key,
    this.bookingRef,
    this.index,
  }) : super(key: key);

  final BookingsRecord? bookingRef;
  final int? index;

  @override
  _BookingViewWidgetWidgetState createState() =>
      _BookingViewWidgetWidgetState();
}

class _BookingViewWidgetWidgetState extends State<BookingViewWidgetWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-95, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: InkWell(
        onTap: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: BookingUpdateWidget(
                  bookingRef: widget.bookingRef,
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        child: Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 205,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 2),
                                            child: Text(
                                              functions
                                                  .add1(widget.index)
                                                  .toString()
                                                  .maybeHandleOverflow(
                                                      maxChars: 2),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.58,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 6, 0, 0),
                                          child: Text(
                                            '${widget.bookingRef!.firstname}   ${widget.bookingRef!.lastname}',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ).animated([
                                        animationsMap[
                                            'containerOnPageLoadAnimation']!
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                            child: DateWidgetSmallWidget(
                              date: widget.bookingRef!.scheduledDate,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                      child: Builder(
                        builder: (context) {
                          final bookedTests =
                              widget.bookingRef!.bookedTests!.toList();
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(bookedTests.length,
                                  (bookedTestsIndex) {
                                final bookedTestsItem =
                                    bookedTests[bookedTestsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: StreamBuilder<List<TestedTestsRecord>>(
                                    stream: queryTestedTestsRecord(
                                      queryBuilder: (testedTestsRecord) =>
                                          testedTestsRecord
                                              .where('booking_ref',
                                                  isEqualTo: widget
                                                      .bookingRef!.reference)
                                              .where('test_ref',
                                                  isEqualTo: bookedTestsItem),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<TestedTestsRecord>
                                          testItemContainerTestedTestsRecordList =
                                          snapshot.data!;
                                      final testItemContainerTestedTestsRecord =
                                          testItemContainerTestedTestsRecordList
                                                  .isNotEmpty
                                              ? testItemContainerTestedTestsRecordList
                                                  .first
                                              : null;
                                      return InkWell(
                                        onTap: () async {
                                          if (testItemContainerTestedTestsRecord !=
                                              null) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: ViewTestResultWidget(
                                                    testedTestRef:
                                                        testItemContainerTestedTestsRecord!
                                                            .reference,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Color(0x1AFFFFFF),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: BeginTestWidget(
                                                    bookedTestRef:
                                                        testItemContainerTestedTestsRecord!
                                                            .bookedTestRef,
                                                    booking: widget.bookingRef,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FutureBuilder<TestsRecord>(
                                                  future: TestsRecord
                                                      .getDocumentOnce(
                                                          testItemContainerTestedTestsRecord!
                                                              .testRef!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textTestsRecord =
                                                        snapshot.data!;
                                                    return Text(
                                                      functions
                                                          .upperCase(
                                                              textTestsRecord
                                                                  .name)
                                                          .maybeHandleOverflow(
                                                            maxChars: 15,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    StreamBuilder<
                                                        List<
                                                            TestedTestsRecord>>(
                                                      stream:
                                                          queryTestedTestsRecord(
                                                        queryBuilder: (testedTestsRecord) =>
                                                            testedTestsRecord
                                                                .where(
                                                                    'booking_ref',
                                                                    isEqualTo: widget
                                                                        .bookingRef!
                                                                        .reference)
                                                                .where(
                                                                    'test_ref',
                                                                    isEqualTo:
                                                                        bookedTestsItem),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<TestedTestsRecord>
                                                            containerTestedTestsRecordList =
                                                            snapshot.data!;
                                                        final containerTestedTestsRecord =
                                                            containerTestedTestsRecordList
                                                                    .isNotEmpty
                                                                ? containerTestedTestsRecordList
                                                                    .first
                                                                : null;
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Container(
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.6,
                                                                  color: Color(
                                                                      0x31000000),
                                                                  spreadRadius:
                                                                      0.6,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
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
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2,
                                                                                2,
                                                                                2,
                                                                                2),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.clock,
                                                                              color: Color(0xFFF3F3F3),
                                                                              size: 20,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2,
                                                                                2,
                                                                                2,
                                                                                2),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.handHoldingMedical,
                                                                              color: Color(0x34FFFFFF),
                                                                              size: 20,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (containerTestedTestsRecord !=
                                                                            null)
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.handHoldingMedical,
                                                                                color: Color(0xFFF3F3F3),
                                                                                size: 20,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2,
                                                                                2,
                                                                                2,
                                                                                2),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.flask,
                                                                              color: Color(0x33FFFFFF),
                                                                              size: 20,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (containerTestedTestsRecord!.resultPosted ??
                                                                            true)
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.flask,
                                                                                color: Color(0xFFF3F3F3),
                                                                                size: 20,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 25,
                                                                    height: 25,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2,
                                                                                2,
                                                                                2,
                                                                                2),
                                                                            child:
                                                                                Icon(
                                                                              Icons.check_circle_outlined,
                                                                              color: Color(0x34FFFFFF),
                                                                              size: 20,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (containerTestedTestsRecord!.isVerified ??
                                                                            true)
                                                                          StreamBuilder<
                                                                              List<TestedTestsRecord>>(
                                                                            stream:
                                                                                queryTestedTestsRecord(
                                                                              queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booked_test_Ref', isEqualTo: containerTestedTestsRecord!.bookedTestRef),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<TestedTestsRecord> testVerifiedTestedTestsRecordList = snapshot.data!;
                                                                              // Return an empty Container when the document does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final testVerifiedTestedTestsRecord = testVerifiedTestedTestsRecordList.isNotEmpty ? testVerifiedTestedTestsRecordList.first : null;
                                                                              return Container(
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                  child: Icon(
                                                                                    Icons.check_circle_outlined,
                                                                                    color: Color(0xFFF3F3F3),
                                                                                    size: 22,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 10, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: FaIcon(
                                          FontAwesomeIcons.flask,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 2),
                                            child: Text(
                                              widget.bookingRef!.bookedTests!
                                                  .toList()
                                                  .length
                                                  .toString()
                                                  .maybeHandleOverflow(
                                                      maxChars: 2),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
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
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.local_police_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 2),
                                            child: Text(
                                              widget.bookingRef!.verifiedTests!
                                                  .toList()
                                                  .length
                                                  .toString()
                                                  .maybeHandleOverflow(
                                                      maxChars: 2),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
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
                            if (widget.bookingRef!.completed ?? true)
                              Container(
                                height: 32,
                                constraints: BoxConstraints(
                                  maxHeight: 32,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x32171717),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.verified_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 0, 0, 0),
                                        child: Text(
                                          'Complete',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
