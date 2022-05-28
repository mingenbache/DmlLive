import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInvoiceListWidget extends StatefulWidget {
  const MyInvoiceListWidget({Key key}) : super(key: key);

  @override
  _MyInvoiceListWidgetState createState() => _MyInvoiceListWidgetState();
}

class _MyInvoiceListWidgetState extends State<MyInvoiceListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InvoicesRecord>>(
      stream: queryInvoicesRecord(
        queryBuilder: (invoicesRecord) =>
            invoicesRecord.where('user', isEqualTo: currentUserReference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<InvoicesRecord> myInvoiceListInvoicesRecordList = snapshot.data;
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
                                              'MY INVOICES',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFF586B06),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 0, 12),
                                    child: Text(
                                      'All Invoices',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 40,
                                    icon: Icon(
                                      Icons.sort_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Builder(
                    builder: (context) {
                      final userInvoices =
                          myInvoiceListInvoicesRecordList?.toList() ?? [];
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(userInvoices.length,
                              (userInvoicesIndex) {
                            final userInvoicesItem =
                                userInvoices[userInvoicesIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: StreamBuilder<InvoicesRecord>(
                                stream: InvoicesRecord.getDocument(
                                    userInvoicesItem.reference),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  final invoiceListItemInvoicesRecord =
                                      snapshot.data;
                                  return InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'Invoice',
                                        queryParams: {
                                          'invoiceRef': serializeParam(
                                              invoiceListItemInvoicesRecord
                                                  .reference,
                                              ParamType.DocumentReference),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StreamBuilder<List<PaymentsRecord>>(
                                          stream: queryPaymentsRecord(
                                            queryBuilder: (paymentsRecord) =>
                                                paymentsRecord.where(
                                                    'invoice_ref',
                                                    isEqualTo:
                                                        invoiceListItemInvoicesRecord
                                                            .reference),
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
                                            List<PaymentsRecord>
                                                containerPaymentsRecordList =
                                                snapshot.data;
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Invoice',
                                                  queryParams: {
                                                    'invoiceRef': serializeParam(
                                                        invoiceListItemInvoicesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference),
                                                  }.withoutNulls,
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
                                                                  height: 50,
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
                                                                            '21',
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
                                                                            'OCT',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7,
                                                                              4,
                                                                              4,
                                                                              4),
                                                                          child:
                                                                              Text(
                                                                            'Amount Due',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                              Colors.white,
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
                                                                              invoiceListItemInvoicesRecord.invoiceAmount,
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (!(invoiceListItemInvoicesRecord.isPaid) ??
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                              child: Text(
                                                                                'Not Paid',
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.white,
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          if (invoiceListItemInvoicesRecord.fullAmount ??
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                              child: Text(
                                                                                'Paid',
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.white,
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            9,
                                                                            9,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Payments',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                fontSize: 14,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              50,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final paymentOnInvoice = containerPaymentsRecordList?.toList() ?? [];
                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: paymentOnInvoice.length,
                                                                                itemBuilder: (context, paymentOnInvoiceIndex) {
                                                                                  final paymentOnInvoiceItem = paymentOnInvoice[paymentOnInvoiceIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 4),
                                                                                    child: Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 2,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.82,
                                                                                        height: MediaQuery.of(context).size.height * 0.04,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.15,
                                                                                              height: 100,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                                child: Text(
                                                                                                  dateTimeFormat('d/M/y', paymentOnInvoiceItem.createdDate),
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: Color(0xFF586B06),
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.3,
                                                                                              height: 100,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(7, 9, 5, 5),
                                                                                                child: Text(
                                                                                                  paymentOnInvoiceItem.transactionCode,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                borderRadius: BorderRadius.circular(0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9, 9, 5, 5),
                                                                                                child: Text(
                                                                                                  formatNumber(
                                                                                                    paymentOnInvoiceItem.amount,
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                    currency: 'Kshs',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: Colors.white,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.15,
                                                                                              height: 100,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                                child: Text(
                                                                                                  formatNumber(
                                                                                                    paymentOnInvoiceItem.amount,
                                                                                                    formatType: FormatType.decimal,
                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                  ),
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
                                            );
                                          },
                                        ),
                                      ],
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
              ),
            ],
          ),
        );
      },
    );
  }
}
