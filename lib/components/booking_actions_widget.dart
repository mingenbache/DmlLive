import '../backend/backend.dart';
import '../components/new_invoice_sheet_widget.dart';
import '../components/report_wizard_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingActionsWidget extends StatefulWidget {
  const BookingActionsWidget({
    Key key,
    this.bookingRef,
  }) : super(key: key);

  final BookingsRecord bookingRef;

  @override
  _BookingActionsWidgetState createState() => _BookingActionsWidgetState();
}

class _BookingActionsWidgetState extends State<BookingActionsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 1020,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.9,
        opacity: 0,
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
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Container(
        width: 240,
        height: 80,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: NewInvoiceSheetWidget(
                            bookingRef: widget.bookingRef.reference,
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.fileInvoiceDollar,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          size: 25,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 45,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Invoice',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animated(
                    [animationsMap['containerOnActionTriggerAnimation']]),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.receipt,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 25,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Receipt',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      if (widget.bookingRef.resultPublished ?? true)
                        InkWell(
                          onTap: () async {
                            context.pushNamed(
                              'BookingReport',
                              queryParams: {
                                'bookingRef': serializeParam(
                                    widget.bookingRef.reference,
                                    ParamType.DocumentReference),
                              },
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.library_books,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 25,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 45,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        'Report',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!(widget.bookingRef.resultPublished) ?? true)
                        InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: ReportWizardWidget(
                                    booking: widget.bookingRef,
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.library_books,
                                  color: Color(0x4CFFFFFF),
                                  size: 25,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 45,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        'Report',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0x4CFFFFFF),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
