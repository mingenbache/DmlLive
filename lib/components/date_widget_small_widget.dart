import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DateWidgetSmallWidget extends StatefulWidget {
  const DateWidgetSmallWidget({
    Key? key,
    this.date,
  }) : super(key: key);

  final DateTime? date;

  @override
  _DateWidgetSmallWidgetState createState() => _DateWidgetSmallWidgetState();
}

class _DateWidgetSmallWidgetState extends State<DateWidgetSmallWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 30,
        constraints: BoxConstraints(
          maxWidth: 80,
          maxHeight: 30,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 26,
                  ),
                  decoration: BoxDecoration(),
                  child: Text(
                    functions.dateDay(widget.date),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                        functions.dateMonth(widget.date),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                        functions.dateYear(widget.date),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
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
    );
  }
}
