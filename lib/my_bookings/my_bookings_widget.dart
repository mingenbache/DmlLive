import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/date_widget_small_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBookingsWidget extends StatefulWidget {
  const MyBookingsWidget({Key key}) : super(key: key);

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
                  Color(0x4DFFFFFF),
                  Color(0xE6BACA68),
                  Color(0xFFB5AC49)
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
                          labelColor: Colors.white,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryColor,
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
                                      snapshot.data;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 15),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Material(
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
                                                      height: 210,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
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
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          5,
                                                                          0,
                                                                          0),
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
                                                                            getCurrentTimestamp,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
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
                                                                              random_data.randomString(
                                                                                0,
                                                                                0,
                                                                                false,
                                                                                false,
                                                                                false,
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x7EFFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
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
                                                                                        borderRadius: BorderRadius.circular(12),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6, 6, 0, 0),
                                                                                        child: Text(
                                                                                          '[User Name Here]',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: ListView(
                                                                                    padding: EdgeInsets.zero,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
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
                                                                                              color: Color(0xBEFFFFFF),
                                                                                              borderRadius: BorderRadius.circular(16),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Test Name',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Roboto',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
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
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                height: 180,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 6,
                                                      color: Color(0x7258595B),
                                                      spreadRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
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
                                                                      getCurrentTimestamp,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              4,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        random_data
                                                                            .randomString(
                                                                          0,
                                                                          0,
                                                                          false,
                                                                          false,
                                                                          false,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
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
                                                              color: Color(
                                                                  0x9BEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.58,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x6DFFFFFF),
                                                                              borderRadius: BorderRadius.circular(12),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 6, 0, 0),
                                                                              child: Text(
                                                                                '[User Name Here]',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                220,
                                                                            height:
                                                                                50,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Material(
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
                                                                                Material(
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
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            35,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              ListView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 2),
                                                                                child: Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                                        height: 100,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                          child: Text(
                                                                                            functions
                                                                                                .camelCase(random_data.randomString(
                                                                                                  0,
                                                                                                  0,
                                                                                                  false,
                                                                                                  false,
                                                                                                  false,
                                                                                                ))
                                                                                                .maybeHandleOverflow(
                                                                                                  maxChars: 20,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontWeight: FontWeight.normal,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StreamBuilder<List<BookingsRecord>>(
                                stream: queryBookingsRecord(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord.where('booking_confirmed',
                                          isEqualTo: false),
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
                                      snapshot.data;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 15),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Material(
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
                                                      height: 180,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
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
                                                                      .max,
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
                                                                            getCurrentTimestamp,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
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
                                                                              random_data.randomString(
                                                                                0,
                                                                                0,
                                                                                false,
                                                                                false,
                                                                                false,
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
                                                                    color: Color(
                                                                        0x9BEEEEEE),
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.58,
                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x33FFFFFF),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 6, 0, 0),
                                                                                  child: Text(
                                                                                    '[User Name Here]',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontSize: 16,
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
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Material(
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
                                                                                      Material(
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
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                  child: Column(
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
                                                                                child: ListView(
                                                                                  padding: EdgeInsets.zero,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 2),
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                                                        height: MediaQuery.of(context).size.height * 0.04,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.28,
                                                                                              height: 100,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 7, 5, 5),
                                                                                                child: Text(
                                                                                                  functions
                                                                                                      .camelCase(random_data.randomString(
                                                                                                        0,
                                                                                                        0,
                                                                                                        false,
                                                                                                        false,
                                                                                                        false,
                                                                                                      ))
                                                                                                      .maybeHandleOverflow(
                                                                                                        maxChars: 20,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        fontWeight: FontWeight.normal,
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
                                                ],
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
