import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_payment_w_idget/add_payment_w_idget_widget.dart';
import '/components/invoice_payment/invoice_payment_widget.dart';
import '/components/payment/payment_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'my_payments_model.dart';
export 'my_payments_model.dart';

class MyPaymentsWidget extends StatefulWidget {
  const MyPaymentsWidget({Key? key}) : super(key: key);

  @override
  _MyPaymentsWidgetState createState() => _MyPaymentsWidgetState();
}

class _MyPaymentsWidgetState extends State<MyPaymentsWidget> {
  late MyPaymentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPaymentsModel());

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
        title: 'myPayments',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0x00000000),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: AddPaymentWIdgetWidget(),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).secondaryText,
            icon: Icon(
              Icons.payments_sharp,
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            elevation: 8.0,
            label: Text(
              'Add Payment',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(),
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
                          Color(0x8B6CD7B7),
                          Color(0xFFF6F6F6),
                          FlutterFlowTheme.of(context).secondaryColor
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
                                                        'MY PAYMENTS',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: DefaultTabController(
                                    length: 3,
                                    initialIndex: 0,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          indicatorColor: Colors.white,
                                          tabs: [
                                            Tab(
                                              text: 'Unconfirmed',
                                            ),
                                            Tab(
                                              text: 'Confirmed ',
                                            ),
                                            Tab(
                                              text: 'Invoices',
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<PaymentsRecord>>(
                                                  stream: queryPaymentsRecord(
                                                    queryBuilder: (paymentsRecord) =>
                                                        paymentsRecord
                                                            .where(
                                                                'is_approved',
                                                                isNotEqualTo:
                                                                    true)
                                                            .where('user_ref',
                                                                isEqualTo:
                                                                    currentUserReference),
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
                                                                .primaryColor,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<PaymentsRecord>
                                                        columnPaymentsRecordList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnPaymentsRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnPaymentsRecord =
                                                            columnPaymentsRecordList[
                                                                columnIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            PaymentWidget(
                                                                          paymentRef:
                                                                              columnPaymentsRecord,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.8,
                                                                  height: 180.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        340.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.95,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnPaymentsRecord.amount!,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: 'Ksh ',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: Colors.white,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                  child: Text(
                                                                                    columnPaymentsRecord.type!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Colors.white,
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 3.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: 65.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          functions.dateMonth(columnPaymentsRecord.createdDate),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Open Sans',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontSize: 12.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          functions.dateDay(columnPaymentsRecord.createdDate),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Open Sans',
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                fontSize: 22.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Text(
                                                                                          functions.dateYear(columnPaymentsRecord.createdDate),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Open Sans',
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                fontSize: 12.0,
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
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.75,
                                                                        height:
                                                                            90.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<BookingsRecord>(
                                                                            stream:
                                                                                BookingsRecord.getDocument(columnPaymentsRecord.bookingRef!),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: SpinKitRipple(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final columnBookingsRecord = snapshot.data!;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x87FFFFFF),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.27,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: 80.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                              child: Text(
                                                                                                'REF',
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                              child: Text(
                                                                                                columnPaymentsRecord.transactionCode!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x86FFFFFF),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.37,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: 140.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                              child: Text(
                                                                                                'PAID BY',
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Text(
                                                                                              '${columnPaymentsRecord.firstName}   ${columnPaymentsRecord.lastName}',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Open Sans',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x87FFFFFF),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.37,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: 140.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                              child: Text(
                                                                                                'BOOKING NAME',
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            child: Text(
                                                                                              '${columnPaymentsRecord.firstName}   ${columnPaymentsRecord.lastName}',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Open Sans',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w500,
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
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<PaymentsRecord>>(
                                                  stream: queryPaymentsRecord(
                                                    queryBuilder: (paymentsRecord) =>
                                                        paymentsRecord
                                                            .where(
                                                                'is_approved',
                                                                isEqualTo: true)
                                                            .where('user_ref',
                                                                isEqualTo:
                                                                    currentUserReference),
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
                                                                .primaryColor,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<PaymentsRecord>
                                                        columnPaymentsRecordList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnPaymentsRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnPaymentsRecord =
                                                            columnPaymentsRecordList[
                                                                columnIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            PaymentWidget(
                                                                          paymentRef:
                                                                              columnPaymentsRecord,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.8,
                                                                  height: 140.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        380.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.95,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              6.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 3.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 120.0,
                                                                                  height: 65.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            functions.dateMonth(columnPaymentsRecord.createdDate),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            functions.dateDay(columnPaymentsRecord.createdDate),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontSize: 22.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            functions.dateYear(columnPaymentsRecord.createdDate),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontSize: 12.0,
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
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              260.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                          child: Text(
                                                                                            formatNumber(
                                                                                              columnPaymentsRecord.amount!,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.periodDecimal,
                                                                                              currency: 'Ksh ',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: Colors.white,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                          child: Text(
                                                                                            columnPaymentsRecord.type!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                    child: StreamBuilder<BookingsRecord>(
                                                                                      stream: BookingsRecord.getDocument(columnPaymentsRecord.bookingRef!),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: SizedBox(
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              child: SpinKitRipple(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                size: 50.0,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        final columnBookingsRecord = snapshot.data!;
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.12,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'REF',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                fontSize: 14.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 0.0),
                                                                                                        child: Text(
                                                                                                          columnPaymentsRecord.transactionCode!,
                                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 14.0,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.82,
                                                                                                height: MediaQuery.of(context).size.height * 0.03,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.28,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(7.0, 9.0, 5.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Paid By Name',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Open Sans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.54,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 9.0, 5.0, 0.0),
                                                                                                        child: Text(
                                                                                                          '${columnPaymentsRecord.firstName}   ${columnPaymentsRecord.lastName}',
                                                                                                          textAlign: TextAlign.start,
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Open Sans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.82,
                                                                                                height: MediaQuery.of(context).size.height * 0.03,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.28,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(7.0, 9.0, 5.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Booking Name',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Open Sans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 9.0, 5.0, 0.0),
                                                                                                        child: Text(
                                                                                                          '${columnBookingsRecord.firstname}    ${columnBookingsRecord.lastname}',
                                                                                                          textAlign: TextAlign.start,
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Open Sans',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.chevron_right_rounded,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                size: 24.0,
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
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              'All Invoices',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    PagedListView<
                                                        DocumentSnapshot<
                                                            Object?>?,
                                                        InvoicesRecord>(
                                                      pagingController: () {
                                                        final Query<Object?> Function(
                                                                Query<Object?>)
                                                            queryBuilder =
                                                            (invoicesRecord) => invoicesRecord
                                                                .where(
                                                                    'userEmail',
                                                                    isEqualTo: currentUserEmail !=
                                                                            ''
                                                                        ? currentUserEmail
                                                                        : null)
                                                                .orderBy(
                                                                    'created_date');
                                                        if (_model
                                                                .pagingController !=
                                                            null) {
                                                          final query =
                                                              queryBuilder(
                                                                  InvoicesRecord
                                                                      .collection);
                                                          if (query !=
                                                              _model
                                                                  .pagingQuery) {
                                                            // The query has changed
                                                            _model.pagingQuery =
                                                                query;
                                                            _model
                                                                .streamSubscriptions
                                                                .forEach((s) =>
                                                                    s?.cancel());
                                                            _model
                                                                .streamSubscriptions
                                                                .clear();
                                                            _model
                                                                .pagingController!
                                                                .refresh();
                                                          }
                                                          return _model
                                                              .pagingController!;
                                                        }

                                                        _model.pagingController =
                                                            PagingController(
                                                                firstPageKey:
                                                                    null);
                                                        _model.pagingQuery =
                                                            queryBuilder(
                                                                InvoicesRecord
                                                                    .collection);
                                                        _model.pagingController!
                                                            .addPageRequestListener(
                                                                (nextPageMarker) {
                                                          queryInvoicesRecordPage(
                                                            queryBuilder: (invoicesRecord) => invoicesRecord
                                                                .where(
                                                                    'userEmail',
                                                                    isEqualTo: currentUserEmail !=
                                                                            ''
                                                                        ? currentUserEmail
                                                                        : null)
                                                                .orderBy(
                                                                    'created_date'),
                                                            nextPageMarker:
                                                                nextPageMarker,
                                                            pageSize: 10,
                                                            isStream: true,
                                                          ).then((page) {
                                                            _model
                                                                .pagingController!
                                                                .appendPage(
                                                              page.data,
                                                              page.nextPageMarker,
                                                            );
                                                            final streamSubscription =
                                                                page.dataStream
                                                                    ?.listen(
                                                                        (data) {
                                                              data.forEach(
                                                                  (item) {
                                                                final itemIndexes = _model
                                                                    .pagingController!
                                                                    .itemList!
                                                                    .asMap()
                                                                    .map((k,
                                                                            v) =>
                                                                        MapEntry(
                                                                            v.reference.id,
                                                                            k));
                                                                final index =
                                                                    itemIndexes[item
                                                                        .reference
                                                                        .id];
                                                                final items = _model
                                                                    .pagingController!
                                                                    .itemList!;
                                                                if (index !=
                                                                    null) {
                                                                  items.replaceRange(
                                                                      index,
                                                                      index + 1,
                                                                      [item]);
                                                                  _model
                                                                      .pagingController!
                                                                      .itemList = {
                                                                    for (var item
                                                                        in items)
                                                                      item.reference:
                                                                          item
                                                                  }
                                                                      .values
                                                                      .toList();
                                                                }
                                                              });
                                                              setState(() {});
                                                            });
                                                            _model
                                                                .streamSubscriptions
                                                                .add(
                                                                    streamSubscription);
                                                          });
                                                        });
                                                        return _model
                                                            .pagingController!;
                                                      }(),
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      reverse: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      builderDelegate:
                                                          PagedChildBuilderDelegate<
                                                              InvoicesRecord>(
                                                        // Customize what your widget looks like when it's loading the first page.
                                                        firstPageProgressIndicatorBuilder:
                                                            (_) => Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        ),

                                                        itemBuilder: (context,
                                                            _, listViewIndex) {
                                                          final listViewInvoicesRecord =
                                                              _model.pagingController!
                                                                      .itemList![
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                BookingsRecord>(
                                                              stream: BookingsRecord
                                                                  .getDocument(
                                                                      listViewInvoicesRecord
                                                                          .bookingRef!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final invoicePaymentBookingsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InvoicePaymentWidget(
                                                                  key: Key(
                                                                      'Keyilv_${listViewIndex}_of_${_model.pagingController!.itemList!.length}'),
                                                                  invoice:
                                                                      listViewInvoicesRecord
                                                                          .reference,
                                                                  booking:
                                                                      invoicePaymentBookingsRecord,
                                                                );
                                                              },
                                                            ),
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
