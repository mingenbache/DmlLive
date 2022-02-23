import '../backend/backend.dart';
import '../components/booking_update_widget.dart';
import '../components/edit_user_role_widget.dart';
import '../components/payment_widget.dart';
import '../components/view_test_result_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserActivityWidget extends StatefulWidget {
  const UserActivityWidget({
    Key key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference userRef;

  @override
  _UserActivityWidgetState createState() => _UserActivityWidgetState();
}

class _UserActivityWidgetState extends State<UserActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef),
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
        final columnUsersRecord = snapshot.data;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                constraints: BoxConstraints(
                  maxHeight: 730,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height * 1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 44, 20, 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'USER ACTIVITY',
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF586B06),
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            buttonSize: 48,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        color: Color(0x81EEEEEE),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 18,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 15, 0, 0),
                                              child: Text(
                                                '${functions.camelCase(columnUsersRecord.firstName)} ${functions.camelCase(columnUsersRecord.lastName)}',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 17,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 130,
                                            height: 32,
                                            constraints: BoxConstraints(
                                              maxHeight: 32,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x32171717),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.person_outline_sharp,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: Text(
                                                      columnUsersRecord.role,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    constraints: BoxConstraints(
                                      maxHeight: 500,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: DefaultTabController(
                                      length: 4,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            isScrollable: true,
                                            labelColor: Color(0xFF586B06),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2,
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryColor,
                                            indicatorWeight: 2,
                                            tabs: [
                                              Tab(
                                                text: 'User Info',
                                              ),
                                              Tab(
                                                text: 'Bookings',
                                              ),
                                              Tab(
                                                text: 'Payments',
                                              ),
                                              Tab(
                                                text: 'Messages',
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(),
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 5),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.06,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 320,
                                                              maxHeight: 80,
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
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 2,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 130,
                                                                    height: 130,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              70,
                                                                          height:
                                                                              130,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                90,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(15),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(15),
                                                                              topRight: Radius.circular(0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                7,
                                                                                7,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  width: 50,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                                                                    child: Text(
                                                                                      'Total Tests',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              60,
                                                                          height:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFEEEEEE),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(15),
                                                                              topLeft: Radius.circular(0),
                                                                              topRight: Radius.circular(15),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                child: StreamBuilder<List<BookedTestsRecord>>(
                                                                                  stream: queryBookedTestsRecord(
                                                                                    queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where('user', isEqualTo: widget.userRef),
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
                                                                                    List<BookedTestsRecord> textBookedTestsRecordList = snapshot.data;
                                                                                    return Text(
                                                                                      textBookedTestsRecordList.length.toString(),
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
                                                                ),
                                                                Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 2,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 140,
                                                                    height: 100,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          140,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              90,
                                                                          height:
                                                                              100,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                90,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(15),
                                                                              bottomRight: Radius.circular(0),
                                                                              topLeft: Radius.circular(15),
                                                                              topRight: Radius.circular(0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                7,
                                                                                7,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 75,
                                                                                  height: 100,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 80,
                                                                                  ),
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 0),
                                                                                    child: Text(
                                                                                      'Incomplete Tests',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              100,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                50,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFEEEEEE),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0),
                                                                              bottomRight: Radius.circular(15),
                                                                              topLeft: Radius.circular(0),
                                                                              topRight: Radius.circular(15),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                child: StreamBuilder<List<TestedTestsRecord>>(
                                                                                  stream: queryTestedTestsRecord(),
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
                                                                                      textTestedTestsRecordList.length.toString(),
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
                                                              0.9,
                                                          height: 60,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 320,
                                                            maxHeight: 60,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.25,
                                                                height: 100,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: 110,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Date\nRegistered',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF586B06),
                                                                              fontWeight: FontWeight.w500,
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
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.55,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.07,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        200,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x34FFFFFF),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Column(
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
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              dateTimeFormat('d/M/y', columnUsersRecord.createdTime),
                                                                              style: FlutterFlowTheme.of(context).subtitle1,
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
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          height: 60,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 320,
                                                            maxHeight: 70,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.25,
                                                                height: 100,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: 110,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Last\nSigned-in',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF586B06),
                                                                              fontWeight: FontWeight.w500,
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
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.55,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.07,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        200,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x34FFFFFF),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Column(
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
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              dateTimeFormat('d/M/y', columnUsersRecord.lastLogin),
                                                                              style: FlutterFlowTheme.of(context).subtitle1,
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
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          height: 60,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 320,
                                                            maxHeight: 60,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.25,
                                                                height: 100,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: 110,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Last\nBooking',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF586B06),
                                                                              fontWeight: FontWeight.w500,
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
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.55,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.07,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        200,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x34FFFFFF),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Column(
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
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Hello World',
                                                                              style: FlutterFlowTheme.of(context).subtitle1,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      10,
                                                                      0,
                                                                      20),
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
                                                                  0.95,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    Color(
                                                                        0xFF77A54A)
                                                                  ],
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0, 1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            5),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .person_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.45,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            'User Details',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: Colors.white,
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
                                                                            5,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.15,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6, 0, 3, 3),
                                                                              child: Text(
                                                                                'Display\nName',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.65,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x2CEEEEEE),
                                                                              borderRadius: BorderRadius.circular(7),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 3, 3),
                                                                              child: Text(
                                                                                columnUsersRecord.displayName,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.15,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 3, 3),
                                                                              child: Text(
                                                                                'Email',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.65,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x2CEEEEEE),
                                                                              borderRadius: BorderRadius.circular(7),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 3, 3),
                                                                              child: Text(
                                                                                columnUsersRecord.email,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.15,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 3, 3),
                                                                              child: Text(
                                                                                'Phone',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.65,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.04,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x2CEEEEEE),
                                                                              borderRadius: BorderRadius.circular(7),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6, 6, 3, 3),
                                                                              child: Text(
                                                                                columnUsersRecord.phoneNumber,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            15),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.2,
                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Date of\nBirth',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: Colors.white,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.25,
                                                                                height: MediaQuery.of(context).size.height * 0.04,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x2CFFFFFF),
                                                                                  borderRadius: BorderRadius.circular(7),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(3, 5, 3, 0),
                                                                                      child: Text(
                                                                                        dateTimeFormat('d/M/y', columnUsersRecord.dOB),
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
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.09,
                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                    child: Text(
                                                                                      'Sex',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: Colors.white,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.21,
                                                                              height: MediaQuery.of(context).size.height * 0.04,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x2BFFFFFF),
                                                                                borderRadius: BorderRadius.circular(7),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                      child: Text(
                                                                                        columnUsersRecord.sex,
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
                                                                          ],
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
                                                    ),
                                                  ),
                                                ),
                                                StreamBuilder<
                                                    List<BookingsRecord>>(
                                                  stream: queryBookingsRecord(
                                                    queryBuilder: (bookingsRecord) =>
                                                        bookingsRecord
                                                            .where('user',
                                                                isEqualTo: widget
                                                                    .userRef)
                                                            .orderBy(
                                                                'scheduled_date',
                                                                descending:
                                                                    true),
                                                  ),
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
                                                    List<BookingsRecord>
                                                        userBookingsBookingsRecordList =
                                                        snapshot.data;
                                                    return Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 20,
                                                                    0, 20),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final bookings =
                                                                userBookingsBookingsRecordList
                                                                        ?.toList() ??
                                                                    [];
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: List.generate(
                                                                    bookings
                                                                        .length,
                                                                    (bookingsIndex) {
                                                                  final bookingsItem =
                                                                      bookings[
                                                                          bookingsIndex];
                                                                  return Visibility(
                                                                    visible:
                                                                        bookingsItem.bookingConfirmed ??
                                                                            true,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              15),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<TestedTestsRecord>>(
                                                                            stream:
                                                                                queryTestedTestsRecord(
                                                                              queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booking_ref', isEqualTo: bookingsItem.reference),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<TestedTestsRecord> containerTestedTestsRecordList = snapshot.data;
                                                                              return InkWell(
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Color(0x4CFFFFFF),
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: BookingUpdateWidget(
                                                                                          bookingRef: bookingsItem,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.8,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 330,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 6,
                                                                                          color: Color(0x7258595B),
                                                                                          spreadRadius: 2,
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.8,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0),
                                                                                                    bottomRight: Radius.circular(0),
                                                                                                    topLeft: Radius.circular(16),
                                                                                                    topRight: Radius.circular(16),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 2, 10, 5),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                              shape: BoxShape.circle,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                                  child: Text(
                                                                                                                    functions.add1(functions.checkTestListSize(userBookingsBookingsRecordList.length, bookingsIndex)).toString(),
                                                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                          fontFamily: 'Roboto',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                          fontSize: 16,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                                                                                                            child: Text(
                                                                                                              '${functions.camelCase(bookingsItem.firstname)} ${functions.camelCase(bookingsItem.lastname)}',
                                                                                                              style: TextStyle(
                                                                                                                color: Colors.white,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontSize: 17,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Material(
                                                                                                        color: Colors.transparent,
                                                                                                        elevation: 1,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: 40,
                                                                                                          height: 30,
                                                                                                          constraints: BoxConstraints(
                                                                                                            maxHeight: 30,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Colors.white,
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                                                child: Container(
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxHeight: 26,
                                                                                                                  ),
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    functions.dateDay(bookingsItem.scheduledDate),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Roboto',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                          fontSize: 20,
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      height: 12,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Text(
                                                                                                                        functions.dateMonth(bookingsItem.scheduledDate),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                              fontFamily: 'Roboto',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                              fontSize: 12,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      constraints: BoxConstraints(
                                                                                                                        maxHeight: 12,
                                                                                                                      ),
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Text(
                                                                                                                        functions.dateYear(bookingsItem.scheduledDate),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                              fontFamily: 'Roboto',
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                                              fontSize: 11,
                                                                                                                              fontWeight: FontWeight.w500,
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
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                                child: StreamBuilder<List<BookedTestsRecord>>(
                                                                                                  stream: queryBookedTestsRecord(
                                                                                                    queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where('booking_ref', isEqualTo: bookingsItem.reference),
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
                                                                                                    List<BookedTestsRecord> bookedTestsContainerBookedTestsRecordList = snapshot.data;
                                                                                                    return Container(
                                                                                                      height: MediaQuery.of(context).size.height * 0.15,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                                        child: Builder(
                                                                                                          builder: (context) {
                                                                                                            final bookedTestsList = bookedTestsContainerBookedTestsRecordList?.toList() ?? [];
                                                                                                            return ListView.builder(
                                                                                                              padding: EdgeInsets.zero,
                                                                                                              primary: false,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              itemCount: bookedTestsList.length,
                                                                                                              itemBuilder: (context, bookedTestsListIndex) {
                                                                                                                final bookedTestsListItem = bookedTestsList[bookedTestsListIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                                                                                                                  child: InkWell(
                                                                                                                    onTap: () async {
                                                                                                                      if (bookedTestsListItem.sampleCollected) {
                                                                                                                        await showModalBottomSheet(
                                                                                                                          isScrollControlled: true,
                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                          context: context,
                                                                                                                          builder: (context) {
                                                                                                                            return Padding(
                                                                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                                                                              child: ViewTestResultWidget(
                                                                                                                                testedTestRef: functions.returnTestedTestRef(containerTestedTestsRecordList.toList(), bookedTestsListItem.reference),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      }
                                                                                                                    },
                                                                                                                    child: Material(
                                                                                                                      color: Colors.transparent,
                                                                                                                      elevation: 1,
                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                        borderRadius: BorderRadius.circular(16),
                                                                                                                      ),
                                                                                                                      child: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 0.8,
                                                                                                                        height: MediaQuery.of(context).size.height * 0.04,
                                                                                                                        constraints: BoxConstraints(
                                                                                                                          maxWidth: 300,
                                                                                                                        ),
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white,
                                                                                                                          borderRadius: BorderRadius.circular(16),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                            children: [
                                                                                                                              StreamBuilder<TestsRecord>(
                                                                                                                                stream: TestsRecord.getDocument(bookedTestsListItem.testRef),
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
                                                                                                                                    functions.upperCase(textTestsRecord.name).maybeHandleOverflow(
                                                                                                                                          maxChars: 17,
                                                                                                                                          replacement: '…',
                                                                                                                                        ),
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
                                                                                                                                                  if (bookedTestsListItem.sampleCollected ?? true)
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
                                                                                                                                                  if (bookedTestsListItem.hasResult ?? true)
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
                                                                                                                                                  StreamBuilder<List<TestedTestsRecord>>(
                                                                                                                                                    stream: queryTestedTestsRecord(
                                                                                                                                                      queryBuilder: (testedTestsRecord) => testedTestsRecord.where('booked_test_Ref', isEqualTo: bookedTestsListItem.reference),
                                                                                                                                                      singleRecord: true,
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
                                                                                                                                                      List<TestedTestsRecord> testVerifiedTestedTestsRecordList = snapshot.data;
                                                                                                                                                      // Return an empty Container when the document does not exist.
                                                                                                                                                      if (snapshot.data.isEmpty) {
                                                                                                                                                        return Container();
                                                                                                                                                      }
                                                                                                                                                      final testVerifiedTestedTestsRecord = testVerifiedTestedTestsRecordList.isNotEmpty ? testVerifiedTestedTestsRecordList.first : null;
                                                                                                                                                      return Container(
                                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                                          shape: BoxShape.circle,
                                                                                                                                                        ),
                                                                                                                                                        child: Visibility(
                                                                                                                                                          visible: testVerifiedTestedTestsRecord.isVerified ?? true,
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                                                                            child: Icon(
                                                                                                                                                              Icons.check_circle_outlined,
                                                                                                                                                              color: Color(0xFFF3F3F3),
                                                                                                                                                              size: 22,
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
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(16),
                                                                                                    bottomRight: Radius.circular(16),
                                                                                                    topLeft: Radius.circular(0),
                                                                                                    topRight: Radius.circular(0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 60,
                                                                                                        decoration: BoxDecoration(
                                                                                                          borderRadius: BorderRadius.circular(15),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    shape: BoxShape.circle,
                                                                                                                  ),
                                                                                                                  child: FaIcon(
                                                                                                                    FontAwesomeIcons.flask,
                                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                                    size: 14,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Container(
                                                                                                                width: 20,
                                                                                                                height: 20,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  shape: BoxShape.circle,
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(3, 0, 2, 3),
                                                                                                                      child: Text(
                                                                                                                        bookingsItem.testsIncluded.length.toString().maybeHandleOverflow(maxChars: 2),
                                                                                                                        textAlign: TextAlign.center,
                                                                                                                        style: TextStyle(
                                                                                                                          color: Colors.white,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          fontSize: 14,
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
                                                                                                        width: 110,
                                                                                                        height: 32,
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxHeight: 32,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0x4CFFFFFF),
                                                                                                          boxShadow: [
                                                                                                            BoxShadow(
                                                                                                              blurRadius: 4,
                                                                                                              color: Color(0x32171717),
                                                                                                              offset: Offset(0, 2),
                                                                                                            )
                                                                                                          ],
                                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.verified_outlined,
                                                                                                                color: Colors.white,
                                                                                                                size: 20,
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                                                child: Text(
                                                                                                                  'Confirmed',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                StreamBuilder<
                                                    List<PaymentsRecord>>(
                                                  stream: queryPaymentsRecord(
                                                    queryBuilder:
                                                        (paymentsRecord) =>
                                                            paymentsRecord.where(
                                                                'user_ref',
                                                                isEqualTo: widget
                                                                    .userRef),
                                                  ),
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
                                                    List<PaymentsRecord>
                                                        containerPaymentsRecordList =
                                                        snapshot.data;
                                                    return Container(
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
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 20,
                                                                    0, 0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final payments =
                                                                containerPaymentsRecordList
                                                                        ?.toList() ??
                                                                    [];
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  payments
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  paymentsIndex) {
                                                                final paymentsItem =
                                                                    payments[
                                                                        paymentsIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          3,
                                                                          0,
                                                                          4),
                                                                  child: StreamBuilder<
                                                                      PaymentsRecord>(
                                                                    stream: PaymentsRecord.getDocument(
                                                                        paymentsItem
                                                                            .reference),
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
                                                                                  paymentRef: paymentsItem,
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
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
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 320,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                                    maxWidth: 70,
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
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [],
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
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x00FFFFFF),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: EditUserRoleWidget(
                                  userRef: widget.userRef,
                                ),
                              );
                            },
                          );
                        },
                        text: 'Edit Role',
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
