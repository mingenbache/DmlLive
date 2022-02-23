import '../backend/backend.dart';
import '../components/user_activity_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientUserCardWidget extends StatefulWidget {
  const ClientUserCardWidget({
    Key key,
    this.userRecord,
  }) : super(key: key);

  final UsersRecord userRecord;

  @override
  _ClientUserCardWidgetState createState() => _ClientUserCardWidgetState();
}

class _ClientUserCardWidgetState extends State<ClientUserCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              constraints: BoxConstraints(
                maxWidth: 315,
                maxHeight: 220,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Color(0x4B1A1F24),
                    offset: Offset(0, 2),
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primaryColor,
                    FlutterFlowTheme.of(context).tertiaryColor
                  ],
                  stops: [1, 1],
                  begin: AlignmentDirectional(0.94, -1),
                  end: AlignmentDirectional(-0.94, 1),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 15, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.userInjured,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 40,
                          ),
                          Text(
                            '${functions.camelCase(widget.userRecord.firstName)} ${functions.camelCase(widget.userRecord.lastName)}',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
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
                                  Icons.phone,
                                  color: Color(0xFFFFFFFE),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.userRecord.phoneNumber,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
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
                          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
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
                                      'd/M/y', widget.userRecord.createdTime),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 20, 0),
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
                                      'd/M/y', widget.userRecord.lastLogin),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 30,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Icon(
                                        Icons.format_list_numbered_sharp,
                                        color: Color(0xFFFCFCFC),
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<BookedTestsRecord>>(
                                stream: queryBookedTestsRecord(
                                  queryBuilder: (bookedTestsRecord) =>
                                      bookedTestsRecord.where('user',
                                          isEqualTo:
                                              widget.userRecord.reference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitDoubleBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<BookedTestsRecord>
                                      textBookedTestsRecordList = snapshot.data;
                                  return Text(
                                    textBookedTestsRecordList.length.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  if (widget.userRecord.hasCurrentBooking ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Icon(
                                        Icons.playlist_play,
                                        color: Color(0xFFFCFCFC),
                                        size: 24,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Icon(
                                      Icons.playlist_play,
                                      color: Color(0x48FFFFFF),
                                      size: 24,
                                    ),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
