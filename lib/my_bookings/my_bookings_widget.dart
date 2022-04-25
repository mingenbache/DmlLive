import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../booking_updates/booking_updates_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../lab_report/lab_report_widget.dart';
import '../scheduled_tests/scheduled_tests_widget.dart';
import '../test_deck/test_deck_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({Key key}) : super(key: key);

  @override
  _MyBookingsWidgetState createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  DateTimeRange calendarSelectedDay;
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopActionsWidget(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'BOOKINGS',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF586B06),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Color(0xFF586B06),
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).primaryColor,
                    labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                    indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                    tabs: [
                      Tab(
                        text: 'Past Bookings',
                      ),
                      Tab(
                        text: 'Calendar View',
                      ),
                      Tab(
                        text: 'Inactive',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        StreamBuilder<List<BookingsRecord>>(
                          stream: queryBookingsRecord(
                            queryBuilder: (bookingsRecord) => bookingsRecord
                                .where('completed', isEqualTo: true)
                                .where('user', isEqualTo: currentUserReference),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitDoubleBounce(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<BookingsRecord>
                                pastBookingsBookingsRecordList = snapshot.data;
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Builder(
                                  builder: (context) {
                                    final pastbookings =
                                        pastBookingsBookingsRecordList
                                                ?.toList() ??
                                            [];
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children:
                                            List.generate(pastbookings.length,
                                                (pastbookingsIndex) {
                                          final pastbookingsItem =
                                              pastbookings[pastbookingsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LabReportWidget(
                                                          bookingRef:
                                                              pastbookingsItem
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height: 210,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 6,
                                                            color: Color(
                                                                0x7258595B),
                                                            spreadRadius: 2,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          5,
                                                                          10,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                4,
                                                                                4),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat('MMMEd', pastbookingsItem.scheduledDate),
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                4,
                                                                                4,
                                                                                4),
                                                                            child:
                                                                                Text(
                                                                              pastbookingsItem.bookingstatus,
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.15,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Name:',
                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            2,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.58,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x33FFFFFF),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                6,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              '${pastbookingsItem.firstname}   ${pastbookingsItem.lastname}',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 15,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              StreamBuilder<List<TestedTestsRecord>>(
                                                                                stream: queryTestedTestsRecord(
                                                                                  queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booking_ref', isEqualTo: pastbookingsItem.reference),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        child: SpinKitDoubleBounce(
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          size: 50,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data;
                                                                                  return Container(
                                                                                    height: 100,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final testsOfBooking = containerTestedTestsRecordList?.toList() ?? [];
                                                                                        return ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: testsOfBooking.length,
                                                                                          itemBuilder: (context, testsOfBookingIndex) {
                                                                                            final testsOfBookingItem = testsOfBooking[testsOfBookingIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 2),
                                                                                              child: StreamBuilder<TestsRecord>(
                                                                                                stream: TestsRecord.getDocument(testsOfBookingItem.testRef),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitDoubleBounce(
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  final containerTestsRecord = snapshot.data;
                                                                                                  return InkWell(
                                                                                                    onTap: () async {
                                                                                                      await Navigator.push(
                                                                                                        context,
                                                                                                        MaterialPageRoute(
                                                                                                          builder: (context) => TestDeckWidget(
                                                                                                            testedTestRef: testsOfBookingItem.reference,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.6,
                                                                                                      height: MediaQuery.of(context).size.height * 0.04,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Colors.white,
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: MediaQuery.of(context).size.width * 0.4,
                                                                                                            height: 100,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                                              child: Text(
                                                                                                                containerTestsRecord.name,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Roboto',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          if (testsOfBookingItem.resultsPositive ?? true)
                                                                                                            Container(
                                                                                                              width: MediaQuery.of(context).size.width * 0.25,
                                                                                                              height: 100,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 8, 5, 5),
                                                                                                                child: Text(
                                                                                                                  'Positive',
                                                                                                                  textAlign: TextAlign.end,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Roboto',
                                                                                                                        color: Color(0xFF586B06),
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          if (!(testsOfBookingItem.resultsPositive) ?? true)
                                                                                                            Container(
                                                                                                              width: MediaQuery.of(context).size.width * 0.25,
                                                                                                              height: 100,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 8, 5, 5),
                                                                                                                child: Text(
                                                                                                                  'Negative',
                                                                                                                  textAlign: TextAlign.end,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Roboto',
                                                                                                                        color: Color(0xFF586B06),
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Visibility(
                                                                                                              visible: testsOfBookingItem.isVerified ?? true,
                                                                                                              child: Icon(
                                                                                                                Icons.check_circle,
                                                                                                                color: Color(0xFF586B06),
                                                                                                                size: 24,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
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
                                                                                  );
                                                                                },
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: FlutterFlowCalendar(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      weekFormat: true,
                                      weekStartsMonday: false,
                                      initialDate: getCurrentTimestamp,
                                      onChange:
                                          (DateTimeRange newSelectedDate) {
                                        setState(() => calendarSelectedDay =
                                            newSelectedDate);
                                      },
                                      titleStyle: TextStyle(
                                        color: Color(0xFF586B06),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      dayOfWeekStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      dateStyle: TextStyle(
                                        color: Color(0xFF586B06),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      selectedDateStyle: TextStyle(),
                                      inactiveDateStyle: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
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
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ScheduledTestsWidget(),
                                              ),
                                            );
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 10, 5),
                                                child: Text(
                                                  'Test View',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                              StreamBuilder<List<BookingsRecord>>(
                                stream: queryBookingsRecord(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord
                                          .where('user',
                                              isEqualTo: currentUserReference)
                                          .where('scheduled_date',
                                              isEqualTo:
                                                  functions.getDayToday())
                                          .where('booking_confirmed',
                                              isEqualTo: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitDoubleBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<BookingsRecord>
                                      containerBookingsRecordList =
                                      snapshot.data;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Builder(
                                        builder: (context) {
                                          final bookings =
                                              containerBookingsRecordList
                                                      ?.toList() ??
                                                  [];
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children:
                                                  List.generate(bookings.length,
                                                      (bookingsIndex) {
                                                final bookingsItem =
                                                    bookings[bookingsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  BookingUpdatesWidget(
                                                                bookingRef:
                                                                    bookingsItem
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: 210,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 6,
                                                                  color: Color(
                                                                      0x7258595B),
                                                                  spreadRadius:
                                                                      2,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.8,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            5,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 4),
                                                                                  child: Text(
                                                                                    dateTimeFormat('MMMEd', bookingsItem.scheduledDate),
                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
                                                                                  child: Text(
                                                                                    bookingsItem.bookingstatus,
                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: Colors.white,
                                                                                          fontSize: 14,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.15,
                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                ),
                                                                                child: Text(
                                                                                  'Name:',
                                                                                  style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.58,
                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x33FFFFFF),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6, 6, 0, 0),
                                                                                  child: Text(
                                                                                    '${bookingsItem.firstname}   ${bookingsItem.lastname}',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 100,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: StreamBuilder<List<BookedTestsRecord>>(
                                                                                        stream: queryBookedTestsRecord(
                                                                                          queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where('booking_ref', isEqualTo: bookingsItem.reference),
                                                                                        ),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50,
                                                                                                height: 50,
                                                                                                child: SpinKitDoubleBounce(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  size: 50,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          List<BookedTestsRecord> listViewBookedTestsRecordList = snapshot.data;
                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: listViewBookedTestsRecordList.length,
                                                                                            itemBuilder: (context, listViewIndex) {
                                                                                              final listViewBookedTestsRecord = listViewBookedTestsRecordList[listViewIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 2),
                                                                                                child: StreamBuilder<TestsRecord>(
                                                                                                  stream: TestsRecord.getDocument(listViewBookedTestsRecord.testRef),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 50,
                                                                                                          height: 50,
                                                                                                          child: SpinKitDoubleBounce(
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            size: 50,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    final containerTestsRecord = snapshot.data;
                                                                                                    return Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.6,
                                                                                                      height: MediaQuery.of(context).size.height * 0.04,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Colors.white,
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: MediaQuery.of(context).size.width * 0.4,
                                                                                                            height: 100,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                                              child: Text(
                                                                                                                containerTestsRecord.name,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Roboto',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: MediaQuery.of(context).size.width * 0.25,
                                                                                                            height: 100,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 8, 5, 5),
                                                                                                              child: Text(
                                                                                                                'Confirmed',
                                                                                                                textAlign: TextAlign.end,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Roboto',
                                                                                                                      color: Color(0xFF586B06),
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder<List<BookingsRecord>>(
                          stream: queryBookingsRecord(
                            queryBuilder: (bookingsRecord) => bookingsRecord
                                .where('booking_confirmed', isEqualTo: false),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitDoubleBounce(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<BookingsRecord>
                                inactiveBookingsBookingsRecordList =
                                snapshot.data;
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Builder(
                                  builder: (context) {
                                    final inactivebookings =
                                        inactiveBookingsBookingsRecordList
                                                ?.toList() ??
                                            [];
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                            inactivebookings.length,
                                            (inactivebookingsIndex) {
                                          final inactivebookingsItem =
                                              inactivebookings[
                                                  inactivebookingsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            BookingUpdatesWidget(
                                                          bookingRef:
                                                              inactivebookingsItem
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height: 210,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 6,
                                                            color: Color(
                                                                0x7258595B),
                                                            spreadRadius: 2,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          5,
                                                                          10,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                4,
                                                                                4),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat('MMMEd', inactivebookingsItem.scheduledDate),
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                4,
                                                                                4,
                                                                                4),
                                                                            child:
                                                                                Text(
                                                                              inactivebookingsItem.bookingstatus,
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.15,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Name:',
                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            2,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.58,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x33FFFFFF),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                6,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              '${functions.camelCase(inactivebookingsItem.firstname)}   ${functions.camelCase(inactivebookingsItem.lastname)}',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 15,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            60,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              6,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 1,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 80,
                                                                                  height: 65,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            dateTimeFormat('yMMMd', inactivebookingsItem.scheduledDate).maybeHandleOverflow(maxChars: 3),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            functions.dateDay(inactivebookingsItem.scheduledDate).maybeHandleOverflow(maxChars: 2),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontSize: 24,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            dateTimeFormat('EEEE', inactivebookingsItem.scheduledDate).maybeHandleOverflow(maxChars: 3),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontSize: 12,
                                                                                                  fontWeight: FontWeight.w500,
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
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                220,
                                                                            height:
                                                                                50,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Container(
                                                                                  width: 90,
                                                                                  height: 30,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.flag_rounded,
                                                                                          color: Colors.white,
                                                                                          size: 16,
                                                                                        ),
                                                                                        Text(
                                                                                          'Flagged',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 90,
                                                                                  height: 30,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x33FFFFFF),
                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.solidPauseCircle,
                                                                                          color: Colors.white,
                                                                                          size: 16,
                                                                                        ),
                                                                                        Text(
                                                                                          'On Hold',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF586B06),
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.fileInvoice,
                                                                                      color: Colors.white,
                                                                                      size: 16,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Invoices due',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                    child: Container(
                                                                                      width: 82,
                                                                                      height: 30,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x71EEEEEE),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0, 0.15),
                                                                                        child: Text(
                                                                                          formatNumber(
                                                                                            inactivebookingsItem.totalPrice,
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.periodDecimal,
                                                                                            currency: 'Kshs ',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              StreamBuilder<List<TestedTestsRecord>>(
                                                                                stream: queryTestedTestsRecord(
                                                                                  queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booking_ref', isEqualTo: inactivebookingsItem.reference),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        child: SpinKitDoubleBounce(
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          size: 50,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data;
                                                                                  return Container(
                                                                                    width: 300,
                                                                                    height: 35,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final bookingtests = inactivebookingsItem.testsIncluded?.toList() ?? [];
                                                                                        return ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          itemCount: bookingtests.length,
                                                                                          itemBuilder: (context, bookingtestsIndex) {
                                                                                            final bookingtestsItem = bookingtests[bookingtestsIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 2),
                                                                                              child: StreamBuilder<TestsRecord>(
                                                                                                stream: TestsRecord.getDocument(bookingtestsItem),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitDoubleBounce(
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  final containerTestsRecord = snapshot.data;
                                                                                                  return Container(
                                                                                                    width: MediaQuery.of(context).size.width * 0.3,
                                                                                                    height: MediaQuery.of(context).size.height * 0.04,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Colors.white,
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: MediaQuery.of(context).size.width * 0.28,
                                                                                                          height: 100,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                                            child: Text(
                                                                                                              functions.camelCase(containerTestsRecord.name).maybeHandleOverflow(
                                                                                                                    maxChars: 20,
                                                                                                                    replacement: '…',
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Roboto',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
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
                                          );
                                        }),
                                      ),
                                    );
                                  },
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
        ],
      ),
    );
  }
}
