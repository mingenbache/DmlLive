import '/backend/backend.dart';
import '/components/booking_update/booking_update_widget.dart';
import '/components/booking_view_widget_copy/booking_view_widget_copy_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/components/unconfirmed_booking_widget/unconfirmed_booking_widget_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.selectedDate = functions.getDayToday();
      });
    });

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
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .bookingViewWidgetCopyModels1
                                                                    .getModel(
                                                                  pastbookingsItem
                                                                      .reference
                                                                      .id,
                                                                  pastbookingsIndex,
                                                                ),
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    BookingViewWidgetCopyWidget(
                                                                  key: Key(
                                                                    'Key6dn_${pastbookingsItem.reference.id}',
                                                                  ),
                                                                  index:
                                                                      pastbookingsIndex,
                                                                  isExpanded:
                                                                      true,
                                                                  bookingRef:
                                                                      pastbookingsItem,
                                                                  expand:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.expandedBooking =
                                                                          pastbookingsItem
                                                                              .reference;
                                                                    });
                                                                  },
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
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0x95012030),
                                                          Color(0x8745A287),
                                                          Color(0x7E3D806B)
                                                        ],
                                                        stops: [0.0, 0.6, 0.8],
                                                        begin:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: FlutterFlowCalendar(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      weekFormat: true,
                                                      weekStartsMonday: true,
                                                      initialDate:
                                                          _model.selectedDate,
                                                      rowHeight: 50.0,
                                                      onChange: (DateTimeRange?
                                                          newSelectedDate) async {
                                                        _model.calendarSelectedDay =
                                                            newSelectedDate;
                                                        setState(() {
                                                          _model.selectedDate =
                                                              _model
                                                                  .calendarSelectedDay
                                                                  ?.start;
                                                        });
                                                        setState(() {});
                                                      },
                                                      titleStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                      dayOfWeekStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                      dateStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      selectedDateStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      inactiveDateStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                              functions
                                                                  .returntheDay(
                                                                      _model
                                                                          .selectedDate)),
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
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0x95012030),
                                                                    Color(
                                                                        0x8745A287),
                                                                    Color(
                                                                        0x7E3D806B)
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    0.6,
                                                                    0.8
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          1.0),
                                                                ),
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
                                                  queryBuilder: (bookingsRecord) =>
                                                      bookingsRecord
                                                          .where(
                                                              'scheduled_date',
                                                              isGreaterThanOrEqualTo:
                                                                  functions
                                                                      .returntheDay(
                                                                          _model
                                                                              .selectedDate))
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
                                                                      .selectedDate)
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
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (_model.expandedBooking?.id ==
                                                                            bookingsItem.reference.id) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (bottomSheetContext) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                child: BookingUpdateWidget(
                                                                                  bookingRef: bookingsItem,
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            _model.expandedBooking =
                                                                                bookingsItem.reference;
                                                                          });
                                                                        }
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .bookingViewWidgetCopyModels2
                                                                            .getModel(
                                                                          bookingsItem
                                                                              .reference
                                                                              .id,
                                                                          bookingsIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            BookingViewWidgetCopyWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keyg6q_${bookingsItem.reference.id}',
                                                                          ),
                                                                          index:
                                                                              bookingsIndex,
                                                                          bookingRef:
                                                                              bookingsItem,
                                                                          isExpanded:
                                                                              _model.expandedBooking?.id == bookingsItem.reference.id,
                                                                          expand:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.expandedBooking = bookingsItem.reference;
                                                                            });
                                                                          },
                                                                        ),
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
