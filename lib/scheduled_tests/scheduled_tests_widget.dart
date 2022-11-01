import '../backend/backend.dart';
import '../components/test_item_widget_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduledTestsWidget extends StatefulWidget {
  const ScheduledTestsWidget({Key? key}) : super(key: key);

  @override
  _ScheduledTestsWidgetState createState() => _ScheduledTestsWidgetState();
}

class _ScheduledTestsWidgetState extends State<ScheduledTestsWidget> {
  DateTimeRange? uICalendarSelectedDay;
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          context.pushNamed('TestConsole');
        },
        backgroundColor: FlutterFlowTheme.of(context).secondaryText,
        icon: Icon(
          Icons.dashboard_rounded,
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        elevation: 8,
        label: Text(
          'Test Console',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                constraints: BoxConstraints(
                  maxHeight: 320,
                ),
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xB06CD7B7),
                      Color(0xFFF9F9F9),
                      FlutterFlowTheme.of(context).primaryText
                    ],
                    stops: [0, 0.4, 0.7],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
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
                                'SCHEDULED TESTS',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<BookedTestsRecord>>(
                        stream: queryBookedTestsRecord(
                          queryBuilder: (bookedTestsRecord) => bookedTestsRecord
                              .where('scheduled_date',
                                  isGreaterThanOrEqualTo:
                                      functions.returntheDay(
                                          uICalendarSelectedDay?.start))
                              .orderBy('scheduled_date'),
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<BookedTestsRecord>
                              calendarScheduleContainerBookedTestsRecordList =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 6, 6, 6),
                                        child: FlutterFlowCalendar(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          weekFormat: true,
                                          weekStartsMonday: true,
                                          initialDate: functions.returntheDay(
                                              getCurrentTimestamp),
                                          onChange:
                                              (DateTimeRange? newSelectedDate) {
                                            setState(() =>
                                                uICalendarSelectedDay =
                                                    newSelectedDate);
                                          },
                                          titleStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          dayOfWeekStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          dateStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          selectedDateStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          inactiveDateStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
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
                                              functions.returnDateString(
                                                  uICalendarSelectedDay?.start),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ),
                                            Text(
                                              '${functions.getDayTestsnumber(calendarScheduleContainerBookedTestsRecordList.toList(), uICalendarSelectedDay?.start).toString()} Tests',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                    'BookingsSchedule');
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 5, 10, 5),
                                                    child: Text(
                                                      'Booking View',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      constraints: BoxConstraints(
                                        maxWidth: 550,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final bookedTests = functions
                                              .filterDayTests(
                                                  calendarScheduleContainerBookedTestsRecordList
                                                      .toList(),
                                                  uICalendarSelectedDay?.start)
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: bookedTests.length,
                                            itemBuilder:
                                                (context, bookedTestsIndex) {
                                              final bookedTestsItem =
                                                  bookedTests[bookedTestsIndex];
                                              return TestItemWidgetWidget(
                                                key: Key(
                                                    'TestItemWidget_${bookedTestsIndex}'),
                                                index: bookedTestsIndex,
                                                bookedTest: bookedTestsItem,
                                              );
                                            },
                                          );
                                        },
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
