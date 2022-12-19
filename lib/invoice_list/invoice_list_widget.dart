import '../backend/backend.dart';
import '../components/invoice_view_container_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvoiceListWidget extends StatefulWidget {
  const InvoiceListWidget({Key? key}) : super(key: key);

  @override
  _InvoiceListWidgetState createState() => _InvoiceListWidgetState();
}

class _InvoiceListWidgetState extends State<InvoiceListWidget> {
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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x8B6CD7B7),
                  Colors.white,
                  FlutterFlowTheme.of(context).secondaryColor
                ],
                stops: [0, 0.4, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Image.asset(
                  'assets/images/martha-dominguez-de-gouveia-g0PTp89dumc-unsplash_reduced.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x8B6CD7B7),
                  Colors.white,
                  FlutterFlowTheme.of(context).secondaryColor
                ],
                stops: [0, 0.4, 1],
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'INVOICES',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    constraints: BoxConstraints(
                      maxWidth: 340,
                    ),
                    decoration: BoxDecoration(),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            indicatorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            tabs: [
                              Tab(
                                text: 'Overdue',
                              ),
                              Tab(
                                text: 'All ',
                              ),
                              Tab(
                                text: 'By Date',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: StreamBuilder<List<InvoicesRecord>>(
                                      stream: queryInvoicesRecord(
                                        queryBuilder: (invoicesRecord) =>
                                            invoicesRecord.where('is_paid',
                                                isNotEqualTo: true),
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
                                        List<InvoicesRecord>
                                            overdueInvoicesInvoicesRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: List.generate(
                                                overdueInvoicesInvoicesRecordList
                                                    .length,
                                                (overdueInvoicesIndex) {
                                              final overdueInvoicesInvoicesRecord =
                                                  overdueInvoicesInvoicesRecordList[
                                                      overdueInvoicesIndex];
                                              return InvoiceViewContainerWidget(
                                                key: Key(
                                                    'InvoiceViewContainer_${overdueInvoicesIndex}'),
                                                invoice:
                                                    overdueInvoicesInvoicesRecord,
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: StreamBuilder<List<InvoicesRecord>>(
                                      stream: queryInvoicesRecord(
                                        queryBuilder: (invoicesRecord) =>
                                            invoicesRecord.where('is_paid',
                                                isNotEqualTo: true),
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
                                        List<InvoicesRecord>
                                            mainContentInvoicesRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: List.generate(
                                                mainContentInvoicesRecordList
                                                    .length,
                                                (mainContentIndex) {
                                              final mainContentInvoicesRecord =
                                                  mainContentInvoicesRecordList[
                                                      mainContentIndex];
                                              return Container(
                                                  width: 100,
                                                  height: 100,
                                                  color: Colors.green);
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 6, 6, 6),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: FlutterFlowCalendar(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            weekFormat: true,
                                            weekStartsMonday: true,
                                            initialDate: functions.returntheDay(
                                                getCurrentTimestamp),
                                            onChange: (DateTimeRange?
                                                newSelectedDate) {
                                              setState(() =>
                                                  uICalendarSelectedDay =
                                                      newSelectedDate);
                                            },
                                            titleStyle: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            dayOfWeekStyle: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            dateStyle: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            selectedDateStyle: TextStyle(),
                                            inactiveDateStyle: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child:
                                            StreamBuilder<List<InvoicesRecord>>(
                                          stream: queryInvoicesRecord(
                                            queryBuilder: (invoicesRecord) =>
                                                invoicesRecord.where('is_paid',
                                                    isNotEqualTo: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<InvoicesRecord>
                                                mainContentInvoicesRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: List.generate(
                                                    mainContentInvoicesRecordList
                                                        .length,
                                                    (mainContentIndex) {
                                                  final mainContentInvoicesRecord =
                                                      mainContentInvoicesRecordList[
                                                          mainContentIndex];
                                                  return Container(
                                                      width: 100,
                                                      height: 100,
                                                      color: Colors.green);
                                                }),
                                              ),
                                            );
                                          },
                                        ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
