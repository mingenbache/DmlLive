import '../bookings_schedule/bookings_schedule_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../payments_list/payments_list_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardMenuWidgetLightWidget extends StatefulWidget {
  const DashboardMenuWidgetLightWidget({Key key}) : super(key: key);

  @override
  _DashboardMenuWidgetLightWidgetState createState() =>
      _DashboardMenuWidgetLightWidgetState();
}

class _DashboardMenuWidgetLightWidgetState
    extends State<DashboardMenuWidgetLightWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 500,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.4,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 500,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.4,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 500,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.4,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00FFFFFF),
                FlutterFlowTheme.of(context).primaryColor
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: BookingsScheduleWidget(),
                        ),
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.fast_rewind,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 40,
                            ),
                            Text(
                              'PREVIOUS\nTESTS',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animated(
                      [animationsMap['containerOnActionTriggerAnimation1']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingsScheduleWidget(),
                        ),
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.height * 0.11,
                        decoration: BoxDecoration(
                          color: Color(0xFF88993A),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule_send,
                              color: Colors.white,
                              size: 40,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                              child: AutoSizeText(
                                'UPCOMING\nTESTS',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animated(
                      [animationsMap['containerOnActionTriggerAnimation2']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentsListWidget(),
                        ),
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.height * 0.11,
                        decoration: BoxDecoration(
                          color: Color(0x69BACA68),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              'PAYMENTS',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animated(
                      [animationsMap['containerOnActionTriggerAnimation3']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: MediaQuery.of(context).size.height * 0.11,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0, 0.30000000000000004),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 40,
                        ),
                        Text(
                          'HELP',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF586B06),
                                    fontSize: 12,
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
    );
  }
}
