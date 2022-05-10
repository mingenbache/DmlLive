import '../backend/backend.dart';
import '../components/payment_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentsListWidget extends StatefulWidget {
  const PaymentsListWidget({Key key}) : super(key: key);

  @override
  _PaymentsListWidgetState createState() => _PaymentsListWidgetState();
}

class _PaymentsListWidgetState extends State<PaymentsListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                                          'PAYMENTS',
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Color(0xFF586B06),
                            labelStyle: FlutterFlowTheme.of(context).subtitle2,
                            indicatorColor: Color(0xFF586B06),
                            tabs: [
                              Tab(
                                text: 'Unconfirmed',
                              ),
                              Tab(
                                text: 'Confirmed ',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: StreamBuilder<List<PaymentsRecord>>(
                                    stream: queryPaymentsRecord(
                                      queryBuilder: (paymentsRecord) =>
                                          paymentsRecord.where('is_approved',
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
                                      List<PaymentsRecord>
                                          columnPaymentsRecordList =
                                          snapshot.data;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnPaymentsRecordList.length,
                                            (columnIndex) {
                                          final columnPaymentsRecord =
                                              columnPaymentsRecordList[
                                                  columnIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: InkWell(
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Color(0x00FFFFFF),
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: PaymentWidget(
                                                        paymentRef:
                                                            columnPaymentsRecord,
                                                      ),
                                                    );
                                                  },
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFECECEC),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 6,
                                                        color:
                                                            Color(0x7258595B),
                                                        spreadRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 6, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 1,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 120,
                                                                  height: 65,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            functions.dateMonth(columnPaymentsRecord.createdDate),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            functions.dateDay(columnPaymentsRecord.createdDate),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  fontSize: 22,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            functions.dateYear(columnPaymentsRecord.createdDate),
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
                                                      Container(
                                                        width: 260,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      10, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
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
                                                                            formatNumber(
                                                                              columnPaymentsRecord.amount,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.periodDecimal,
                                                                              currency: 'Ksh ',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7,
                                                                              3,
                                                                              8,
                                                                              3),
                                                                          child:
                                                                              Text(
                                                                            columnPaymentsRecord.type,
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Lexend Deca',
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
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.82,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.12,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7,
                                                                              3,
                                                                              8,
                                                                              3),
                                                                          child:
                                                                              Text(
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
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.55,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7,
                                                                              3,
                                                                              8,
                                                                              3),
                                                                          child:
                                                                              Text(
                                                                            columnPaymentsRecord.transactionCode,
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
                                                              StreamBuilder<
                                                                  BookingsRecord>(
                                                                stream: BookingsRecord
                                                                    .getDocument(
                                                                        columnPaymentsRecord
                                                                            .bookingRef),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              50,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final columnBookingsRecord =
                                                                      snapshot
                                                                          .data;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.82,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.28,
                                                                                height: 100,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 9, 5, 5),
                                                                                  child: Text(
                                                                                    'Paid By Name',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.54,
                                                                                height: 100,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                  child: Text(
                                                                                    '${columnPaymentsRecord.firstName}   ${columnPaymentsRecord.lastName}',
                                                                                    textAlign: TextAlign.start,
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
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.82,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.28,
                                                                                height: 100,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 9, 5, 5),
                                                                                  child: Text(
                                                                                    'Booking Name',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.5,
                                                                                height: 100,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                  child: Text(
                                                                                    '${columnBookingsRecord.firstname}    ${columnBookingsRecord.lastname}',
                                                                                    textAlign: TextAlign.start,
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
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            1,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 8, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .chevron_right_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                size: 24,
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
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: StreamBuilder<List<PaymentsRecord>>(
                                    stream: queryPaymentsRecord(
                                      queryBuilder: (paymentsRecord) =>
                                          paymentsRecord.where('is_approved',
                                              isEqualTo: true),
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
                                      List<PaymentsRecord>
                                          columnPaymentsRecordList =
                                          snapshot.data;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnPaymentsRecordList.length,
                                            (columnIndex) {
                                          final columnPaymentsRecord =
                                              columnPaymentsRecordList[
                                                  columnIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
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
                                                    0.9,
                                                height: 160,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFECECEC),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 6,
                                                      color: Color(0x7258595B),
                                                      spreadRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 6, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Container(
                                                                width: 120,
                                                                height: 65,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          'OCT',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          '21',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                fontSize: 22,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          '2021',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                    Container(
                                                      width: 260,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
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
                                                                          formatNumber(
                                                                            columnPaymentsRecord.amount,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.periodDecimal,
                                                                            currency:
                                                                                'Ksh ',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            7,
                                                                            3,
                                                                            8,
                                                                            3),
                                                                        child:
                                                                            Text(
                                                                          columnPaymentsRecord
                                                                              .type,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
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
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.82,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.12,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            7,
                                                                            3,
                                                                            8,
                                                                            3),
                                                                        child:
                                                                            Text(
                                                                          'REF',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.55,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            7,
                                                                            3,
                                                                            8,
                                                                            3),
                                                                        child:
                                                                            Text(
                                                                          columnPaymentsRecord
                                                                              .transactionCode,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
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
                                                            StreamBuilder<
                                                                BookingsRecord>(
                                                              stream: BookingsRecord
                                                                  .getDocument(
                                                                      columnPaymentsRecord
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
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            50,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final columnBookingsRecord =
                                                                    snapshot
                                                                        .data;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.82,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.04,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.28,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7, 9, 5, 5),
                                                                                child: Text(
                                                                                  'Paid By Name',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.54,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                child: Text(
                                                                                  '${columnPaymentsRecord.firstName}   ${columnPaymentsRecord.lastName}',
                                                                                  textAlign: TextAlign.start,
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
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.82,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.04,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.28,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7, 9, 5, 5),
                                                                                child: Text(
                                                                                  'Booking Name',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.5,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                child: Text(
                                                                                  '${columnBookingsRecord.firstname}    ${columnBookingsRecord.lastname}',
                                                                                  textAlign: TextAlign.start,
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
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 8, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                              size: 24,
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
                                        }),
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
