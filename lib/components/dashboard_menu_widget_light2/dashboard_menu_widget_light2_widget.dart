import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_menu_widget_light2_model.dart';
export 'dashboard_menu_widget_light2_model.dart';

class DashboardMenuWidgetLight2Widget extends StatefulWidget {
  const DashboardMenuWidgetLight2Widget({Key? key}) : super(key: key);

  @override
  _DashboardMenuWidgetLight2WidgetState createState() =>
      _DashboardMenuWidgetLight2WidgetState();
}

class _DashboardMenuWidgetLight2WidgetState
    extends State<DashboardMenuWidgetLight2Widget> {
  late DashboardMenuWidgetLight2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardMenuWidgetLight2Model());

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

    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.095,
            constraints: BoxConstraints(
              maxWidth: 550.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  Color(0x00FFFFFF)
                ],
                stops: [0.1, 0.6],
                begin: AlignmentDirectional(0.0, 1.0),
                end: AlignmentDirectional(0, -1.0),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 110.0,
            constraints: BoxConstraints(
              maxWidth: 550.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('MyBookings');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: 130.0,
                        constraints: BoxConstraints(
                          maxWidth: 120.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              buttonSize: 70.0,
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                Icons.fast_rewind,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 40.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'PREVIOUS\nTESTS',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14.0,
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
                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('MyBookings');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        constraints: BoxConstraints(
                          maxWidth: 120.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          shape: BoxShape.rectangle,
                        ),
                        alignment:
                            AlignmentDirectional(0.0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 12.0,
                              buttonSize: 70.0,
                              fillColor: Color(0xFF88993A),
                              icon: Icon(
                                Icons.schedule_send,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'UPCOMING\nTESTS',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14.0,
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
                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('myInvoiceList');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        constraints: BoxConstraints(
                          maxWidth: 120.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          shape: BoxShape.rectangle,
                        ),
                        alignment:
                            AlignmentDirectional(0.0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              buttonSize: 70.0,
                              fillColor: Color(0xA958595B),
                              icon: Icon(
                                Icons.payments_outlined,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'INVOICES',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 14.0,
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
                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      constraints: BoxConstraints(
                        maxWidth: 120.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 12.0,
                            borderWidth: 1.0,
                            buttonSize: 70.0,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.help_outline_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Container(
                            height: 30.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'HELP',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14.0,
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
