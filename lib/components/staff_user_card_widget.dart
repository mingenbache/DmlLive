import '../backend/backend.dart';
import '../components/user_activity_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffUserCardWidget extends StatefulWidget {
  const StaffUserCardWidget({
    Key key,
    this.userRecord,
  }) : super(key: key);

  final UsersRecord userRecord;

  @override
  _StaffUserCardWidgetState createState() => _StaffUserCardWidgetState();
}

class _StaffUserCardWidgetState extends State<StaffUserCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.24,
                constraints: BoxConstraints(
                  maxWidth: 315,
                  maxHeight: 180,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 4,
                      sigmaY: 4,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/kira-auf-der-heide-_Zd6COnH5E8-unsplash.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: UserActivityWidget(
                          userRef: widget.userRecord.reference,
                        ),
                      );
                    },
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.24,
                    constraints: BoxConstraints(
                      maxWidth: 315,
                      maxHeight: 180,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x44262D34),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          constraints: BoxConstraints(
                            maxHeight: 62,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xB1FFFFFF),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if ((widget.userRecord.role) == 'patho')
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/doctor.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if ((widget.userRecord.role) == 'client')
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/patient.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if ((widget.userRecord.role) == 'tech')
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/technician.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if ((widget.userRecord.role) == 'front')
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/reception.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    if ((widget.userRecord.role) == 'admin')
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/reception.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  '${functions.camelCase(widget.userRecord.firstName)} ${functions.camelCase(widget.userRecord.lastName)}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          constraints: BoxConstraints(
                            maxHeight: 120,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x72586B06), Color(0xB088993A)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 30,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.email_outlined,
                                            color: Color(0xFFFFFFFE),
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      widget.userRecord.email,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 30,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.userPlus,
                                                color: Color(0xFFFFFFFE),
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            dateTimeFormat('d/M/y',
                                                widget.userRecord.createdTime),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 30,
                                          decoration: BoxDecoration(),
                                          child: FaIcon(
                                            FontAwesomeIcons.userClock,
                                            color: Color(0xFFFFFFFE),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 75,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            dateTimeFormat('d/M/y',
                                                widget.userRecord.lastLogin),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.8, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 32,
                                    constraints: BoxConstraints(
                                      maxWidth: 130,
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
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.verified_user_sharp,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 0, 0, 0),
                                          child: Text(
                                            widget.userRecord.role,
                                            textAlign: TextAlign.center,
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
      ],
    );
  }
}
