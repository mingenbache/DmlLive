import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/booking_update_widget.dart';
import '../components/date_widget_small_widget.dart';
import '../components/test_details_popup_widget.dart';
import '../components/top_actions_widget.dart';
import '../components/view_test_result_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({Key? key}) : super(key: key);

  @override
  _MyBookingsWidgetState createState() => _MyBookingsWidgetState();
}

class _MyBookingsWidgetState extends State<MyBookingsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Image.asset(
              'assets/images/francisco-venancio-M4Xloxsg0Gw-unsplash.jpg',
              width: MediaQuery.of(context).size.width,
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
                                                'MY BOOKINGS',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
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
                          functions.returnBookingsTab(FFAppState().testsVar),
                          0,
                        ),
                        2),
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                        Expanded(
                          child: TabBarView(
                            children: [
                              StreamBuilder<List<BookingsRecord>>(
                                stream: queryBookingsRecord(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord
                                          .where('completed', isEqualTo: true)
                                          .where('user',
                                              isEqualTo: currentUserReference),
                                ),
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
                                  List<BookingsRecord>
                                      pastBookingsBookingsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Builder(
                                        builder: (context) {
                                          final pastbookings =
                                              pastBookingsBookingsRecordList
                                                  .toList();
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  pastbookings.length,
                                                  (pastbookingsIndex) {
                                                final pastbookingsItem =
                                                    pastbookings[
                                                        pastbookingsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          if (pastbookingsItem
                                                              .completed!) {
                                                            context.pushNamed(
                                                              'LabReport',
                                                              queryParams: {
                                                                'bookingRef': serializeParam(
                                                                    pastbookingsItem
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference),
                                                              }.withoutNulls,
                                                            );

                                                            return;
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      BookingUpdateWidget(
                                                                    bookingRef:
                                                                        pastbookingsItem,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            return;
                                                          }
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 6,
                                                                  color: Color(
                                                                      0x7258595B),
                                                                  spreadRadius:
                                                                      2,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.8,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            5),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              DateWidgetSmallWidget(
                                                                                date: pastbookingsItem.scheduledDate,
                                                                              ),
                                                                              if (pastbookingsItem.labRefNum != '')
                                                                                Text(
                                                                                  pastbookingsItem.labRefNum!,
                                                                                  style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.white,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        pastbookingsItem.bookingstatus,
                                                                                        'inactive',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                            fontFamily: 'Roboto',
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                                            child: Container(
                                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x33FFFFFF),
                                                                                                borderRadius: BorderRadius.circular(12),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 6, 0, 0),
                                                                                                child: Text(
                                                                                                  '${pastbookingsItem.firstname}   ${pastbookingsItem.lastname}',
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontSize: 16,
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
                                                                                                  width: 50,
                                                                                                  height: 50,
                                                                                                  child: SpinKitRipple(
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    size: 50,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data!;
                                                                                            return Container(
                                                                                              height: 100,
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
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                                                                                                        child: InkWell(
                                                                                                          onTap: () async {
                                                                                                            await showModalBottomSheet(
                                                                                                              isScrollControlled: true,
                                                                                                              backgroundColor: Colors.transparent,
                                                                                                              context: context,
                                                                                                              builder: (context) {
                                                                                                                return Padding(
                                                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                                                  child: ViewTestResultWidget(
                                                                                                                    testedTestRef: testsOfBookingItem.reference,
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                          child: Material(
                                                                                                            color: Colors.transparent,
                                                                                                            elevation: 1,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(16),
                                                                                                            ),
                                                                                                            child: Container(
                                                                                                              width: MediaQuery.of(context).size.width * 0.8,
                                                                                                              height: 27,
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: 290,
                                                                                                              ),
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                borderRadius: BorderRadius.circular(16),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                                                                                                              width: 50,
                                                                                                                              height: 50,
                                                                                                                              child: SpinKitRipple(
                                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                size: 50,
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
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Montserrat',
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
                                                                                                                          elevation: 2,
                                                                                                                          shape: RoundedRectangleBorder(
                                                                                                                            borderRadius: BorderRadius.circular(16),
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
                                                                                                                              borderRadius: BorderRadius.circular(16),
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Container(
                                                                                                                                    width: 25,
                                                                                                                                    height: 25,
                                                                                                                                    decoration: BoxDecoration(),
                                                                                                                                    child: Stack(
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                            child: FaIcon(
                                                                                                                                              FontAwesomeIcons.clock,
                                                                                                                                              color: Color(0xFFF3F3F3),
                                                                                                                                              size: 20,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Container(
                                                                                                                                    width: 25,
                                                                                                                                    height: 25,
                                                                                                                                    decoration: BoxDecoration(),
                                                                                                                                    child: Stack(
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                            child: FaIcon(
                                                                                                                                              FontAwesomeIcons.handHoldingMedical,
                                                                                                                                              color: Color(0x34FFFFFF),
                                                                                                                                              size: 20,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                            child: FaIcon(
                                                                                                                                              FontAwesomeIcons.handHoldingMedical,
                                                                                                                                              color: Color(0xFFF3F3F3),
                                                                                                                                              size: 20,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Container(
                                                                                                                                    width: 25,
                                                                                                                                    height: 25,
                                                                                                                                    decoration: BoxDecoration(),
                                                                                                                                    child: Stack(
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                            child: FaIcon(
                                                                                                                                              FontAwesomeIcons.flask,
                                                                                                                                              color: Color(0x33FFFFFF),
                                                                                                                                              size: 20,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        if (testsOfBookingItem.resultPosted ?? true)
                                                                                                                                          Container(
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              shape: BoxShape.circle,
                                                                                                                                            ),
                                                                                                                                            child: Padding(
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                              child: FaIcon(
                                                                                                                                                FontAwesomeIcons.flask,
                                                                                                                                                color: Color(0xFFF3F3F3),
                                                                                                                                                size: 20,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Container(
                                                                                                                                    width: 25,
                                                                                                                                    height: 25,
                                                                                                                                    decoration: BoxDecoration(),
                                                                                                                                    child: Stack(
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                            child: Icon(
                                                                                                                                              Icons.check_circle_outlined,
                                                                                                                                              color: Color(0x34FFFFFF),
                                                                                                                                              size: 20,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        if (testsOfBookingItem.resultPosted ?? true)
                                                                                                                                          Container(
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              shape: BoxShape.circle,
                                                                                                                                            ),
                                                                                                                                            child: Padding(
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                              child: Icon(
                                                                                                                                                Icons.check_circle_outlined,
                                                                                                                                                color: Color(0xFFF3F3F3),
                                                                                                                                                size: 22,
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
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: StreamBuilder<List<BookingsRecord>>(
                                    stream: queryBookingsRecord(
                                      queryBuilder: (bookingsRecord) =>
                                          bookingsRecord
                                              .where('user',
                                                  isEqualTo:
                                                      currentUserReference)
                                              .where('booking_confirmed',
                                                  isEqualTo: true)
                                              .where('scheduled_date',
                                                  isGreaterThanOrEqualTo:
                                                      functions.getDayToday()),
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
                                      List<BookingsRecord>
                                          upcomingBookingsColumnBookingsRecordList =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            upcomingBookingsColumnBookingsRecordList
                                                .length,
                                            (upcomingBookingsColumnIndex) {
                                          final upcomingBookingsColumnBookingsRecord =
                                              upcomingBookingsColumnBookingsRecordList[
                                                  upcomingBookingsColumnIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              BookingUpdateWidget(
                                                            bookingRef:
                                                                upcomingBookingsColumnBookingsRecord,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 6,
                                                            color: Color(
                                                                0x7258595B),
                                                            spreadRadius: 2,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 5, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.8,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        DateWidgetSmallWidget(
                                                                          date:
                                                                              upcomingBookingsColumnBookingsRecord.scheduledDate,
                                                                        ),
                                                                        if (upcomingBookingsColumnBookingsRecord.labRefNum !=
                                                                            '')
                                                                          Text(
                                                                            upcomingBookingsColumnBookingsRecord.labRefNum!,
                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Colors.white,
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
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
                                                                              child: Text(
                                                                                upcomingBookingsColumnBookingsRecord.bookingstatus!,
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Roboto',
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
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.58,
                                                                                    height: MediaQuery.of(context).size.height * 0.04,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x33FFFFFF),
                                                                                      borderRadius: BorderRadius.circular(12),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16, 6, 0, 0),
                                                                                      child: Text(
                                                                                        '${functions.camelCase(upcomingBookingsColumnBookingsRecord.firstname)}   ${functions.camelCase(upcomingBookingsColumnBookingsRecord.lastname)}',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 16,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 220,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        if (upcomingBookingsColumnBookingsRecord.flaggedTests!.toList().length > 0)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 2,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(12),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: 90,
                                                                                                height: 30,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      Icon(
                                                                                                        Icons.flag_rounded,
                                                                                                        color: Colors.white,
                                                                                                        size: 16,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Flagged',
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        if (upcomingBookingsColumnBookingsRecord.frozenTests!.toList().length > 0)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 2,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(12),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: 90,
                                                                                                height: 30,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x33FFFFFF),
                                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      FaIcon(
                                                                                                        FontAwesomeIcons.solidPauseCircle,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        size: 16,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'On Hold',
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Montserrat',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 35,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final bookedTests = upcomingBookingsColumnBookingsRecord.bookedTests!.toList();
                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        itemCount: bookedTests.length,
                                                                                        itemBuilder: (context, bookedTestsIndex) {
                                                                                          final bookedTestsItem = bookedTests[bookedTestsIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 2),
                                                                                            child: StreamBuilder<TestsRecord>(
                                                                                              stream: TestsRecord.getDocument(bookedTestsItem),
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
                                                                                                final containerTestsRecord = snapshot.data!;
                                                                                                return InkWell(
                                                                                                  onTap: () async {
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: TestDetailsPopupWidget(
                                                                                                            test: containerTestsRecord,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: MediaQuery.of(context).size.height * 0.04,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: MediaQuery.of(context).size.width * 0.3,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Colors.white,
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                                      child: SingleChildScrollView(
                                                                                                        scrollDirection: Axis.horizontal,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                                              child: Text(
                                                                                                                functions.camelCase(containerTestsRecord.name).maybeHandleOverflow(
                                                                                                                      maxChars: 20,
                                                                                                                      replacement: '…',
                                                                                                                    ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Montserrat',
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
                                              isEqualTo: currentUserReference),
                                ),
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
                                  List<BookingsRecord>
                                      inactiveBookingsBookingsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Builder(
                                        builder: (context) {
                                          final inactivebookings =
                                              inactiveBookingsBookingsRecordList
                                                  .toList();
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  inactivebookings.length,
                                                  (inactivebookingsIndex) {
                                                final inactivebookingsItem =
                                                    inactivebookings[
                                                        inactivebookingsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    BookingUpdateWidget(
                                                                  bookingRef:
                                                                      inactivebookingsItem,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 6,
                                                                  color: Color(
                                                                      0x7258595B),
                                                                  spreadRadius:
                                                                      2,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.8,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            5),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              DateWidgetSmallWidget(
                                                                                date: inactivebookingsItem.createdDate,
                                                                              ),
                                                                              if (inactivebookingsItem.labRefNum != '')
                                                                                Text(
                                                                                  inactivebookingsItem.labRefNum!,
                                                                                  style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Colors.white,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 4, 4),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        inactivebookingsItem.bookingstatus,
                                                                                        'inactive',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                            fontFamily: 'Roboto',
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
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                                        child: Container(
                                                                                          height: MediaQuery.of(context).size.height * 0.04,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x33FFFFFF),
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16, 6, 0, 0),
                                                                                            child: Text(
                                                                                              '${functions.camelCase(inactivebookingsItem.firstname)}   ${functions.camelCase(inactivebookingsItem.lastname)}',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 16,
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
                                                                                      width: 220,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            if (inactivebookingsItem.flaggedTests!.toList().length > 0)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                child: Material(
                                                                                                  color: Colors.transparent,
                                                                                                  elevation: 2,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: 90,
                                                                                                    height: 30,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      borderRadius: BorderRadius.circular(12),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.flag_rounded,
                                                                                                            color: Colors.white,
                                                                                                            size: 16,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'Flagged',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (inactivebookingsItem.frozenTests!.toList().length > 0)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                child: Material(
                                                                                                  color: Colors.transparent,
                                                                                                  elevation: 2,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: 90,
                                                                                                    height: 30,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x33FFFFFF),
                                                                                                      borderRadius: BorderRadius.circular(12),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                        children: [
                                                                                                          FaIcon(
                                                                                                            FontAwesomeIcons.solidPauseCircle,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                            size: 16,
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'On Hold',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                              width: 50,
                                                                                              height: 50,
                                                                                              child: SpinKitRipple(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                size: 50,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data!;
                                                                                        return Container(
                                                                                          height: 35,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final bookingtests = inactivebookingsItem.testsIncluded!.toList();
                                                                                                return ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  itemCount: bookingtests.length,
                                                                                                  itemBuilder: (context, bookingtestsIndex) {
                                                                                                    final bookingtestsItem = bookingtests[bookingtestsIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 2),
                                                                                                      child: StreamBuilder<TestsRecord>(
                                                                                                        stream: TestsRecord.getDocument(bookingtestsItem),
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
                                                                                                          final containerTestsRecord = snapshot.data!;
                                                                                                          return InkWell(
                                                                                                            onTap: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return Padding(
                                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                                    child: TestDetailsPopupWidget(
                                                                                                                      test: containerTestsRecord,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: MediaQuery.of(context).size.width * 0.3,
                                                                                                              ),
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Colors.white,
                                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                                                                                                                child: SingleChildScrollView(
                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                                                        child: Text(
                                                                                                                          functions.camelCase(containerTestsRecord.name).maybeHandleOverflow(
                                                                                                                                maxChars: 20,
                                                                                                                                replacement: '…',
                                                                                                                              ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
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
    );
  }
}
