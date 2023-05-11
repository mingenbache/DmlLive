import '/backend/backend.dart';
import '/components/date_widget_small/date_widget_small_widget.dart';
import '/components/invoice_payment/invoice_payment_widget.dart';
import '/components/payment/payment_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'payments_list_model.dart';
export 'payments_list_model.dart';

class PaymentsListWidget extends StatefulWidget {
  const PaymentsListWidget({Key? key}) : super(key: key);

  @override
  _PaymentsListWidgetState createState() => _PaymentsListWidgetState();
}

class _PaymentsListWidgetState extends State<PaymentsListWidget> {
  late PaymentsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentsListModel());

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
        title: 'PaymentsList',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          body: SafeArea(
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
                          colors: [Color(0xAF6CD7B7), Colors.white],
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
                                                          'PAYMENTS',
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
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
                                    decoration: BoxDecoration(),
                                    child: DefaultTabController(
                                      length: 3,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 14.0,
                                                      ),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                                      queryBuilder:
                                                          (paymentsRecord) =>
                                                              paymentsRecord.where(
                                                                  'is_approved',
                                                                  isNotEqualTo:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
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
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
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
                                                                          (bottomSheetContext) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(bottomSheetContext).viewInsets,
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
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height:
                                                                        170.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          340.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.95,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.fileInvoiceDollar,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Padding(
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
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: 'Open Sans',
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Padding(
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
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Lexend Deca',
                                                                                                color: Colors.white,
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DateWidgetSmallWidget(
                                                                                  key: Key('Keydxx_${columnIndex}_of_${columnPaymentsRecordList.length}'),
                                                                                  date: columnPaymentsRecord.createdDate,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 0.75,
                                                                              height: 110.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
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
                                                                                          color: FlutterFlowTheme.of(context).primary,
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
                                                                                            color: Color(0x88FFFFFF),
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.person_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              ),
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
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                                            color: Color(0x87FFFFFF),
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.person_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.27,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 90.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                                  child: Text(
                                                                                                    'PAID BY',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    '${columnPaymentsRecord.firstName}   ${columnPaymentsRecord.lastName}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Open Sans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                            color: Color(0x88FFFFFF),
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.book,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 13.0,
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.28,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 90.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 8.0, 3.0),
                                                                                                  child: Text(
                                                                                                    'BOOKING',
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    '${columnBookingsRecord.firstname}    ${columnBookingsRecord.lastname}',
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Open Sans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.cashRegister,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                                Container(
                                                                                                  width: MediaQuery.of(context).size.width * 0.195,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxWidth: 100.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 0.0, 3.0),
                                                                                                    child: Text(
                                                                                                      'BALANCE',
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: 'Lexend Deca',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                                      formatNumber(
                                                                                                        columnBookingsRecord.paymentBalance!,
                                                                                                        formatType: FormatType.decimal,
                                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                                        currency: 'Ksh ',
                                                                                                      ).maybeHandleOverflow(
                                                                                                        maxChars: 20,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                            ),
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
                                                      queryBuilder:
                                                          (paymentsRecord) =>
                                                              paymentsRecord.where(
                                                                  'is_approved',
                                                                  isEqualTo:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
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
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00FFFFFF),
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (bottomSheetContext) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(bottomSheetContext).viewInsets,
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
                                                                  height: 150.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        380.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.95,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.fileInvoiceDollar,
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 4.0, 4.0),
                                                                                      child: Text(
                                                                                        formatNumber(
                                                                                          columnPaymentsRecord.amount!,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.periodDecimal,
                                                                                          currency: 'Ksh ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Open Sans',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: Colors.white,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                DateWidgetSmallWidget(
                                                                                  key: Key('Key3yx_${columnIndex}_of_${columnPaymentsRecordList.length}'),
                                                                                  date: columnPaymentsRecord.createdDate,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              100.0,
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
                                                                              stream: BookingsRecord.getDocument(columnPaymentsRecord.bookingRef!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: SpinKitRipple(
                                                                                        color: FlutterFlowTheme.of(context).primary,
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                              child: Icon(
                                                                                                Icons.person_rounded,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                            ),
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
                                                                                                  'NAME',
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                                                  '${columnPaymentsRecord.firstName} ${columnPaymentsRecord.lastName}'.maybeHandleOverflow(
                                                                                                    maxChars: 20,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x87FFFFFF),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                              child: Icon(
                                                                                                Icons.corporate_fare_outlined,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.25,
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 100.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 0.0, 3.0),
                                                                                                child: Text(
                                                                                                  'LABREF',
                                                                                                  maxLines: 1,
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                                                  columnBookingsRecord.labRefNum!.maybeHandleOverflow(
                                                                                                    maxChars: 20,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.cashRegister,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.23,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 120.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 0.0, 3.0),
                                                                                                  child: Text(
                                                                                                    'BALANCE',
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 8.0, 3.0),
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      columnBookingsRecord.paymentBalance!,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                                      currency: 'Ksh ',
                                                                                                    ).maybeHandleOverflow(
                                                                                                      maxChars: 20,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
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
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Container(
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Colors
                                                                          .white,
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
                                                                  Query<
                                                                      Object?>)
                                                              queryBuilder =
                                                              (invoicesRecord) =>
                                                                  invoicesRecord.orderBy(
                                                                      'created_date',
                                                                      descending:
                                                                          true);
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
                                                          _model
                                                              .pagingController!
                                                              .addPageRequestListener(
                                                                  (nextPageMarker) {
                                                            queryInvoicesRecordPage(
                                                              queryBuilder: (invoicesRecord) =>
                                                                  invoicesRecord.orderBy(
                                                                      'created_date',
                                                                      descending:
                                                                          true),
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
                                                                  page
                                                                      .dataStream
                                                                      ?.listen(
                                                                          (data) {
                                                                data.forEach(
                                                                    (item) {
                                                                  final itemIndexes = _model
                                                                      .pagingController!
                                                                      .itemList!
                                                                      .asMap()
                                                                      .map((k, v) => MapEntry(
                                                                          v.reference
                                                                              .id,
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
                                                                        index +
                                                                            1,
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
                                                        padding:
                                                            EdgeInsets.zero,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          ),

                                                          itemBuilder: (context,
                                                              _,
                                                              listViewIndex) {
                                                            final listViewInvoicesRecord = _model
                                                                    .pagingController!
                                                                    .itemList![
                                                                listViewIndex];
                                                            return Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.8,
                                                              height: 230.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
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
                                                                          'Keyg36_${listViewIndex}_of_${_model.pagingController!.itemList!.length}'),
                                                                      invoice:
                                                                          listViewInvoicesRecord
                                                                              .reference,
                                                                      booking:
                                                                          invoicePaymentBookingsRecord,
                                                                    );
                                                                  },
                                                                ),
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
          ),
        ));
  }
}
