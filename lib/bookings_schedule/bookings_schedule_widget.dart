import '../backend/backend.dart';
import '../booking_confirmation/booking_confirmation_widget.dart';
import '../components/begin_test_widget.dart';
import '../components/booking_update_widget.dart';
import '../components/date_widget_small_widget.dart';
import '../components/top_actions_widget.dart';
import '../components/view_test_result_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../scheduled_tests/scheduled_tests_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsScheduleWidget extends StatefulWidget {
  const BookingsScheduleWidget({Key key}) : super(key: key);

  @override
  _BookingsScheduleWidgetState createState() => _BookingsScheduleWidgetState();
}

class _BookingsScheduleWidgetState extends State<BookingsScheduleWidget> {
  DateTimeRange uICalendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    uICalendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BookingsRecord>>(
      stream: queryBookingsRecord(
        queryBuilder: (bookingsRecord) => bookingsRecord.where('scheduled_date',
            isEqualTo: functions.getDayToday()),
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
        List<BookingsRecord> bookingsScheduleBookingsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'assets/images/martha-dominguez-de-gouveia-g0PTp89dumc-unsplash_reduced.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.44,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x4DFFFFFF),
                        Color(0xACBACA68),
                        Color(0xFFB5AC49)
                      ],
                      stops: [0, 0.3, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                  child: Column(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'BOOKINGS',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title1
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.white,
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
                          initialIndex: 1,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Colors.white,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).alternate,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                indicatorColor: Colors.white,
                                indicatorWeight: 3,
                                tabs: [
                                  Tab(
                                    text: 'Past Bookings',
                                  ),
                                  Tab(
                                    text: 'Calendar View',
                                  ),
                                  Tab(
                                    text: 'Unconfirmed',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    StreamBuilder<List<BookingsRecord>>(
                                      stream: queryBookingsRecord(
                                        queryBuilder: (bookingsRecord) =>
                                            bookingsRecord
                                                .where('booking_confirmed',
                                                    isEqualTo: true)
                                                .orderBy('scheduled_date',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitDoubleBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BookingsRecord>
                                            pastBookingsBookingsRecordList =
                                            snapshot.data;
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 20),
                                            child: Builder(
                                              builder: (context) {
                                                final pastbookings =
                                                    pastBookingsBookingsRecordList
                                                            ?.toList() ??
                                                        [];
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        pastbookings.length,
                                                        (pastbookingsIndex) {
                                                      final pastbookingsItem =
                                                          pastbookings[
                                                              pastbookingsIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(5, 0,
                                                                    5, 20),
                                                        child: StreamBuilder<
                                                            List<
                                                                TestedTestsRecord>>(
                                                          stream:
                                                              queryTestedTestsRecord(
                                                            queryBuilder: (testedTestsRecord) =>
                                                                testedTestsRecord.where(
                                                                    'booking_ref',
                                                                    isEqualTo:
                                                                        pastbookingsItem
                                                                            .reference),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitDoubleBounce(
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
                                                                snapshot.data;
                                                            return InkWell(
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Color(
                                                                          0x4CFFFFFF),
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          BookingUpdateWidget(
                                                                        bookingRef:
                                                                            pastbookingsItem,
                                                                      ),
                                                                    );
                                                                  },
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
                                                                              16),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.77,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        330,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .asset(
                                                                        'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                                                                      ).image,
                                                                    ),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            6,
                                                                        color: Color(
                                                                            0x7258595B),
                                                                        spreadRadius:
                                                                            2,
                                                                      )
                                                                    ],
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        Color(
                                                                            0xFFB5AC49)
                                                                      ],
                                                                      stops: [
                                                                        0,
                                                                        1
                                                                      ],
                                                                      begin:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                      end: AlignmentDirectional(
                                                                          0, 1),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.77,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0xC4B5AC49),
                                                                              Color(0xB2FFFFFF),
                                                                              FlutterFlowTheme.of(context).primaryColor
                                                                            ],
                                                                            stops: [
                                                                              0,
                                                                              0.2,
                                                                              1
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0, -1),
                                                                            end:
                                                                                AlignmentDirectional(0, 1),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
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
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0),
                                                                                  bottomRight: Radius.circular(0),
                                                                                  topLeft: Radius.circular(16),
                                                                                  topRight: Radius.circular(16),
                                                                                ),
                                                                              ),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xBFFFFFFF),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0),
                                                                                    bottomRight: Radius.circular(0),
                                                                                    topLeft: Radius.circular(16),
                                                                                    topRight: Radius.circular(16),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 2, 10, 5),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                  child: Text(
                                                                                                    functions.add1(functions.checkTestListSize(pastBookingsBookingsRecordList.length, pastbookingsIndex)).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                          fontFamily: 'Roboto',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          fontSize: 16,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                                                                            child: Text(
                                                                                              '${functions.camelCase(pastbookingsItem.firstname)} ${functions.camelCase(pastbookingsItem.lastname)}',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontSize: 17,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      DateWidgetSmallWidget(
                                                                                        date: pastbookingsItem.scheduledDate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                              child: StreamBuilder<List<BookedTestsRecord>>(
                                                                                stream: queryBookedTestsRecord(
                                                                                  queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where('booking_ref', isEqualTo: pastbookingsItem.reference),
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
                                                                                  List<BookedTestsRecord> bookedTestsContainerBookedTestsRecordList = snapshot.data;
                                                                                  return Container(
                                                                                    height: MediaQuery.of(context).size.height * 0.15,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final pastBookingTests = bookedTestsContainerBookedTestsRecordList?.toList() ?? [];
                                                                                          return ListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: pastBookingTests.length,
                                                                                            itemBuilder: (context, pastBookingTestsIndex) {
                                                                                              final pastBookingTestsItem = pastBookingTests[pastBookingTestsIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                                                                                                child: Material(
                                                                                                  color: Colors.transparent,
                                                                                                  elevation: 1,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.of(context).size.width * 0.8,
                                                                                                    height: MediaQuery.of(context).size.height * 0.04,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: 290,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x6AFFFFFF),
                                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          StreamBuilder<TestsRecord>(
                                                                                                            stream: TestsRecord.getDocument(pastBookingTestsItem.testRef),
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
                                                                                                              final textTestsRecord = snapshot.data;
                                                                                                              return Text(
                                                                                                                functions.upperCase(textTestsRecord.name).maybeHandleOverflow(
                                                                                                                      maxChars: 15,
                                                                                                                      replacement: '…',
                                                                                                                    ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Roboto',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Material(
                                                                                                                color: Colors.transparent,
                                                                                                                elevation: 2,
                                                                                                                shape: RoundedRectangleBorder(
                                                                                                                  borderRadius: BorderRadius.circular(16),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    boxShadow: [
                                                                                                                      BoxShadow(
                                                                                                                        blurRadius: 0.6,
                                                                                                                        color: Color(0x31000000),
                                                                                                                        spreadRadius: 0.6,
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Container(
                                                                                                                          width: 25,
                                                                                                                          height: 25,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                  child: FaIcon(
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
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.handHoldingMedical,
                                                                                                                                    color: Color(0x34FFFFFF),
                                                                                                                                    size: 20,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              if (pastBookingTestsItem.sampleCollected ?? true)
                                                                                                                                Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    shape: BoxShape.circle,
                                                                                                                                  ),
                                                                                                                                  child: Padding(
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
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.flask,
                                                                                                                                    color: Color(0x33FFFFFF),
                                                                                                                                    size: 20,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              if (pastBookingTestsItem.hasResult ?? true)
                                                                                                                                Container(
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    shape: BoxShape.circle,
                                                                                                                                  ),
                                                                                                                                  child: Padding(
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
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                  child: Icon(
                                                                                                                                    Icons.check_circle_outlined,
                                                                                                                                    color: Color(0x34FFFFFF),
                                                                                                                                    size: 20,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              StreamBuilder<List<TestedTestsRecord>>(
                                                                                                                                stream: queryTestedTestsRecord(
                                                                                                                                  queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booked_test_Ref', isEqualTo: pastBookingTestsItem.reference),
                                                                                                                                  singleRecord: true,
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
                                                                                                                                  List<TestedTestsRecord> testVerifiedTestedTestsRecordList = snapshot.data;
                                                                                                                                  // Return an empty Container when the document does not exist.
                                                                                                                                  if (snapshot.data.isEmpty) {
                                                                                                                                    return Container();
                                                                                                                                  }
                                                                                                                                  final testVerifiedTestedTestsRecord = testVerifiedTestedTestsRecordList.isNotEmpty ? testVerifiedTestedTestsRecordList.first : null;
                                                                                                                                  return Container(
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                    ),
                                                                                                                                    child: Visibility(
                                                                                                                                      visible: testVerifiedTestedTestsRecord.isVerified ?? true,
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                        child: Icon(
                                                                                                                                          Icons.check_circle_outlined,
                                                                                                                                          color: Color(0xFFF3F3F3),
                                                                                                                                          size: 22,
                                                                                                                                        ),
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
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
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
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(16),
                                                                                  bottomRight: Radius.circular(16),
                                                                                  topLeft: Radius.circular(0),
                                                                                  topRight: Radius.circular(0),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.flask,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  size: 14,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 20,
                                                                                              height: 20,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                ),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                                    child: Text(
                                                                                                      pastbookingsItem.bookedTests.length.toString().maybeHandleOverflow(maxChars: 2),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.white,
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
                                                                                    if (pastbookingsItem.completed ?? true)
                                                                                      Container(
                                                                                        width: 110,
                                                                                        height: 32,
                                                                                        constraints: BoxConstraints(
                                                                                          maxHeight: 32,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x80586B06),
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.playlist_add_check,
                                                                                                color: Colors.white,
                                                                                                size: 20,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  'Completed',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: FlutterFlowCalendar(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  weekFormat: true,
                                                  weekStartsMonday: true,
                                                  initialDate:
                                                      functions.returntheDay(
                                                          getCurrentTimestamp),
                                                  onChange: (DateTimeRange
                                                      newSelectedDate) {
                                                    setState(() =>
                                                        uICalendarSelectedDay =
                                                            newSelectedDate);
                                                  },
                                                  titleStyle: TextStyle(
                                                    color: Color(0xFF586B06),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  dayOfWeekStyle: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  dateStyle: TextStyle(
                                                    color: Color(0xFF586B06),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  selectedDateStyle:
                                                      TextStyle(),
                                                  inactiveDateStyle: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      functions.datetoString(
                                                          functions.returntheDay(
                                                              uICalendarSelectedDay
                                                                  .start)),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF586B06),
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
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        5,
                                                                        10,
                                                                        5),
                                                            child: Text(
                                                              'Test View',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
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
                                                      .where('scheduled_date',
                                                          isGreaterThanOrEqualTo:
                                                              functions.returntheDay(
                                                                  uICalendarSelectedDay
                                                                      .start))
                                                      .orderBy(
                                                          'scheduled_date'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitDoubleBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BookingsRecord>
                                                  calendarBookingsBookingsRecordList =
                                                  snapshot.data;
                                              return Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.6,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 20),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final bookings = functions
                                                              .filterDayBookings(
                                                                  calendarBookingsBookingsRecordList
                                                                      .toList(),
                                                                  uICalendarSelectedDay
                                                                      .start)
                                                              ?.toList() ??
                                                          [];
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: List.generate(
                                                              bookings.length,
                                                              (bookingsIndex) {
                                                            final bookingsItem =
                                                                bookings[
                                                                    bookingsIndex];
                                                            return Visibility(
                                                              visible: bookingsItem
                                                                      .bookingConfirmed ??
                                                                  true,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            15),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            TestedTestsRecord>>(
                                                                      stream:
                                                                          queryTestedTestsRecord(
                                                                        queryBuilder: (testedTestsRecord) => testedTestsRecord.where(
                                                                            'booking_ref',
                                                                            isEqualTo:
                                                                                bookingsItem.reference),
                                                                      ),
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
                                                                              child: SpinKitDoubleBounce(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<TestedTestsRecord>
                                                                            containerTestedTestsRecordList =
                                                                            snapshot.data;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Color(0x4CFFFFFF),
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: BookingUpdateWidget(
                                                                                    bookingRef: bookingsItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                2,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 0.77,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 330,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.asset(
                                                                                    'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                                                                                  ).image,
                                                                                ),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 6,
                                                                                    color: Color(0x7258595B),
                                                                                    spreadRadius: 2,
                                                                                  )
                                                                                ],
                                                                                gradient: LinearGradient(
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).primaryColor,
                                                                                    Color(0xFFB5AC49)
                                                                                  ],
                                                                                  stops: [
                                                                                    0,
                                                                                    1
                                                                                  ],
                                                                                  begin: AlignmentDirectional(0, -1),
                                                                                  end: AlignmentDirectional(0, 1),
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(16),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.77,
                                                                                    decoration: BoxDecoration(
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xC4B5AC49),
                                                                                          Color(0xB2FFFFFF),
                                                                                          FlutterFlowTheme.of(context).primaryColor
                                                                                        ],
                                                                                        stops: [
                                                                                          0,
                                                                                          0.2,
                                                                                          1
                                                                                        ],
                                                                                        begin: AlignmentDirectional(0, -1),
                                                                                        end: AlignmentDirectional(0, 1),
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Material(
                                                                                          color: Colors.transparent,
                                                                                          elevation: 2,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0),
                                                                                              bottomRight: Radius.circular(0),
                                                                                              topLeft: Radius.circular(16),
                                                                                              topRight: Radius.circular(16),
                                                                                            ),
                                                                                          ),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xBFFFFFFF),
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(0),
                                                                                                bottomRight: Radius.circular(0),
                                                                                                topLeft: Radius.circular(16),
                                                                                                topRight: Radius.circular(16),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 2, 10, 5),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                              child: Text(
                                                                                                                functions.add1(functions.checkTestListSize(calendarBookingsBookingsRecordList.length, bookingsIndex)).toString(),
                                                                                                                style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                      fontFamily: 'Roboto',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                      fontSize: 16,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                                                                                        child: Text(
                                                                                                          '${functions.camelCase(bookingsItem.firstname)} ${functions.camelCase(bookingsItem.lastname)}',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontSize: 17,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  DateWidgetSmallWidget(
                                                                                                    date: bookingsItem.scheduledDate,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
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
                                                                                              List<BookedTestsRecord> bookedTestsContainerBookedTestsRecordList = snapshot.data;
                                                                                              return Container(
                                                                                                height: MediaQuery.of(context).size.height * 0.15,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      final bookedTestsList = bookedTestsContainerBookedTestsRecordList?.toList() ?? [];
                                                                                                      return ListView.builder(
                                                                                                        padding: EdgeInsets.zero,
                                                                                                        primary: false,
                                                                                                        scrollDirection: Axis.vertical,
                                                                                                        itemCount: bookedTestsList.length,
                                                                                                        itemBuilder: (context, bookedTestsListIndex) {
                                                                                                          final bookedTestsListItem = bookedTestsList[bookedTestsListIndex];
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                                                                                                            child: InkWell(
                                                                                                              onTap: () async {
                                                                                                                if (!(bookedTestsListItem.sampleCollected)) {
                                                                                                                  await showModalBottomSheet(
                                                                                                                    isScrollControlled: true,
                                                                                                                    backgroundColor: Color(0x1AFFFFFF),
                                                                                                                    context: context,
                                                                                                                    builder: (context) {
                                                                                                                      return Padding(
                                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                                        child: BeginTestWidget(
                                                                                                                          bookedTestRef: bookedTestsListItem.reference,
                                                                                                                          booking: bookingsItem,
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  );
                                                                                                                }
                                                                                                                if (bookedTestsListItem.sampleCollected) {
                                                                                                                  await showModalBottomSheet(
                                                                                                                    isScrollControlled: true,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    context: context,
                                                                                                                    builder: (context) {
                                                                                                                      return Padding(
                                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                                        child: ViewTestResultWidget(
                                                                                                                          testedTestRef: functions.returnTestedTestRef(containerTestedTestsRecordList.toList(), bookedTestsListItem.reference),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  );
                                                                                                                }
                                                                                                              },
                                                                                                              child: Material(
                                                                                                                color: Colors.transparent,
                                                                                                                elevation: 1,
                                                                                                                shape: RoundedRectangleBorder(
                                                                                                                  borderRadius: BorderRadius.circular(16),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                                                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxWidth: 290,
                                                                                                                  ),
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0x6AFFFFFF),
                                                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        StreamBuilder<TestsRecord>(
                                                                                                                          stream: TestsRecord.getDocument(bookedTestsListItem.testRef),
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
                                                                                                                            final textTestsRecord = snapshot.data;
                                                                                                                            return Text(
                                                                                                                              functions.upperCase(textTestsRecord.name).maybeHandleOverflow(
                                                                                                                                    maxChars: 15,
                                                                                                                                    replacement: '…',
                                                                                                                                  ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                    fontFamily: 'Roboto',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Material(
                                                                                                                              color: Colors.transparent,
                                                                                                                              elevation: 2,
                                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                                borderRadius: BorderRadius.circular(16),
                                                                                                                              ),
                                                                                                                              child: Container(
                                                                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                  boxShadow: [
                                                                                                                                    BoxShadow(
                                                                                                                                      blurRadius: 0.6,
                                                                                                                                      color: Color(0x31000000),
                                                                                                                                      spreadRadius: 0.6,
                                                                                                                                    )
                                                                                                                                  ],
                                                                                                                                  borderRadius: BorderRadius.circular(16),
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Container(
                                                                                                                                        width: 25,
                                                                                                                                        height: 25,
                                                                                                                                        decoration: BoxDecoration(),
                                                                                                                                        child: Stack(
                                                                                                                                          children: [
                                                                                                                                            Container(
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                shape: BoxShape.circle,
                                                                                                                                              ),
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                                child: FaIcon(
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
                                                                                                                                        decoration: BoxDecoration(),
                                                                                                                                        child: Stack(
                                                                                                                                          children: [
                                                                                                                                            Container(
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                shape: BoxShape.circle,
                                                                                                                                              ),
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                                child: FaIcon(
                                                                                                                                                  FontAwesomeIcons.handHoldingMedical,
                                                                                                                                                  color: Color(0x34FFFFFF),
                                                                                                                                                  size: 20,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            if (bookedTestsListItem.sampleCollected ?? true)
                                                                                                                                              Container(
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                                ),
                                                                                                                                                child: Padding(
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
                                                                                                                                        decoration: BoxDecoration(),
                                                                                                                                        child: Stack(
                                                                                                                                          children: [
                                                                                                                                            Container(
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                shape: BoxShape.circle,
                                                                                                                                              ),
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                                child: FaIcon(
                                                                                                                                                  FontAwesomeIcons.flask,
                                                                                                                                                  color: Color(0x33FFFFFF),
                                                                                                                                                  size: 20,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            if (bookedTestsListItem.hasResult ?? true)
                                                                                                                                              Container(
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                                ),
                                                                                                                                                child: Padding(
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
                                                                                                                                        decoration: BoxDecoration(),
                                                                                                                                        child: Stack(
                                                                                                                                          children: [
                                                                                                                                            Container(
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                shape: BoxShape.circle,
                                                                                                                                              ),
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                                child: Icon(
                                                                                                                                                  Icons.check_circle_outlined,
                                                                                                                                                  color: Color(0x34FFFFFF),
                                                                                                                                                  size: 20,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            StreamBuilder<List<TestedTestsRecord>>(
                                                                                                                                              stream: queryTestedTestsRecord(
                                                                                                                                                queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booked_test_Ref', isEqualTo: bookedTestsListItem.reference),
                                                                                                                                                singleRecord: true,
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
                                                                                                                                                List<TestedTestsRecord> testVerifiedTestedTestsRecordList = snapshot.data;
                                                                                                                                                // Return an empty Container when the document does not exist.
                                                                                                                                                if (snapshot.data.isEmpty) {
                                                                                                                                                  return Container();
                                                                                                                                                }
                                                                                                                                                final testVerifiedTestedTestsRecord = testVerifiedTestedTestsRecordList.isNotEmpty ? testVerifiedTestedTestsRecordList.first : null;
                                                                                                                                                return Container(
                                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                                    shape: BoxShape.circle,
                                                                                                                                                  ),
                                                                                                                                                  child: Visibility(
                                                                                                                                                    visible: testVerifiedTestedTestsRecord.isVerified ?? true,
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.check_circle_outlined,
                                                                                                                                                        color: Color(0xFFF3F3F3),
                                                                                                                                                        size: 22,
                                                                                                                                                      ),
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
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
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
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(16),
                                                                                              bottomRight: Radius.circular(16),
                                                                                              topLeft: Radius.circular(0),
                                                                                              topRight: Radius.circular(0),
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
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
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              shape: BoxShape.circle,
                                                                                                            ),
                                                                                                            child: FaIcon(
                                                                                                              FontAwesomeIcons.flask,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                              size: 14,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 20,
                                                                                                          height: 20,
                                                                                                          decoration: BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                                                child: Text(
                                                                                                                  bookingsItem.testsIncluded.length.toString().maybeHandleOverflow(maxChars: 2),
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  style: TextStyle(
                                                                                                                    color: Colors.white,
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
                                                                                                  width: 110,
                                                                                                  height: 32,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxHeight: 32,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0x4CFFFFFF),
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
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
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
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                                          child: Text(
                                                                                                            'Confirmed',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                        queryBuilder: (bookingsRecord) =>
                                            bookingsRecord.where(
                                                'booking_confirmed',
                                                isNotEqualTo: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitDoubleBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<BookingsRecord>
                                            unconfirmedBookingsBookingsRecordList =
                                            snapshot.data;
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 20),
                                            child: Builder(
                                              builder: (context) {
                                                final unconfirmedbookings =
                                                    unconfirmedBookingsBookingsRecordList
                                                            ?.toList() ??
                                                        [];
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        unconfirmedbookings
                                                            .length,
                                                        (unconfirmedbookingsIndex) {
                                                      final unconfirmedbookingsItem =
                                                          unconfirmedbookings[
                                                              unconfirmedbookingsIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 15),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            BookingConfirmationWidget(
                                                                      bookingRef:
                                                                          unconfirmedbookingsItem
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
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.8,
                                                                  height: 210,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            6,
                                                                        color: Color(
                                                                            0x7258595B),
                                                                        spreadRadius:
                                                                            2,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.8,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15,
                                                                              5,
                                                                              10,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                          dateTimeFormat('MMMEd', unconfirmedbookingsItem.scheduledDate),
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
                                                                                          unconfirmedbookingsItem.bookingstatus,
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                                          '${unconfirmedbookingsItem.firstname}   ${unconfirmedbookingsItem.lastname}',
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            height: 100,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final testsOfUnconfirmedBooking = unconfirmedbookingsItem.testsIncluded?.toList() ?? [];
                                                                                                return ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: testsOfUnconfirmedBooking.length,
                                                                                                  itemBuilder: (context, testsOfUnconfirmedBookingIndex) {
                                                                                                    final testsOfUnconfirmedBookingItem = testsOfUnconfirmedBooking[testsOfUnconfirmedBookingIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 2),
                                                                                                      child: StreamBuilder<TestsRecord>(
                                                                                                        stream: TestsRecord.getDocument(testsOfUnconfirmedBookingItem),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
