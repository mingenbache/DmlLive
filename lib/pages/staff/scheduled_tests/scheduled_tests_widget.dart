import '/backend/backend.dart';
import '/components/test_item_widget/test_item_widget_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scheduled_tests_model.dart';
export 'scheduled_tests_model.dart';

class ScheduledTestsWidget extends StatefulWidget {
  const ScheduledTestsWidget({Key? key}) : super(key: key);

  @override
  _ScheduledTestsWidgetState createState() => _ScheduledTestsWidgetState();
}

class _ScheduledTestsWidgetState extends State<ScheduledTestsWidget> {
  late ScheduledTestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduledTestsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
        elevation: 8.0,
        label: Text(
          'Test Console',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Open Sans',
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
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.45,
                constraints: BoxConstraints(
                  maxHeight: 320.0,
                ),
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.45,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xB06CD7B7), Color(0xFFF9F9F9)],
                    stops: [0.0, 0.4],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.topActionsModel,
                              updateCallback: () => setState(() {}),
                              child: TopActionsWidget(),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(),
                              child: Text(
                                'SCHEDULED TESTS',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Open Sans',
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
                                          _model.uICalendarSelectedDay?.start))
                              .orderBy('scheduled_date'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitRipple(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<BookedTestsRecord>
                              calendarScheduleContainerBookedTestsRecordList =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 6.0, 6.0, 6.0),
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
                                                _model.uICalendarSelectedDay =
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
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              functions.returnDateString(_model
                                                  .uICalendarSelectedDay
                                                  ?.start),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                            Text(
                                              '${functions.getDayTestsnumber(calendarScheduleContainerBookedTestsRecordList.toList(), _model.uICalendarSelectedDay?.start).toString()} Tests',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                10.0, 5.0),
                                                    child: Text(
                                                      'Booking View',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
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
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      constraints: BoxConstraints(
                                        maxWidth: 550.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final bookedTests = functions
                                              .filterDayTests(
                                                  calendarScheduleContainerBookedTestsRecordList
                                                      .toList(),
                                                  _model.uICalendarSelectedDay
                                                      ?.start)
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
                                                    'Keyjr0_${bookedTestsIndex}_of_${bookedTests.length}'),
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
