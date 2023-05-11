import '/backend/backend.dart';
import '/components/invoice_view_container/invoice_view_container_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invoice_list_model.dart';
export 'invoice_list_model.dart';

class InvoiceListWidget extends StatefulWidget {
  const InvoiceListWidget({Key? key}) : super(key: key);

  @override
  _InvoiceListWidgetState createState() => _InvoiceListWidgetState();
}

class _InvoiceListWidgetState extends State<InvoiceListWidget> {
  late InvoiceListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvoiceListModel());

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
        title: 'InvoiceList',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          body: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 440.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x8B6CD7B7),
                          Colors.white,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: [0.0, 0.4, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
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
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: [0.0, 0.4, 1.0],
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'INVOICES',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                              maxWidth: 340.0,
                            ),
                            decoration: BoxDecoration(),
                            child: DefaultTabController(
                              length: 3,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
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
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<InvoicesRecord>>(
                                              stream: queryInvoicesRecord(
                                                queryBuilder:
                                                    (invoicesRecord) =>
                                                        invoicesRecord.where(
                                                            'is_paid',
                                                            isNotEqualTo: true),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<InvoicesRecord>
                                                    overdueInvoicesInvoicesRecordList =
                                                    snapshot.data!;
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
                                                        overdueInvoicesInvoicesRecordList
                                                            .length,
                                                        (overdueInvoicesIndex) {
                                                      final overdueInvoicesInvoicesRecord =
                                                          overdueInvoicesInvoicesRecordList[
                                                              overdueInvoicesIndex];
                                                      return InvoiceViewContainerWidget(
                                                        key: Key(
                                                            'Keywfh_${overdueInvoicesIndex}_of_${overdueInvoicesInvoicesRecordList.length}'),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<InvoicesRecord>>(
                                              stream: queryInvoicesRecord(
                                                queryBuilder:
                                                    (invoicesRecord) =>
                                                        invoicesRecord.where(
                                                            'is_paid',
                                                            isNotEqualTo: true),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<InvoicesRecord>
                                                    mainContentInvoicesRecordList =
                                                    snapshot.data!;
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 6.0, 6.0, 6.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: FlutterFlowCalendar(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    weekFormat: true,
                                                    weekStartsMonday: true,
                                                    initialDate:
                                                        functions.returntheDay(
                                                            getCurrentTimestamp),
                                                    onChange: (DateTimeRange?
                                                        newSelectedDate) {
                                                      setState(() => _model
                                                              .uICalendarSelectedDay =
                                                          newSelectedDate);
                                                    },
                                                    titleStyle: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    dayOfWeekStyle: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    dateStyle: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    selectedDateStyle:
                                                        TextStyle(),
                                                    inactiveDateStyle:
                                                        TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<InvoicesRecord>>(
                                                  stream: queryInvoicesRecord(
                                                    queryBuilder:
                                                        (invoicesRecord) =>
                                                            invoicesRecord.where(
                                                                'is_paid',
                                                                isNotEqualTo:
                                                                    true),
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
                                                    List<InvoicesRecord>
                                                        mainContentInvoicesRecordList =
                                                        snapshot.data!;
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
                                                            mainContentInvoicesRecordList
                                                                .length,
                                                            (mainContentIndex) {
                                                          final mainContentInvoicesRecord =
                                                              mainContentInvoicesRecordList[
                                                                  mainContentIndex];
                                                          return Container(
                                                              width: 100,
                                                              height: 100,
                                                              color:
                                                                  Colors.green);
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
            ),
          ),
        ));
  }
}
