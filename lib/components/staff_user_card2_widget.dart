import '../backend/backend.dart';
import '../components/user_activity_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StaffUserCard2Widget extends StatefulWidget {
  const StaffUserCard2Widget({
    Key? key,
    this.userRecord,
  }) : super(key: key);

  final UsersRecord? userRecord;

  @override
  _StaffUserCard2WidgetState createState() => _StaffUserCard2WidgetState();
}

class _StaffUserCard2WidgetState extends State<StaffUserCard2Widget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 30,
                  constraints: BoxConstraints(
                    maxWidth: 315,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (widget.userRecord!.role == 'patho')
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Image.asset(
                            'assets/images/doctor_icon@2x.png',
                            height: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      if (widget.userRecord!.role == 'front')
                        Image.asset(
                          'assets/images/reception@2x.png',
                          fit: BoxFit.fitHeight,
                        ),
                      if (widget.userRecord!.role == 'tech')
                        Image.asset(
                          'assets/images/technologist@2x.png',
                          fit: BoxFit.fitWidth,
                        ),
                      if (widget.userRecord!.role == 'super')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                          child: Image.asset(
                            'assets/images/super.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                    ],
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
                          userRef: widget.userRecord!.reference,
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    constraints: BoxConstraints(
                      maxWidth: 315,
                      maxHeight: 180,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: double.infinity,
                      color: Color(0x00000000),
                      child: ExpandableNotifier(
                        initialExpanded: false,
                        child: ExpandablePanel(
                          header: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            constraints: BoxConstraints(
                              maxHeight: 62,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${functions.camelCase(widget.userRecord!.firstName)} ${functions.camelCase(widget.userRecord!.lastName)}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          collapsed: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0x8A000000),
                                    ),
                              ),
                            ),
                          ),
                          expanded: Container(
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
                              borderRadius: BorderRadius.circular(8),
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
                                        widget.userRecord!.email!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              dateTimeFormat(
                                                  'd/M/y',
                                                  widget.userRecord!
                                                      .createdTime!),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                              dateTimeFormat(
                                                  'd/M/y',
                                                  widget
                                                      .userRecord!.lastLogin!),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
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
                                              widget.userRecord!.role!,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                          theme: ExpandableThemeData(
                            tapHeaderToExpand: true,
                            tapBodyToExpand: false,
                            tapBodyToCollapse: false,
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            hasIcon: true,
                          ),
                        ),
                      ),
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
