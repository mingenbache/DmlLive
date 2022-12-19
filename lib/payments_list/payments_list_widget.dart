import '../backend/backend.dart';
import '../components/date_widget_small_widget.dart';
import '../components/invoice_payment_widget.dart';
import '../components/payment_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PaymentsListWidget extends StatefulWidget {
  const PaymentsListWidget({Key? key}) : super(key: key);

  @override
  _PaymentsListWidgetState createState() => _PaymentsListWidgetState();
}

class _PaymentsListWidgetState extends State<PaymentsListWidget> {
  PagingController<DocumentSnapshot?, InvoicesRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/martha-dominguez-de-gouveia-g0PTp89dumc-unsplash_reduced.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.44,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xAF6CD7B7), Colors.white],
                    stops: [0, 0.4],
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'PAYMENTS',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.white,
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
                                length: 3,
                                initialIndex: 0,
                                child: Column(
                                  children: [
                                    TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 14,
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
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: StreamBuilder<
                                                List<PaymentsRecord>>(
                                              stream: queryPaymentsRecord(
                                                queryBuilder:
                                                    (paymentsRecord) =>
                                                        paymentsRecord.where(
                                                            'is_approved',
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
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
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Color(
                                                                        0x00FFFFFF),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
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
                                                            child: Container(
                                                              height: 210,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.95, 0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          340,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
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
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
                                                                                    child: Text(
                                                                                      formatNumber(
                                                                                        columnPaymentsRecord.amount!,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                        currency: 'Ksh ',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                    child: Text(
                                                                                      columnPaymentsRecord.type!,
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
                                                                              Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 3,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 65,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Text(
                                                                                            functions.dateMonth(columnPaymentsRecord.createdDate),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  fontSize: 12,
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
                                                                                                  fontSize: 22,
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
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.75,
                                                                            height:
                                                                                110,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                                                              child: StreamBuilder<BookingsRecord>(
                                                                                stream: BookingsRecord.getDocument(columnPaymentsRecord.bookingRef!),
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
                                                                                  final columnBookingsRecord = snapshot.data!;
                                                                                  return Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(16),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                child: Icon(
                                                                                                  Icons.person_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16,
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.27,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 80,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                                  child: Text(
                                                                                                    'REF',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                                  child: Text(
                                                                                                    columnPaymentsRecord.transactionCode!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(16),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                child: Icon(
                                                                                                  Icons.person_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16,
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.27,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 80,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                                  child: Text(
                                                                                                    'PAID BY',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(16),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                child: Icon(
                                                                                                  Icons.book,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16,
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.28,
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: 140,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                                  child: Text(
                                                                                                    'BOOKING',
                                                                                                    maxLines: 1,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 14,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  '${columnBookingsRecord.firstname}    ${columnBookingsRecord.lastname}',
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(16),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                FaIcon(
                                                                                                  FontAwesomeIcons.cashRegister,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 16,
                                                                                                ),
                                                                                                Container(
                                                                                                  width: MediaQuery.of(context).size.width * 0.195,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxWidth: 100,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                                    child: Text(
                                                                                                      'BALANCE',
                                                                                                      maxLines: 1,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                            fontFamily: 'Lexend Deca',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                            fontFamily: 'Lexend Deca',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: StreamBuilder<
                                                List<PaymentsRecord>>(
                                              stream: queryPaymentsRecord(
                                                queryBuilder:
                                                    (paymentsRecord) =>
                                                        paymentsRecord.where(
                                                            'is_approved',
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
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
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00FFFFFF),
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
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
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: 150,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 380,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.95, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          10),
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
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              6,
                                                                              0,
                                                                              6,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.fileInvoiceDollar,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 16,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 4, 4, 4),
                                                                                child: Text(
                                                                                  formatNumber(
                                                                                    columnPaymentsRecord.amount!,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                    currency: 'Ksh ',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                        fontFamily: 'Open Sans',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                child: Text(
                                                                                  columnPaymentsRecord.type!,
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
                                                                          DateWidgetSmallWidget(
                                                                            date:
                                                                                columnPaymentsRecord.createdDate,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child: StreamBuilder<
                                                                          BookingsRecord>(
                                                                        stream:
                                                                            BookingsRecord.getDocument(columnPaymentsRecord.bookingRef!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final columnBookingsRecord =
                                                                              snapshot.data!;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                        child: Icon(
                                                                                          Icons.person_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16,
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.27,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 80,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                          child: Text(
                                                                                            'NAME',
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                          child: Text(
                                                                                            '${columnPaymentsRecord.firstName} ${columnPaymentsRecord.lastName}'.maybeHandleOverflow(
                                                                                              maxChars: 20,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                        child: Icon(
                                                                                          Icons.corporate_fare_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16,
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.25,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 100,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(7, 3, 0, 3),
                                                                                          child: Text(
                                                                                            'LABREF',
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(7, 3, 8, 3),
                                                                                          child: Text(
                                                                                            columnBookingsRecord.labRefNum!.maybeHandleOverflow(
                                                                                              maxChars: 20,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.cashRegister,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16,
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.23,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: 120,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7, 3, 0, 3),
                                                                                              child: Text(
                                                                                                'BALANCE',
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 3),
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
                                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
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
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                PagedListView<
                                                    DocumentSnapshot<Object?>?,
                                                    InvoicesRecord>(
                                                  pagingController: () {
                                                    final Query<Object?> Function(
                                                            Query<Object?>)
                                                        queryBuilder =
                                                        (invoicesRecord) =>
                                                            invoicesRecord.orderBy(
                                                                'created_date',
                                                                descending:
                                                                    true);
                                                    if (_pagingController !=
                                                        null) {
                                                      final query =
                                                          queryBuilder(
                                                              InvoicesRecord
                                                                  .collection);
                                                      if (query !=
                                                          _pagingQuery) {
                                                        // The query has changed
                                                        _pagingQuery = query;
                                                        _streamSubscriptions
                                                            .forEach((s) =>
                                                                s?.cancel());
                                                        _streamSubscriptions
                                                            .clear();
                                                        _pagingController!
                                                            .refresh();
                                                      }
                                                      return _pagingController!;
                                                    }

                                                    _pagingController =
                                                        PagingController(
                                                            firstPageKey: null);
                                                    _pagingQuery = queryBuilder(
                                                        InvoicesRecord
                                                            .collection);
                                                    _pagingController!
                                                        .addPageRequestListener(
                                                            (nextPageMarker) {
                                                      queryInvoicesRecordPage(
                                                        queryBuilder:
                                                            (invoicesRecord) =>
                                                                invoicesRecord.orderBy(
                                                                    'created_date',
                                                                    descending:
                                                                        true),
                                                        nextPageMarker:
                                                            nextPageMarker,
                                                        pageSize: 10,
                                                        isStream: true,
                                                      ).then((page) {
                                                        _pagingController!
                                                            .appendPage(
                                                          page.data,
                                                          page.nextPageMarker,
                                                        );
                                                        final streamSubscription =
                                                            page.dataStream
                                                                ?.listen(
                                                                    (data) {
                                                          final itemIndexes =
                                                              _pagingController!
                                                                  .itemList!
                                                                  .asMap()
                                                                  .map((k, v) =>
                                                                      MapEntry(
                                                                          v.reference
                                                                              .id,
                                                                          k));
                                                          data.forEach((item) {
                                                            final index =
                                                                itemIndexes[item
                                                                    .reference
                                                                    .id];
                                                            final items =
                                                                _pagingController!
                                                                    .itemList!;
                                                            if (index != null) {
                                                              items
                                                                  .replaceRange(
                                                                      index,
                                                                      index + 1,
                                                                      [item]);
                                                              _pagingController!
                                                                  .itemList = {
                                                                for (var item
                                                                    in items)
                                                                  item.reference:
                                                                      item
                                                              }.values.toList();
                                                            }
                                                          });
                                                          setState(() {});
                                                        });
                                                        _streamSubscriptions.add(
                                                            streamSubscription);
                                                      });
                                                    });
                                                    return _pagingController!;
                                                  }(),
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  builderDelegate:
                                                      PagedChildBuilderDelegate<
                                                          InvoicesRecord>(
                                                    // Customize what your widget looks like when it's loading the first page.
                                                    firstPageProgressIndicatorBuilder:
                                                        (_) => Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    ),

                                                    itemBuilder: (context, _,
                                                        listViewIndex) {
                                                      final listViewInvoicesRecord =
                                                          _pagingController!
                                                                  .itemList![
                                                              listViewIndex];
                                                      return Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        height: 230,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 20),
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
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 50,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final invoicePaymentBookingsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InvoicePaymentWidget(
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
    );
  }
}
