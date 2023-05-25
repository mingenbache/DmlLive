import '/backend/backend.dart';
import '/components/booking_view_widget/booking_view_widget_widget.dart';
import '/components/booking_widget/booking_widget_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/components/unconfirmed_booking_widget/unconfirmed_booking_widget_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookings_schedule_model.dart';
export 'bookings_schedule_model.dart';

class BookingsScheduleWidget extends StatefulWidget {
  const BookingsScheduleWidget({Key? key}) : super(key: key);

  @override
  _BookingsScheduleWidgetState createState() => _BookingsScheduleWidgetState();
}

class _BookingsScheduleWidgetState extends State<BookingsScheduleWidget> {
  late BookingsScheduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingsScheduleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'BookingsSchedule',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 1.0,
                constraints: BoxConstraints(
                  maxWidth: 440.0,
                ),
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        'assets/images/martha-dominguez-de-gouveia-g0PTp89dumc-unsplash_reduced.jpg',
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xAF6CD7B7),
                            FlutterFlowTheme.of(context).secondaryBackground
                          ],
                          stops: [0.0, 0.4],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.topActionsModel,
                                    updateCallback: () => setState(() {}),
                                    child: TopActionsWidget(),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'BOOKINGS',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Colors
                                                                    .white,
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
                              initialIndex: min(
                                  valueOrDefault<int>(
                                    functions.returnBookingsTab(
                                        FFAppState().testsVar),
                                    0,
                                  ),
                                  2),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: Colors.white,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      indicatorWeight: 3.0,
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
                                                    .where('scheduled_date',
                                                        isLessThan: functions
                                                            .getDayToday())
                                                    .orderBy('scheduled_date',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BookingsRecord>
                                                pastBookingsBookingsRecordList =
                                                snapshot.data!;
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final pastbookings =
                                                        pastBookingsBookingsRecordList
                                                            .toList();
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
                                                            pastbookings.length,
                                                            (pastbookingsIndex) {
                                                          final pastbookingsItem =
                                                              pastbookings[
                                                                  pastbookingsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    BookingWidgetWidget(
                                                                  key: Key(
                                                                      'Key9ju_${pastbookingsIndex}_of_${pastbookings.length}'),
                                                                  index:
                                                                      pastbookingsIndex,
                                                                  booking:
                                                                      pastbookingsItem,
                                                                ),
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
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowCalendar(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        weekFormat: true,
                                                        weekStartsMonday: true,
                                                        initialDate: functions
                                                            .returntheDay(
                                                                getCurrentTimestamp),
                                                        rowHeight: 50.0,
                                                        onChange: (DateTimeRange?
                                                            newSelectedDate) {
                                                          setState(() => _model
                                                                  .uICalendarSelectedDay =
                                                              newSelectedDate);
                                                        },
                                                        titleStyle: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        dayOfWeekStyle:
                                                            TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        dateStyle: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        selectedDateStyle:
                                                            TextStyle(),
                                                        inactiveDateStyle:
                                                            TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                                  _model
                                                                      .uICalendarSelectedDay
                                                                      ?.start)),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                                'ScheduledTests');
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                                child: Text(
                                                                  'Test View',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            14.0,
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
                                              StreamBuilder<
                                                  List<BookingsRecord>>(
                                                stream: queryBookingsRecord(
                                                  queryBuilder: (bookingsRecord) => bookingsRecord
                                                      .where('scheduled_date',
                                                          isGreaterThanOrEqualTo:
                                                              functions.returntheDay(
                                                                  _model
                                                                      .uICalendarSelectedDay
                                                                      ?.start))
                                                      .where(
                                                          'booking_confirmed',
                                                          isEqualTo: true)
                                                      .orderBy(
                                                          'scheduled_date'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<BookingsRecord>
                                                      calendarBookingsBookingsRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.6,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 350.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final bookings = functions
                                                              .filterDayBookings(
                                                                  calendarBookingsBookingsRecordList
                                                                      .toList(),
                                                                  _model
                                                                      .uICalendarSelectedDay
                                                                      ?.start)
                                                              .toList();
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: List.generate(
                                                                  bookings
                                                                      .length,
                                                                  (bookingsIndex) {
                                                                final bookingsItem =
                                                                    bookings[
                                                                        bookingsIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        205.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        BookingViewWidgetWidget(
                                                                      key: Key(
                                                                          'Keyvp0_${bookingsIndex}_of_${bookings.length}'),
                                                                      index:
                                                                          bookingsIndex,
                                                                      bookingRef:
                                                                          bookingsItem,
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
                                                bookingsRecord
                                                    .where('booking_confirmed',
                                                        isEqualTo: false)
                                                    .where('is_submitted',
                                                        isEqualTo: true)
                                                    .orderBy('created_date',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BookingsRecord>
                                                unconfirmedBookingsBookingsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              constraints: BoxConstraints(
                                                maxWidth: 350.0,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final unconfirmedBookings =
                                                        unconfirmedBookingsBookingsRecordList
                                                            .toList();
                                                    if (unconfirmedBookings
                                                        .isEmpty) {
                                                      return Image.network(
                                                        '',
                                                      );
                                                    }
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
                                                            unconfirmedBookings
                                                                .length,
                                                            (unconfirmedBookingsIndex) {
                                                          final unconfirmedBookingsItem =
                                                              unconfirmedBookings[
                                                                  unconfirmedBookingsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: Container(
                                                              height: 180.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 350.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  UnconfirmedBookingWidgetWidget(
                                                                key: Key(
                                                                    'Key213_${unconfirmedBookingsIndex}_of_${unconfirmedBookings.length}'),
                                                                index:
                                                                    unconfirmedBookingsIndex,
                                                                bookingRef:
                                                                    unconfirmedBookingsItem,
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
          ),
        ));
  }
}
