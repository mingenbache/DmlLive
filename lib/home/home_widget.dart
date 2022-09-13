import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/client_notifications_widget_widget.dart';
import '../components/new_booking_sheet_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1730,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.isStaff, false)) {
        context.goNamed('HomeAdmin');

        Navigator.pop(context);
        return;
      } else {
        return;
      }
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-0.05, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference!),
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
            final homeUsersRecord = snapshot.data!;
            return Scaffold(
              key: scaffoldKey,
              floatingActionButton: Visibility(
                visible: !homeUsersRecord.isStaff!,
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    setState(() => FFAppState().lastBookingPage = false);
                    if (homeUsersRecord.hasCurrentBooking!) {
                      context.pushNamed(
                        'NewBooking',
                        queryParams: {
                          'bookingRef': serializeParam(
                              homeUsersRecord.currentBooking,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    } else {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0x00F9F9F9),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: NewBookingSheetWidget(),
                          );
                        },
                      );
                    }
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  icon: Icon(
                    Icons.add_sharp,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  elevation: 8,
                  label: Text(
                    'Request a Test',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ).animated([
                  animationsMap['floatingActionButtonOnPageLoadAnimation']!
                ]),
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).secondaryText,
                                  FlutterFlowTheme.of(context).secondaryColor
                                ],
                                stops: [0.3, 0.6],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxHeight: 360,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            bottomRight: Radius.circular(16),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: ClipRect(
                                          child: ImageFiltered(
                                            imageFilter: ImageFilter.blur(
                                              sigmaX: 1,
                                              sigmaY: 1,
                                            ),
                                            child: Image.asset(
                                              'assets/images/francisco-venancio-M4Xloxsg0Gw-unsplash.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xB16CD7B7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText
                                            ],
                                            stops: [0.2, 0.5],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 30, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.45,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 200,
                                                      maxHeight: 50,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 5, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          if (homeUsersRecord
                                                                  .hasCurrentBooking ??
                                                              true)
                                                            StreamBuilder<
                                                                BookingsRecord>(
                                                              stream: BookingsRecord
                                                                  .getDocument(
                                                                      homeUsersRecord
                                                                          .currentBooking!),
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
                                                                final badgeBookingsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Badge(
                                                                  badgeContent:
                                                                      Text(
                                                                    badgeBookingsRecord
                                                                        .testsIncluded!
                                                                        .toList()
                                                                        .length
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                  ),
                                                                  showBadge:
                                                                      badgeBookingsRecord
                                                                              .totalTests! >
                                                                          0,
                                                                  shape:
                                                                      BadgeShape
                                                                          .circle,
                                                                  badgeColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  elevation: 4,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          4,
                                                                          4,
                                                                          4),
                                                                  position:
                                                                      BadgePosition
                                                                          .topStart(),
                                                                  animationType:
                                                                      BadgeAnimationType
                                                                          .scale,
                                                                  toAnimate:
                                                                      true,
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        40,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .shopping_basket,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 23,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'NewBooking',
                                                                        queryParams:
                                                                            {
                                                                          'bookingRef': serializeParam(
                                                                              homeUsersRecord.currentBooking,
                                                                              ParamType.DocumentReference),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 40,
                                                            icon: Icon(
                                                              Icons
                                                                  .person_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 25,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'myAccount');
                                                            },
                                                          ),
                                                          if (valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.isStaff,
                                                              false))
                                                            AuthUserStreamWidget(
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 40,
                                                                icon: Icon(
                                                                  Icons
                                                                      .local_police,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 25,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context.pushNamed(
                                                                      'HomeAdmin');
                                                                },
                                                              ),
                                                            ),
                                                          AuthUserStreamWidget(
                                                            child: StreamBuilder<
                                                                List<
                                                                    ChatsRecord>>(
                                                              stream:
                                                                  queryChatsRecord(
                                                                queryBuilder: (chatsRecord) => chatsRecord
                                                                    .where(
                                                                        'user_a',
                                                                        isEqualTo:
                                                                            currentUserReference)
                                                                    .where(
                                                                        'last_message_time',
                                                                        isGreaterThan:
                                                                            currentUserDocument!.lastLogin),
                                                                singleRecord:
                                                                    true,
                                                              ),
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
                                                                List<ChatsRecord>
                                                                    badgeChatsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final badgeChatsRecord =
                                                                    badgeChatsRecordList
                                                                            .isNotEmpty
                                                                        ? badgeChatsRecordList
                                                                            .first
                                                                        : null;
                                                                return Badge(
                                                                  badgeContent:
                                                                      Text(
                                                                    '1',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                  ),
                                                                  showBadge:
                                                                      badgeChatsRecord !=
                                                                          null,
                                                                  shape:
                                                                      BadgeShape
                                                                          .circle,
                                                                  badgeColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  elevation: 4,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                                  position:
                                                                      BadgePosition
                                                                          .topEnd(),
                                                                  animationType:
                                                                      BadgeAnimationType
                                                                          .scale,
                                                                  toAnimate:
                                                                      true,
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          UsersRecord>>(
                                                                    future:
                                                                        queryUsersRecordOnce(
                                                                      queryBuilder: (usersRecord) => usersRecord.where(
                                                                          'role',
                                                                          isEqualTo:
                                                                              'front'),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
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
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<UsersRecord>
                                                                          iconButtonUsersRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the document does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final iconButtonUsersRecord = iconButtonUsersRecordList
                                                                              .isNotEmpty
                                                                          ? iconButtonUsersRecordList
                                                                              .first
                                                                          : null;
                                                                      return FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            40,
                                                                        fillColor:
                                                                            Color(0x00FFFFFF),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .message_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              25,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'Chat',
                                                                            queryParams:
                                                                                {
                                                                              'chatUser': serializeParam(iconButtonUsersRecord, ParamType.Document),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'chatUser': iconButtonUsersRecord,
                                                                            },
                                                                          );
                                                                        },
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
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(5, 10,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Welcome,',
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          27,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AutoSizeText(
                                                                homeUsersRecord
                                                                    .firstName!
                                                                    .maybeHandleOverflow(
                                                                        maxChars:
                                                                            13),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        ClientNotificationsWidgetWidget(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    indent: 30,
                                    endIndent: 30,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 3, 0, 0),
                                        child: Text(
                                          'Dashboard',
                                          style: FlutterFlowTheme.of(context)
                                              .title3
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      constraints: BoxConstraints(
                                        maxWidth: 500,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              context.pushNamed('myReportList');
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              constraints: BoxConstraints(
                                                maxWidth: 300,
                                              ),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/IMG_4444_reduced.jpg',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
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
                                                      0.6,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.1,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x98006392),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      10, 0, 0),
                                                          child: Text(
                                                            'TEST\nREPORTS',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            '1',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize: 80,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: BoxDecoration(),
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 1,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              setState(() => FFAppState()
                                                  .testsVar = 'upcoming');

                                              context.pushNamed(
                                                'MyBookings',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
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
                                                width: 100,
                                                constraints: BoxConstraints(
                                                  maxHeight:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.19,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    AutoSizeText(
                                                                  'TESTS',
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    AutoSizeText(
                                                                  'TODAY',
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 0, 0),
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
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            BookedTestsRecord>>(
                                                                      stream:
                                                                          queryBookedTestsRecord(
                                                                        queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where(
                                                                            'user',
                                                                            isEqualTo:
                                                                                currentUserReference),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitRipple(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<BookedTestsRecord>
                                                                            textBookedTestsRecordList =
                                                                            snapshot.data!;
                                                                        return AutoSizeText(
                                                                          functions
                                                                              .checkNewTests(textBookedTestsRecordList.toList())
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 40,
                                                                              ),
                                                                        );
                                                                      },
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
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              setState(() => FFAppState()
                                                  .paymentsvar = 'invoices');

                                              context.pushNamed('myPayments');
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 8, 0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: AutoSizeText(
                                                            'OUTSTANDING',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 8, 0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: AutoSizeText(
                                                            'INVOICES',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.1,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      InvoicesRecord>>(
                                                                stream:
                                                                    queryInvoicesRecord(
                                                                  queryBuilder: (invoicesRecord) => invoicesRecord
                                                                      .where(
                                                                          'user',
                                                                          isEqualTo:
                                                                              currentUserReference)
                                                                      .where(
                                                                          'is_paid',
                                                                          isNotEqualTo:
                                                                              true),
                                                                ),
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
                                                                  List<InvoicesRecord>
                                                                      textInvoicesRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    functions
                                                                        .returnInvoiceListSize(textInvoicesRecordList
                                                                            .map((e) =>
                                                                                e.reference)
                                                                            .toList())
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              54,
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
