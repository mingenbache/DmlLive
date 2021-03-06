import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TestActionsWidgetWidget extends StatefulWidget {
  const TestActionsWidgetWidget({
    Key key,
    this.test,
    this.bookingRef,
  }) : super(key: key);

  final TestsRecord test;
  final DocumentReference bookingRef;

  @override
  _TestActionsWidgetWidgetState createState() =>
      _TestActionsWidgetWidgetState();
}

class _TestActionsWidgetWidgetState extends State<TestActionsWidgetWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
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
    return AuthUserStreamWidget(
      child: StreamBuilder<BookingsRecord>(
        stream: BookingsRecord.getDocument(currentUserDocument?.currentBooking),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          final containerBookingsRecord = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxWidth: 330,
              maxHeight: 80,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF58585C),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 22),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Chat',
                    icon: FaIcon(
                      FontAwesomeIcons.comment,
                      size: 20,
                    ),
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0x00B3B2B2),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: 30,
                    ),
                  ).animated(
                      [animationsMap['buttonOnActionTriggerAnimation1']]),
                  FFButtonWidget(
                    onPressed: () async {
                      if (!(containerBookingsRecord.testsIncluded
                          .toList()
                          .contains(widget.test.reference))) {
                        final bookingsUpdateData = {
                          'tests_included':
                              FieldValue.arrayUnion([widget.test.reference]),
                        };
                        await containerBookingsRecord.reference
                            .update(bookingsUpdateData);
                      }
                    },
                    text: 'Add to Cart',
                    icon: FaIcon(
                      FontAwesomeIcons.shoppingBasket,
                      size: 20,
                    ),
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0x00B3B2B2),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Color(0xFFBACA68),
                                fontWeight: FontWeight.w300,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  ).animated(
                      [animationsMap['buttonOnActionTriggerAnimation2']]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
