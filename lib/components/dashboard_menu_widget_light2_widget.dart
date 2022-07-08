import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardMenuWidgetLight2Widget extends StatefulWidget {
  const DashboardMenuWidgetLight2Widget({Key key}) : super(key: key);

  @override
  _DashboardMenuWidgetLight2WidgetState createState() =>
      _DashboardMenuWidgetLight2WidgetState();
}

class _DashboardMenuWidgetLight2WidgetState
    extends State<DashboardMenuWidgetLight2Widget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.095,
            constraints: BoxConstraints(
              maxWidth: 550,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryColor,
                  Color(0x00FFFFFF)
                ],
                stops: [0.1, 0.6],
                begin: AlignmentDirectional(0, 1),
                end: AlignmentDirectional(0, -1),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 110,
            constraints: BoxConstraints(
              maxWidth: 550,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('MyBookings');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: 130,
                        constraints: BoxConstraints(
                          maxWidth: 120,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 12,
                              borderWidth: 1,
                              buttonSize: 70,
                              fillColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              icon: Icon(
                                Icons.fast_rewind,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 40,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                              child: AutoSizeText(
                                'PREVIOUS\nTESTS',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('MyBookings');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        constraints: BoxConstraints(
                          maxWidth: 120,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 12,
                              buttonSize: 70,
                              fillColor: Color(0xFF88993A),
                              icon: Icon(
                                Icons.schedule_send,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                              child: AutoSizeText(
                                'UPCOMING\nTESTS',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('myInvoiceList');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        constraints: BoxConstraints(
                          maxWidth: 120,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 12,
                              borderWidth: 1,
                              buttonSize: 70,
                              fillColor: Color(0xA958595B),
                              icon: Icon(
                                Icons.payments_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: AutoSizeText(
                                  'INVOICES',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      constraints: BoxConstraints(
                        maxWidth: 120,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0, 0.30000000000000004),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 12,
                            borderWidth: 1,
                            buttonSize: 70,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.help_outline_sharp,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                              child: AutoSizeText(
                                'HELP',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
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
    );
  }
}
