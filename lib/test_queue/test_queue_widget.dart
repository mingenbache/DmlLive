import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TestQueueWidget extends StatefulWidget {
  const TestQueueWidget({Key key}) : super(key: key);

  @override
  _TestQueueWidgetState createState() => _TestQueueWidgetState();
}

class _TestQueueWidgetState extends State<TestQueueWidget> {
  DateTimeRange calendarSelectedDay;
  TestedTestsRecord newTestedtest;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopActionsWidget(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(),
                    child: Text(
                      'TEST QUEUE',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF586B06),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<List<BookedTestsRecord>>(
              stream: queryBookedTestsRecord(
                queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where(
                    'scheduled_date',
                    isEqualTo: functions.getDayToday()),
              ),
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
                List<BookedTestsRecord>
                    calendarScheduleContainerBookedTestsRecordList =
                    snapshot.data;
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              weekFormat: true,
                              weekStartsMonday: false,
                              onChange: (DateTimeRange newSelectedDate) {
                                setState(() =>
                                    calendarSelectedDay = newSelectedDate);
                              },
                              titleStyle: TextStyle(
                                color: Color(0xFF586B06),
                                fontWeight: FontWeight.w500,
                              ),
                              dayOfWeekStyle: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              dateStyle: TextStyle(
                                color: Color(0xFF586B06),
                                fontWeight: FontWeight.w500,
                              ),
                              selectedDateStyle: TextStyle(),
                              inactiveDateStyle: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Today',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                        ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      context.pushNamed('BookingsSchedule');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 5, 10, 5),
                                          child: Text(
                                            'Group by Patient',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: StreamBuilder<List<TestedTestsRecord>>(
                            stream: queryTestedTestsRecord(
                              queryBuilder: (testedTestsRecord) =>
                                  testedTestsRecord.orderBy('date_conducted',
                                      descending: true),
                            ),
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
                              List<TestedTestsRecord>
                                  scheduledTestsContainerTestedTestsRecordList =
                                  snapshot.data;
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.37,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final bookedTests =
                                              calendarScheduleContainerBookedTestsRecordList
                                                      ?.toList() ??
                                                  [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: bookedTests.length,
                                            itemBuilder:
                                                (context, bookedTestsIndex) {
                                              final bookedTestsItem =
                                                  bookedTests[bookedTestsIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: StreamBuilder<
                                                    List<TestedTestsRecord>>(
                                                  stream:
                                                      queryTestedTestsRecord(
                                                    queryBuilder: (testedTestsRecord) =>
                                                        testedTestsRecord.where(
                                                            'booked_test_Ref',
                                                            isEqualTo:
                                                                bookedTestsItem
                                                                    .reference),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<TestedTestsRecord>
                                                        testQueueItemTestedTestsRecordList =
                                                        snapshot.data;
                                                    final testQueueItemTestedTestsRecord =
                                                        testQueueItemTestedTestsRecordList
                                                                .isNotEmpty
                                                            ? testQueueItemTestedTestsRecordList
                                                                .first
                                                            : null;
                                                    return InkWell(
                                                      onTap: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if (testQueueItemTestedTestsRecord !=
                                                            null) {
                                                          final testedTestsCreateData =
                                                              createTestedTestsRecordData(
                                                            testRef:
                                                                bookedTestsItem
                                                                    .testRef,
                                                            bookingRef:
                                                                bookedTestsItem
                                                                    .bookingRef,
                                                            isVerified: false,
                                                            isFlagged: false,
                                                            resultsPositive:
                                                                false,
                                                            sampleReleased:
                                                                false,
                                                            bookedTestRef:
                                                                bookedTestsItem
                                                                    .reference,
                                                            dateSampleCollected:
                                                                getCurrentTimestamp,
                                                          );
                                                          var testedTestsRecordReference =
                                                              TestedTestsRecord
                                                                  .collection
                                                                  .doc();
                                                          await testedTestsRecordReference
                                                              .set(
                                                                  testedTestsCreateData);
                                                          newTestedtest = TestedTestsRecord
                                                              .getDocumentFromData(
                                                                  testedTestsCreateData,
                                                                  testedTestsRecordReference);
                                                          _shouldSetState =
                                                              true;
                                                        } else {
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        context.pushNamed(
                                                          'TestDeck',
                                                          queryParams: {
                                                            'testedTestRef':
                                                                serializeParam(
                                                                    newTestedtest
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference),
                                                          },
                                                        );
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Container(
                                                          height: 140,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFECECEC),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: StreamBuilder<
                                                              BookingsRecord>(
                                                            stream: BookingsRecord
                                                                .getDocument(
                                                                    bookedTestsItem
                                                                        .bookingRef),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              final columnBookingsRecord =
                                                                  snapshot.data;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                    child: StreamBuilder<
                                                                        TestsRecord>(
                                                                      stream: TestsRecord.getDocument(
                                                                          bookedTestsItem
                                                                              .testRef),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final containerTestsRecord =
                                                                            snapshot.data;
                                                                        return Container(
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  containerTestsRecord.name,
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 80,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              272,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.82,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.12,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                              child: Text(
                                                                                                'REF',
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 145,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Colors.white,
                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                              child: Text(
                                                                                                columnBookingsRecord.labRefNum,
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: Color(0xFF586B06),
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.82,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (bookedTestsItem.sampleCollected ?? true)
                                                                                              FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('ButtonCollected pressed ...');
                                                                                                },
                                                                                                text: 'Sample',
                                                                                                icon: FaIcon(
                                                                                                  FontAwesomeIcons.handHoldingMedical,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  size: 18,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: 110,
                                                                                                  height: 40,
                                                                                                  color: Color(0x0088993A),
                                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        fontSize: 15,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: 12,
                                                                                                ),
                                                                                              ),
                                                                                            if (!(bookedTestsItem.sampleCollected) ?? true)
                                                                                              FFButtonWidget(
                                                                                                onPressed: () {
                                                                                                  print('ButtonNotCollected pressed ...');
                                                                                                },
                                                                                                text: 'Sample',
                                                                                                icon: FaIcon(
                                                                                                  FontAwesomeIcons.handHoldingMedical,
                                                                                                  size: 18,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: 110,
                                                                                                  height: 40,
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 15,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: 12,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () {
                                                                                            print('Button pressed ...');
                                                                                          },
                                                                                          text: 'Results',
                                                                                          icon: Icon(
                                                                                            Icons.receipt_long,
                                                                                            size: 18,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            width: 110,
                                                                                            height: 40,
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  fontSize: 15,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 1,
                                                                                            ),
                                                                                            borderRadius: 12,
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
                                                                        Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                12,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.chevron_right_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  size: 24,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
