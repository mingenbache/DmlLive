import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardMenuWidgetWidget extends StatefulWidget {
  const DashboardMenuWidgetWidget({Key key}) : super(key: key);

  @override
  _DashboardMenuWidgetWidgetState createState() =>
      _DashboardMenuWidgetWidgetState();
}

class _DashboardMenuWidgetWidgetState extends State<DashboardMenuWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 12, 5, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0.9),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.045,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            'Previous Tests',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.55),
                        child: SvgPicture.asset(
                          'assets/images/previous.svg',
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.04,
                          fit: BoxFit.fitHeight,
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
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0, 0.30000000000000004),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.045,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            'Upcoming Tests',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.55),
                        child: SvgPicture.asset(
                          'assets/images/schedule.svg',
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.04,
                          fit: BoxFit.fitHeight,
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
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0, 0.30000000000000004),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.045,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            'Payments',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.05, -0.55),
                        child: Icon(
                          Icons.payments,
                          color: Color(0xFFB3B2B2),
                          size: 32,
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
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0, 0.30000000000000004),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.045,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            'Help Center',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.5),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Color(0xFFB3B2B2),
                          size: 32,
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
    );
  }
}
