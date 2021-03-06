import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/booking_actions_widget.dart';
import '../components/invoice_sheet_widget.dart';
import '../components/payment_widget.dart';
import '../components/view_test_result_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BookingUpdateWidget extends StatefulWidget {
  const BookingUpdateWidget({
    Key key,
    this.bookingRef,
  }) : super(key: key);

  final BookingsRecord bookingRef;

  @override
  _BookingUpdateWidgetState createState() => _BookingUpdateWidgetState();
}

class _BookingUpdateWidgetState extends State<BookingUpdateWidget> {
  PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StreamBuilder<BookingsRecord>(
          stream: BookingsRecord.getDocument(widget.bookingRef.reference),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitDoubleBounce(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 50,
                  ),
                ),
              );
            }
            final bookingUpdatesContainerBookingsRecord = snapshot.data;
            return Container(
              constraints: BoxConstraints(
                maxHeight: 650,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).tertiaryColor,
                            Color(0xFF77A54A)
                          ],
                          stops: [1, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BOOKING\nDETAILS',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF586B06),
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 48,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 500,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 50),
                                      child: PageView(
                                        controller: pageViewController ??=
                                            PageController(initialPage: 0),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.83,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3, 0, 0, 3),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 130,
                                                              height: 32,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxHeight: 32,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x4CFFFFFF),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x32171717),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .verified_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 20,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        bookingUpdatesContainerBookingsRecord
                                                                            .bookingstatus,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Colors.white,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 20),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              currentUserReference),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitDoubleBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final containerUsersRecord =
                                                            snapshot.data;
                                                        return Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          5),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.45,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          'Booking Details',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF586B06),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          5),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.06,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          320,
                                                                      maxHeight:
                                                                          130,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.18,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.15,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 60,
                                                                              maxHeight: 130,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 60,
                                                                                      constraints: BoxConstraints(
                                                                                        maxHeight: 50,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.02,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              functions.dateMonth(bookingUpdatesContainerBookingsRecord.scheduledDate),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    fontSize: 12,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.04,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              functions.dateDay(bookingUpdatesContainerBookingsRecord.scheduledDate),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                    fontSize: 18,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.02,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              functions.dateYear(bookingUpdatesContainerBookingsRecord.scheduledDate),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                    fontSize: 10,
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
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.3,
                                                                            height:
                                                                                130,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 110,
                                                                              maxHeight: 130,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(15),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  height: 130,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(15),
                                                                                      bottomRight: Radius.circular(0),
                                                                                      topLeft: Radius.circular(15),
                                                                                      topRight: Radius.circular(0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 100,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                                                                                child: Text(
                                                                                                  'Total\nTests',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFEEEEEE),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0),
                                                                                      bottomRight: Radius.circular(15),
                                                                                      topLeft: Radius.circular(0),
                                                                                      topRight: Radius.circular(15),
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                        child: Text(
                                                                                          bookingUpdatesContainerBookingsRecord.bookedTests.toList().length.toString(),
                                                                                          style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.3,
                                                                          height:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 100,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(15),
                                                                                    bottomRight: Radius.circular(0),
                                                                                    topLeft: Radius.circular(15),
                                                                                    topRight: Radius.circular(0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 7, 0, 0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 70,
                                                                                        height: 100,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 80,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                                                                              child: Text(
                                                                                                'Complete Tests',
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.15,
                                                                                height: 100,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0),
                                                                                    bottomRight: Radius.circular(15),
                                                                                    topLeft: Radius.circular(0),
                                                                                    topRight: Radius.circular(15),
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                      child: StreamBuilder<List<TestedTestsRecord>>(
                                                                                        stream: queryTestedTestsRecord(
                                                                                          queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booking_ref', isEqualTo: bookingUpdatesContainerBookingsRecord.reference).where('is_verified', isEqualTo: true),
                                                                                        ),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50,
                                                                                                height: 50,
                                                                                                child: SpinKitDoubleBounce(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  size: 50,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          List<TestedTestsRecord> textTestedTestsRecordList = snapshot.data;
                                                                                          return Text(
                                                                                            bookingUpdatesContainerBookingsRecord.verifiedTests.toList().length.toString(),
                                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Total Invoice Amount',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Color(0xFF586B06),
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.25,
                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: MediaQuery.of(context).size.width * 0.45,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x2BFFFFFF),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 7, 0, 0),
                                                                                child: Text(
                                                                                  formatNumber(
                                                                                    bookingUpdatesContainerBookingsRecord.totalPrice,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                    currency: 'Ksh ',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Total Amount Due',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Color(0xFF586B06),
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.25,
                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: MediaQuery.of(context).size.width * 0.45,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x2BFFFFFF),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 7, 0, 0),
                                                                                child: Text(
                                                                                  formatNumber(
                                                                                    bookingUpdatesContainerBookingsRecord.paymentBalance,
                                                                                    formatType: FormatType.decimal,
                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                    currency: 'Ksh ',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 20),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          currentUserReference),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitDoubleBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerUsersRecord =
                                                        snapshot.data;
                                                    return Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
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
                                                                      0.45,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    'Patient Details',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              Color(0xFF586B06),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.8,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
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
                                                                            .width *
                                                                        0.15,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
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
                                                                              6,
                                                                              6,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        'Name',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF586B06),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.65,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x2CEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              6,
                                                                              6,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        '${bookingUpdatesContainerBookingsRecord.firstname} ${bookingUpdatesContainerBookingsRecord.lastname}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.8,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
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
                                                                            .width *
                                                                        0.15,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
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
                                                                              6,
                                                                              6,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        'Email',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF586B06),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.65,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x2CEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              6,
                                                                              6,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        bookingUpdatesContainerBookingsRecord
                                                                            .emailaddress,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.8,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
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
                                                                            .width *
                                                                        0.15,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
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
                                                                              6,
                                                                              6,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        'Phone',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF586B06),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.65,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.04,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x2CEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              6,
                                                                              6,
                                                                              3,
                                                                              3),
                                                                      child:
                                                                          Text(
                                                                        bookingUpdatesContainerBookingsRecord
                                                                            .phonenumber,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.04,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              'Date of Birth',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Color(0xFF586B06),
                                                                                    fontWeight: FontWeight.w500,
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
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.25,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.04,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x2CFFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(7),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3,
                                                                                5,
                                                                                3,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat('d/M/y', bookingUpdatesContainerBookingsRecord.dOB),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.08,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.04,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              'Sex',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: Color(0xFF586B06),
                                                                                    fontWeight: FontWeight.w500,
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
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.18,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.04,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x2BFFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(7),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                              child: Text(
                                                                                bookingUpdatesContainerBookingsRecord.sex,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      fontWeight: FontWeight.normal,
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
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tests',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 5),
                                                    child: StreamBuilder<
                                                        List<
                                                            BookedTestsRecord>>(
                                                      stream:
                                                          queryBookedTestsRecord(
                                                        queryBuilder: (bookedTestsRecord) =>
                                                            bookedTestsRecord.where(
                                                                'booking_ref',
                                                                isEqualTo:
                                                                    bookingUpdatesContainerBookingsRecord
                                                                        .reference),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitDoubleBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BookedTestsRecord>
                                                            bookedTestsContainerBookedTestsRecordList =
                                                            snapshot.data;
                                                        return Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.28,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final bookingTests =
                                                                    bookedTestsContainerBookedTestsRecordList
                                                                            ?.toList() ??
                                                                        [];
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      bookingTests
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          bookingTestsIndex) {
                                                                    final bookingTestsItem =
                                                                        bookingTests[
                                                                            bookingTestsIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              5,
                                                                              10,
                                                                              5),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              TestedTestsRecord>>(
                                                                        stream:
                                                                            queryTestedTestsRecord(
                                                                          queryBuilder: (testedTestsRecord) => testedTestsRecord.where(
                                                                              'booking_ref',
                                                                              isEqualTo: bookingUpdatesContainerBookingsRecord.reference),
                                                                        ),
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
                                                                                child: SpinKitDoubleBounce(
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  size: 50,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<TestedTestsRecord>
                                                                              containerTestedTestsRecordList =
                                                                              snapshot.data;
                                                                          return InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              if (bookingTestsItem.sampleCollected) {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: ViewTestResultWidget(
                                                                                        testedTestRef: functions.returnTestedTestRef(containerTestedTestsRecordList.toList(), bookingTestsItem.reference),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 0.8,
                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 300,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(8),
                                                                                  bottomRight: Radius.circular(16),
                                                                                  topLeft: Radius.circular(8),
                                                                                  topRight: Radius.circular(16),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: StreamBuilder<BookedTestsRecord>(
                                                                                  stream: BookedTestsRecord.getDocument(bookingTestsItem.reference),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50,
                                                                                          height: 50,
                                                                                          child: SpinKitDoubleBounce(
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            size: 50,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    final rowBookedTestsRecord = snapshot.data;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        StreamBuilder<TestsRecord>(
                                                                                          stream: TestsRecord.getDocument(bookingTestsItem.testRef),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 50,
                                                                                                  height: 50,
                                                                                                  child: SpinKitDoubleBounce(
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    size: 50,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final textTestsRecord = snapshot.data;
                                                                                            return Text(
                                                                                              functions.upperCase(textTestsRecord.name),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 1,
                                                                                                      color: Color(0x31000000),
                                                                                                      spreadRadius: 1,
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
                                                                                                                  color: Color(0x32FFFFFF),
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
                                                                                                            if (bookingTestsItem.sampleCollected ?? true)
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
                                                                                                            if (functions.testedTestSubmitted(functions.returnTestedTest(containerTestedTestsRecordList.toList(), bookingTestsItem.reference)) ?? true)
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
                                                                                                            if (functions.testedTestVerified(functions.returnTestedTest(containerTestedTestsRecordList.toList(), bookingTestsItem.reference)) ?? true)
                                                                                                              Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  shape: BoxShape.circle,
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                  child: Icon(
                                                                                                                    Icons.check_circle_outlined,
                                                                                                                    color: Color(0xFFF3F3F3),
                                                                                                                    size: 20,
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
                                                                                    );
                                                                                  },
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Invoices',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 5),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.28,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 5, 0, 5),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final invoices =
                                                                bookingUpdatesContainerBookingsRecord
                                                                        .invoiceRefs
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  invoices
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  invoicesIndex) {
                                                                final invoicesItem =
                                                                    invoices[
                                                                        invoicesIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          5,
                                                                          10,
                                                                          5),
                                                                  child: StreamBuilder<
                                                                      InvoicesRecord>(
                                                                    stream: InvoicesRecord
                                                                        .getDocument(
                                                                            invoicesItem),
                                                                    builder:
                                                                        (context,
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
                                                                                SpinKitDoubleBounce(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final containerInvoicesRecord =
                                                                          snapshot
                                                                              .data;
                                                                      return InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: InvoiceSheetWidget(
                                                                                  invoiceRef: invoicesItem,
                                                                                  booking: widget.bookingRef.reference,
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.8,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                300,
                                                                          ),
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
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                                child: Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                                                  height: 100,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 100,
                                                                                  ),
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          containerInvoicesRecord.invoiceAmount,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.periodDecimal,
                                                                                          currency: 'Ksh ',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Roboto',
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                ),
                                                                                child: Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 200,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFEEEEEE),
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 2,
                                                                                        color: Color(0x6C58595B),
                                                                                        spreadRadius: 2,
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                  ),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                                                        height: 100,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFEEEEEE),
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(15),
                                                                                            bottomRight: Radius.circular(0),
                                                                                            topLeft: Radius.circular(15),
                                                                                            topRight: Radius.circular(0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.calendar_today_sharp,
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                size: 21,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  dateTimeFormat('yMMMd', containerInvoicesRecord.dueDate),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.3,
                                                                                            height: 100,
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: 55,
                                                                                            ),
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(1),
                                                                                                bottomRight: Radius.circular(1),
                                                                                                topLeft: Radius.circular(0),
                                                                                                topRight: Radius.circular(1),
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Material(
                                                                                                  color: Colors.transparent,
                                                                                                  elevation: 2,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    height: MediaQuery.of(context).size.height * 0.04,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      boxShadow: [
                                                                                                        BoxShadow(
                                                                                                          blurRadius: 1,
                                                                                                          color: Color(0x22000000),
                                                                                                          spreadRadius: 1,
                                                                                                        )
                                                                                                      ],
                                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                                      shape: BoxShape.rectangle,
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Container(
                                                                                                              width: 25,
                                                                                                              height: 25,
                                                                                                              child: Stack(
                                                                                                                children: [
                                                                                                                  if (!(containerInvoicesRecord.isPaid) ?? true)
                                                                                                                    Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                        child: Icon(
                                                                                                                          Icons.payments_sharp,
                                                                                                                          color: Color(0x33FFFFFF),
                                                                                                                          size: 20,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  if (containerInvoicesRecord.isPaid ?? true)
                                                                                                                    Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                        child: Icon(
                                                                                                                          Icons.payments_sharp,
                                                                                                                          color: Color(0xFFF3F3F3),
                                                                                                                          size: 20,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Container(
                                                                                                              width: 25,
                                                                                                              height: 25,
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
                                                                                                                  if (containerInvoicesRecord.fullAmount ?? true)
                                                                                                                    Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                        child: Icon(
                                                                                                                          Icons.check_circle_outlined,
                                                                                                                          color: Color(0xFFF3F3F3),
                                                                                                                          size: 20,
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Payments',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.28,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 320,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final payments =
                                                              bookingUpdatesContainerBookingsRecord
                                                                      .payments
                                                                      .toList()
                                                                      ?.toList() ??
                                                                  [];
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                payments.length,
                                                            itemBuilder: (context,
                                                                paymentsIndex) {
                                                              final paymentsItem =
                                                                  payments[
                                                                      paymentsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            4),
                                                                child: StreamBuilder<
                                                                    PaymentsRecord>(
                                                                  stream: PaymentsRecord
                                                                      .getDocument(
                                                                          paymentsItem),
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
                                                                              SpinKitDoubleBounce(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                50,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final containerPaymentsRecord =
                                                                        snapshot
                                                                            .data;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                              child: PaymentWidget(
                                                                                paymentRef: containerPaymentsRecord,
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
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
                                                                                width: MediaQuery.of(context).size.width * 0.15,
                                                                                height: 100,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 80,
                                                                                ),
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                  child: Text(
                                                                                    dateTimeFormat('d/M/y', containerPaymentsRecord.createdDate),
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
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 80,
                                                                                ),
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7, 9, 5, 5),
                                                                                  child: Text(
                                                                                    containerPaymentsRecord.transactionCode.maybeHandleOverflow(maxChars: 8),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.2,
                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 60,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  borderRadius: BorderRadius.circular(0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9, 9, 5, 5),
                                                                                  child: Text(
                                                                                    containerPaymentsRecord.type,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: Colors.white,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.25,
                                                                                height: 100,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 90,
                                                                                ),
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 9, 5, 5),
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      containerPaymentsRecord.amount,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: 'Ksh ',
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
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: SmoothPageIndicator(
                                          controller: pageViewController ??=
                                              PageController(initialPage: 0),
                                          count: 5,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            pageViewController.animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: ExpandingDotsEffect(
                                            expansionFactor: 2,
                                            spacing: 8,
                                            radius: 16,
                                            dotWidth: 16,
                                            dotHeight: 16,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            activeDotColor: Colors.white,
                                            paintStyle: PaintingStyle.fill,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (currentUserDocument?.isStaff ?? true)
                              AuthUserStreamWidget(
                                child: BookingActionsWidget(
                                  bookingRef: widget.bookingRef,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Tap above to complete request',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
