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
        title: 'ScheduledTests',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
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
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
            ),
          ),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'SCHEDULED TESTS',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
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
                                queryBuilder: (bookedTestsRecord) =>
                                    bookedTestsRecord
                                        .where('scheduled_date',
                                            isGreaterThanOrEqualTo:
                                                functions.returntheDay(
                                                    _model.selectedDate))
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<BookedTestsRecord>
                                    calendarScheduleContainerBookedTestsRecordList =
                                    snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0x95012030),
                                                  Color(0x8745A287),
                                                  Color(0x7E3D806B)
                                                ],
                                                stops: [0.0, 0.6, 0.8],
                                                begin: AlignmentDirectional(
                                                    1.0, -1.0),
                                                end: AlignmentDirectional(
                                                    -1.0, 1.0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: FlutterFlowCalendar(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              weekFormat: true,
                                              weekStartsMonday: true,
                                              initialDate: _model.selectedDate,
                                              rowHeight: 50.0,
                                              onChange: (DateTimeRange?
                                                  newSelectedDate) async {
                                                _model.calendarSelectedDay =
                                                    newSelectedDate;
                                                setState(() {
                                                  _model.selectedDate = _model
                                                      .calendarSelectedDay
                                                      ?.start;
                                                });
                                                setState(() {});
                                              },
                                              titleStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                              dayOfWeekStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                              dateStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              selectedDateStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                              inactiveDateStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    functions.returnDateString(
                                                        _model.selectedDate),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                  Text(
                                                    '${functions.getDayTestsnumber(calendarScheduleContainerBookedTestsRecordList.toList(), _model.selectedDate).toString()} Tests',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'BookingsSchedule');
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0x95012030),
                                                              Color(0x8745A287),
                                                              Color(0x7E3D806B)
                                                            ],
                                                            stops: [
                                                              0.0,
                                                              0.6,
                                                              0.8
                                                            ],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    -1.0, 1.0),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      10.0,
                                                                      5.0),
                                                          child: Text(
                                                            'Booking View',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      14.0,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.6,
                                            constraints: BoxConstraints(
                                              maxWidth: 340.0,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final bookedTests = functions
                                                    .filterDayTests(
                                                        calendarScheduleContainerBookedTestsRecordList
                                                            .toList(),
                                                        _model.selectedDate)
                                                    .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: bookedTests.length,
                                                  itemBuilder: (context,
                                                      bookedTestsIndex) {
                                                    final bookedTestsItem =
                                                        bookedTests[
                                                            bookedTestsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .testItemWidgetModels
                                                            .getModel(
                                                          bookedTestsItem
                                                              .reference.id,
                                                          bookedTestsIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            TestItemWidgetWidget(
                                                          key: Key(
                                                            'Keyjr0_${bookedTestsItem.reference.id}',
                                                          ),
                                                          index:
                                                              bookedTestsIndex,
                                                          bookedTest:
                                                              bookedTestsItem,
                                                        ),
                                                      ),
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
          ),
        ));
  }
}
