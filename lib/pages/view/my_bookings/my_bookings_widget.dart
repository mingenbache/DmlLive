import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/booking_update/booking_update_widget.dart';
import '/components/date_widget_small/date_widget_small_widget.dart';
import '/components/test_details_popup/test_details_popup_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/components/view_test_result/view_test_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_bookings_model.dart';
export 'my_bookings_model.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({Key? key}) : super(key: key);

  @override
  _MyBookingsWidgetState createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  late MyBookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyBookingsModel());

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
        title: 'MyBookings',
        color: FlutterFlowTheme.of(context).primary,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 1.0,
                constraints: BoxConstraints(
                  maxWidth: 440.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        'assets/images/francisco-venancio-M4Xloxsg0Gw-unsplash.jpg',
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.44,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xB16CD7B7),
                            Color(0xE6FFFFFF),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'MY BOOKINGS',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
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
                            child: DefaultTabController(
                              length: 3,
                              initialIndex: min(
                                  valueOrDefault<int>(
                                    functions.returnBookingsTab(
                                        FFAppState().testsVar),
                                    0,
                                  ),
                                  2),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      tabs: [
                                        Tab(
                                          text: 'Past\nBookings',
                                        ),
                                        Tab(
                                          text: 'Upcoming\nBookings',
                                        ),
                                        Tab(
                                          text: 'Inactive\nBookings',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        StreamBuilder<List<BookingsRecord>>(
                                          stream: queryBookingsRecord(
                                            queryBuilder: (bookingsRecord) =>
                                                bookingsRecord
                                                    .where('completed',
                                                        isEqualTo: true)
                                                    .where('user',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BookingsRecord>
                                                pastBookingsBookingsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final pastbookings =
                                                        pastBookingsBookingsRecordList
                                                            .toList();
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
                                                            pastbookings.length,
                                                            (pastbookingsIndex) {
                                                          final pastbookingsItem =
                                                              pastbookings[
                                                                  pastbookingsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
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
                                                                    if (pastbookingsItem
                                                                        .completed) {
                                                                      context
                                                                          .pushNamed(
                                                                        'LabReport',
                                                                        queryParams:
                                                                            {
                                                                          'bookingRef':
                                                                              serializeParam(
                                                                            pastbookingsItem.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      return;
                                                                    } else {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(bottomSheetContext).viewInsets,
                                                                            child:
                                                                                BookingUpdateWidget(
                                                                              bookingRef: pastbookingsItem,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      return;
                                                                    }
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            350.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                6.0,
                                                                            color:
                                                                                Color(0x7258595B),
                                                                            spreadRadius:
                                                                                2.0,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.8,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        DateWidgetSmallWidget(
                                                                                          key: Key('Key3lk_${pastbookingsIndex}_of_${pastbookings.length}'),
                                                                                          date: pastbookingsItem.scheduledDate,
                                                                                        ),
                                                                                        if (pastbookingsItem.labRefNum != '')
                                                                                          Text(
                                                                                            pastbookingsItem.labRefNum,
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: Colors.white,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  pastbookingsItem.bookingstatus,
                                                                                                  'inactive',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'Roboto',
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.of(context).size.width * 1.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        height: MediaQuery.of(context).size.height * 0.04,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0x33FFFFFF),
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            '${pastbookingsItem.firstname}   ${pastbookingsItem.lastname}',
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontSize: 16.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            SingleChildScrollView(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  StreamBuilder<List<TestedTestsRecord>>(
                                                                                                    stream: queryTestedTestsRecord(
                                                                                                      queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booking_ref', isEqualTo: pastbookingsItem.reference),
                                                                                                    ),
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
                                                                                                      List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data!;
                                                                                                      return Container(
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Builder(
                                                                                                          builder: (context) {
                                                                                                            final testsOfBooking = containerTestedTestsRecordList.toList();
                                                                                                            return ListView.builder(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              itemCount: testsOfBooking.length,
                                                                                                              itemBuilder: (context, testsOfBookingIndex) {
                                                                                                                final testsOfBookingItem = testsOfBooking[testsOfBookingIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      await showModalBottomSheet(
                                                                                                                        isScrollControlled: true,
                                                                                                                        backgroundColor: Colors.transparent,
                                                                                                                        barrierColor: Color(0x00000000),
                                                                                                                        context: context,
                                                                                                                        builder: (bottomSheetContext) {
                                                                                                                          return Padding(
                                                                                                                            padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                            child: ViewTestResultWidget(
                                                                                                                              testedTestRef: testsOfBookingItem.reference,
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ).then((value) => setState(() {}));
                                                                                                                    },
                                                                                                                    child: Material(
                                                                                                                      color: Colors.transparent,
                                                                                                                      elevation: 1.0,
                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                                                      ),
                                                                                                                      child: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 0.8,
                                                                                                                        height: 27.0,
                                                                                                                        constraints: BoxConstraints(
                                                                                                                          maxWidth: 290.0,
                                                                                                                        ),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              StreamBuilder<TestsRecord>(
                                                                                                                                stream: TestsRecord.getDocument(testsOfBookingItem.testRef!),
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
                                                                                                                                  final textTestsRecord = snapshot.data!;
                                                                                                                                  return Text(
                                                                                                                                    functions.upperCase(textTestsRecord.name).maybeHandleOverflow(
                                                                                                                                          maxChars: 15,
                                                                                                                                          replacement: '…',
                                                                                                                                        ),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Open Sans',
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                                        ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Material(
                                                                                                                                    color: Colors.transparent,
                                                                                                                                    elevation: 2.0,
                                                                                                                                    shape: RoundedRectangleBorder(
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                    ),
                                                                                                                                    child: Container(
                                                                                                                                      height: MediaQuery.of(context).size.height * 0.12,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        boxShadow: [
                                                                                                                                          BoxShadow(
                                                                                                                                            blurRadius: 0.6,
                                                                                                                                            color: Color(0x31000000),
                                                                                                                                            spreadRadius: 0.6,
                                                                                                                                          )
                                                                                                                                        ],
                                                                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                                        child: Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            Container(
                                                                                                                                              width: 25.0,
                                                                                                                                              height: 25.0,
                                                                                                                                              decoration: BoxDecoration(),
                                                                                                                                              child: Stack(
                                                                                                                                                children: [
                                                                                                                                                  Container(
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                      child: FaIcon(
                                                                                                                                                        FontAwesomeIcons.clock,
                                                                                                                                                        color: Color(0xFFF3F3F3),
                                                                                                                                                        size: 20.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Container(
                                                                                                                                              width: 25.0,
                                                                                                                                              height: 25.0,
                                                                                                                                              decoration: BoxDecoration(),
                                                                                                                                              child: Stack(
                                                                                                                                                children: [
                                                                                                                                                  Container(
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                      child: FaIcon(
                                                                                                                                                        FontAwesomeIcons.handHoldingMedical,
                                                                                                                                                        color: Color(0x34FFFFFF),
                                                                                                                                                        size: 20.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  Container(
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                      child: FaIcon(
                                                                                                                                                        FontAwesomeIcons.handHoldingMedical,
                                                                                                                                                        color: Color(0xFFF3F3F3),
                                                                                                                                                        size: 20.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Container(
                                                                                                                                              width: 25.0,
                                                                                                                                              height: 25.0,
                                                                                                                                              decoration: BoxDecoration(),
                                                                                                                                              child: Stack(
                                                                                                                                                children: [
                                                                                                                                                  Container(
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                      child: FaIcon(
                                                                                                                                                        FontAwesomeIcons.flask,
                                                                                                                                                        color: Color(0x33FFFFFF),
                                                                                                                                                        size: 20.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  if (testsOfBookingItem.resultPosted)
                                                                                                                                                    Container(
                                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                                        shape: BoxShape.circle,
                                                                                                                                                      ),
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                        child: FaIcon(
                                                                                                                                                          FontAwesomeIcons.flask,
                                                                                                                                                          color: Color(0xFFF3F3F3),
                                                                                                                                                          size: 20.0,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            Container(
                                                                                                                                              width: 25.0,
                                                                                                                                              height: 25.0,
                                                                                                                                              decoration: BoxDecoration(),
                                                                                                                                              child: Stack(
                                                                                                                                                children: [
                                                                                                                                                  Container(
                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                      shape: BoxShape.circle,
                                                                                                                                                    ),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                      child: Icon(
                                                                                                                                                        Icons.check_circle_outlined,
                                                                                                                                                        color: Color(0x34FFFFFF),
                                                                                                                                                        size: 20.0,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                  if (testsOfBookingItem.resultPosted)
                                                                                                                                                    Container(
                                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                                        shape: BoxShape.circle,
                                                                                                                                                      ),
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                                                                        child: Icon(
                                                                                                                                                          Icons.check_circle_outlined,
                                                                                                                                                          color: Color(0xFFF3F3F3),
                                                                                                                                                          size: 22.0,
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
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      );
                                                                                                    },
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
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<BookingsRecord>>(
                                              stream: queryBookingsRecord(
                                                queryBuilder: (bookingsRecord) =>
                                                    bookingsRecord
                                                        .where('user',
                                                            isEqualTo:
                                                                currentUserReference)
                                                        .where(
                                                            'booking_confirmed',
                                                            isEqualTo: true)
                                                        .where('scheduled_date',
                                                            isGreaterThanOrEqualTo:
                                                                functions
                                                                    .getDayToday()),
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
                                                List<BookingsRecord>
                                                    upcomingBookingsColumnBookingsRecordList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      upcomingBookingsColumnBookingsRecordList
                                                          .length,
                                                      (upcomingBookingsColumnIndex) {
                                                    final upcomingBookingsColumnBookingsRecord =
                                                        upcomingBookingsColumnBookingsRecordList[
                                                            upcomingBookingsColumnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (bottomSheetContext) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            bottomSheetContext)
                                                                        .viewInsets,
                                                                    child:
                                                                        BookingUpdateWidget(
                                                                      bookingRef:
                                                                          upcomingBookingsColumnBookingsRecord,
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.8,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      350.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          6.0,
                                                                      color: Color(
                                                                          0x7258595B),
                                                                      spreadRadius:
                                                                          2.0,
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.8,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  DateWidgetSmallWidget(
                                                                                    key: Key('Key6tj_${upcomingBookingsColumnIndex}_of_${upcomingBookingsColumnBookingsRecordList.length}'),
                                                                                    date: upcomingBookingsColumnBookingsRecord.scheduledDate,
                                                                                  ),
                                                                                  if (upcomingBookingsColumnBookingsRecord.labRefNum != '')
                                                                                    Text(
                                                                                      upcomingBookingsColumnBookingsRecord.labRefNum,
                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            color: Colors.white,
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                        child: Text(
                                                                                          upcomingBookingsColumnBookingsRecord.bookingstatus,
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Roboto',
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
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.58,
                                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x33FFFFFF),
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  '${functions.camelCase(upcomingBookingsColumnBookingsRecord.firstname)}   ${functions.camelCase(upcomingBookingsColumnBookingsRecord.lastname)}',
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontSize: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 220.0,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                children: [
                                                                                                  if (upcomingBookingsColumnBookingsRecord.flaggedTests.length > 0)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                      child: Material(
                                                                                                        color: Colors.transparent,
                                                                                                        elevation: 2.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: 90.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                              children: [
                                                                                                                Icon(
                                                                                                                  Icons.flag_rounded,
                                                                                                                  color: Colors.white,
                                                                                                                  size: 16.0,
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  'Flagged',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (upcomingBookingsColumnBookingsRecord.frozenTests.length > 0)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                      child: Material(
                                                                                                        color: Colors.transparent,
                                                                                                        elevation: 2.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: 90.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFF989898),
                                                                                                            borderRadius: BorderRadius.circular(12.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                              children: [
                                                                                                                FaIcon(
                                                                                                                  FontAwesomeIcons.solidPauseCircle,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  size: 16.0,
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  'On Hold',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Open Sans',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final bookedTests = upcomingBookingsColumnBookingsRecord.bookedTests.toList();
                                                                                                return ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  itemCount: bookedTests.length,
                                                                                                  itemBuilder: (context, bookedTestsIndex) {
                                                                                                    final bookedTestsItem = bookedTests[bookedTestsIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 8.0, 2.0),
                                                                                                      child: StreamBuilder<TestsRecord>(
                                                                                                        stream: TestsRecord.getDocument(bookedTestsItem),
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
                                                                                                          final containerTestsRecord = snapshot.data!;
                                                                                                          return InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                context: context,
                                                                                                                builder: (bottomSheetContext) {
                                                                                                                  return Padding(
                                                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                    child: TestDetailsPopupWidget(
                                                                                                                      test: containerTestsRecord,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => setState(() {}));
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: MediaQuery.of(context).size.width * 0.3,
                                                                                                              ),
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Colors.white,
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                child: SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 5.0, 5.0),
                                                                                                                        child: Text(
                                                                                                                          functions.camelCase(containerTestsRecord.name).maybeHandleOverflow(
                                                                                                                                maxChars: 20,
                                                                                                                                replacement: '…',
                                                                                                                              ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Open Sans',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
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
                                        ),
                                        StreamBuilder<List<BookingsRecord>>(
                                          stream: queryBookingsRecord(
                                            queryBuilder: (bookingsRecord) =>
                                                bookingsRecord
                                                    .where('booking_confirmed',
                                                        isEqualTo: false)
                                                    .where('user',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BookingsRecord>
                                                inactiveBookingsBookingsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final inactivebookings =
                                                        inactiveBookingsBookingsRecordList
                                                            .toList();
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
                                                            inactivebookings
                                                                .length,
                                                            (inactivebookingsIndex) {
                                                          final inactivebookingsItem =
                                                              inactivebookings[
                                                                  inactivebookingsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
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
                                                                          Colors
                                                                              .transparent,
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
                                                                              BookingUpdateWidget(
                                                                            bookingRef:
                                                                                inactivebookingsItem,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        2.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            350.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                6.0,
                                                                            color:
                                                                                Color(0x7258595B),
                                                                            spreadRadius:
                                                                                2.0,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.8,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        DateWidgetSmallWidget(
                                                                                          key: Key('Keyy3t_${inactivebookingsIndex}_of_${inactivebookings.length}'),
                                                                                          date: inactivebookingsItem.createdDate,
                                                                                        ),
                                                                                        if (inactivebookingsItem.labRefNum != '')
                                                                                          Text(
                                                                                            inactivebookingsItem.labRefNum,
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: Colors.white,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  inactivebookingsItem.bookingstatus,
                                                                                                  'inactive',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'Roboto',
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
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    height: MediaQuery.of(context).size.height * 0.04,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x33FFFFFF),
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        '${functions.camelCase(inactivebookingsItem.firstname)}   ${functions.camelCase(inactivebookingsItem.lastname)}',
                                                                                                        style: TextStyle(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          fontSize: 16.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 220.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      if (inactivebookingsItem.flaggedTests.length > 0)
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                          child: Material(
                                                                                                            color: Colors.transparent,
                                                                                                            elevation: 2.0,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                            ),
                                                                                                            child: Container(
                                                                                                              width: 90.0,
                                                                                                              height: 30.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                  children: [
                                                                                                                    Icon(
                                                                                                                      Icons.flag_rounded,
                                                                                                                      color: Colors.white,
                                                                                                                      size: 16.0,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      'Flagged',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      if (inactivebookingsItem.frozenTests.length > 0)
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                          child: Material(
                                                                                                            color: Colors.transparent,
                                                                                                            elevation: 2.0,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                            ),
                                                                                                            child: Container(
                                                                                                              width: 90.0,
                                                                                                              height: 30.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFAEAEAE),
                                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                  children: [
                                                                                                                    FaIcon(
                                                                                                                      FontAwesomeIcons.solidPauseCircle,
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      size: 16.0,
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      'On Hold',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Open Sans',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              StreamBuilder<List<TestedTestsRecord>>(
                                                                                                stream: queryTestedTestsRecord(
                                                                                                  queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booking_ref', isEqualTo: inactivebookingsItem.reference),
                                                                                                ),
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
                                                                                                  List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data!;
                                                                                                  return Container(
                                                                                                    height: 35.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final bookingtests = inactivebookingsItem.testsIncluded.toList();
                                                                                                          return ListView.builder(
                                                                                                            padding: EdgeInsets.zero,
                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                            itemCount: bookingtests.length,
                                                                                                            itemBuilder: (context, bookingtestsIndex) {
                                                                                                              final bookingtestsItem = bookingtests[bookingtestsIndex];
                                                                                                              return Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 8.0, 2.0),
                                                                                                                child: StreamBuilder<TestsRecord>(
                                                                                                                  stream: TestsRecord.getDocument(bookingtestsItem),
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
                                                                                                                    final containerTestsRecord = snapshot.data!;
                                                                                                                    return InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        await showModalBottomSheet(
                                                                                                                          isScrollControlled: true,
                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                          barrierColor: Color(0x00000000),
                                                                                                                          context: context,
                                                                                                                          builder: (bottomSheetContext) {
                                                                                                                            return Padding(
                                                                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                              child: TestDetailsPopupWidget(
                                                                                                                                test: containerTestsRecord,
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ).then((value) => setState(() {}));
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 0.04,
                                                                                                                        constraints: BoxConstraints(
                                                                                                                          maxWidth: MediaQuery.of(context).size.width * 0.3,
                                                                                                                        ),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white,
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                                          child: SingleChildScrollView(
                                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 5.0, 5.0),
                                                                                                                                  child: Text(
                                                                                                                                    functions.camelCase(containerTestsRecord.name).maybeHandleOverflow(
                                                                                                                                          maxChars: 20,
                                                                                                                                          replacement: '…',
                                                                                                                                        ),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Roboto',
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
