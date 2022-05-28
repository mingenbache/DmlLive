import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/edit_user_details_copy_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final accountUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(),
                child: ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Image.asset(
                      'assets/images/kira-auf-der-heide-_Zd6COnH5E8-unsplash_reduced.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x25000000),
                      FlutterFlowTheme.of(context).tertiaryColor,
                      FlutterFlowTheme.of(context).primaryColor
                    ],
                    stops: [0, 0.6, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TopActionsWidget(),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                              child: Text(
                                'MY ACCOUNT',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 80,
                                    decoration: BoxDecoration(),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Color(0x00FFFFFF),
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: EditUserDetailsCopyWidget(
                                                userRef: accountUsersRecord
                                                    .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Edit',
                                      icon: Icon(
                                        Icons.edit_sharp,
                                        size: 16,
                                      ),
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 30,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                            ),
                                        elevation: 2,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            'Name:',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 2, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0x2BFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 6, 0, 0),
                                            child: Text(
                                              accountUsersRecord.firstName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Phone:',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 2, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0x2CFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 6, 0, 6),
                                            child: Text(
                                              accountUsersRecord.phoneNumber,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Email:',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0x2BFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 6, 0, 6),
                                          child: Text(
                                            accountUsersRecord.email,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.normal,
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
                                    EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'D.O.B:',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 5, 5),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0x2BFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 11, 0, 6),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat('d/M/y',
                                                    accountUsersRecord.dOB),
                                                'Date of Birth',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child: Text(
                                            'Sex:',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x2BFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 5, 0, 0),
                                                      child: Text(
                                                        accountUsersRecord.sex,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
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
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                              child: Text(
                                'Account Settings',
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
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      context.pushNamed('MyBookings');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Icon(
                                                Icons.subtitles_rounded,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Text(
                                                'Test History',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.9, 0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 18,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed('Settings');
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Icon(
                                                Icons.settings_rounded,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Text(
                                                'My Settings',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.9, 0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 18,
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.solidBell,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Text(
                                              'My Notifications',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0.9, 0),
                                              child: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 18,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Icon(
                                            Icons.text_snippet,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'Terms of Service',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.9, 0),
                                            child: Icon(
                                              Icons.keyboard_arrow_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 18,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await signOut();
                                  context.goNamedAuth('Login', mounted);
                                },
                                text: 'Log Out',
                                options: FFButtonOptions(
                                  width: 90,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
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
        );
      },
    );
  }
}
