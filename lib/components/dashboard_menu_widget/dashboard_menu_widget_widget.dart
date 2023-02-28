import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_menu_widget_model.dart';
export 'dashboard_menu_widget_model.dart';

class DashboardMenuWidgetWidget extends StatefulWidget {
  const DashboardMenuWidgetWidget({Key? key}) : super(key: key);

  @override
  _DashboardMenuWidgetWidgetState createState() =>
      _DashboardMenuWidgetWidgetState();
}

class _DashboardMenuWidgetWidgetState extends State<DashboardMenuWidgetWidget> {
  late DashboardMenuWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardMenuWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.9),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
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
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12.0,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.55),
                        child: SvgPicture.asset(
                          'assets/images/previous.svg',
                          width: 100.0,
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
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
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
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12.0,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.55),
                        child: SvgPicture.asset(
                          'assets/images/schedule.svg',
                          width: 100.0,
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
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
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
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12.0,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.05, -0.55),
                        child: Icon(
                          Icons.payments,
                          color: Color(0xFFB3B2B2),
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xFF58595B),
                  borderRadius: BorderRadius.circular(25.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
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
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFFBACA68),
                                      fontSize: 12.0,
                                    ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.5),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Color(0xFFB3B2B2),
                          size: 32.0,
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
