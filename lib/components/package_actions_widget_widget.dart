import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/duplicate_tests_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageActionsWidgetWidget extends StatefulWidget {
  const PackageActionsWidgetWidget({
    Key key,
    this.package,
    this.bookingRef,
  }) : super(key: key);

  final TestPackagesRecord package;
  final DocumentReference bookingRef;

  @override
  _PackageActionsWidgetWidgetState createState() =>
      _PackageActionsWidgetWidgetState();
}

class _PackageActionsWidgetWidgetState extends State<PackageActionsWidgetWidget>
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthUserStreamWidget(
          child: StreamBuilder<BookingsRecord>(
            stream:
                BookingsRecord.getDocument(currentUserDocument?.currentBooking),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitRipple(
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
                      FutureBuilder<List<UsersRecord>>(
                        future: queryUsersRecordOnce(
                          queryBuilder: (usersRecord) =>
                              usersRecord.where('role', isEqualTo: 'front'),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitRipple(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> buttonUsersRecordList =
                              snapshot.data;
                          final buttonUsersRecord =
                              buttonUsersRecordList.isNotEmpty
                                  ? buttonUsersRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'Chat',
                                queryParams: {
                                  'chatUser': serializeParam(
                                      buttonUsersRecord, ParamType.Document),
                                },
                                extra: <String, dynamic>{
                                  'chatUser': buttonUsersRecord,
                                },
                              );
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: 30,
                            ),
                          ).animated([
                            animationsMap['buttonOnActionTriggerAnimation1']
                          ]);
                        },
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (functions.checkTestPackageBookingHasDuplicates(
                              functions
                                  .returnAllBookingTests(
                                      containerBookingsRecord.testPackTests
                                          .toList(),
                                      containerBookingsRecord.testsIncluded
                                          .toList())
                                  .toList(),
                              widget.package.testsIncluded.toList())) {
                            setState(() => FFAppState().duplicateTests =
                                functions
                                    .returnDuplicateTestsinBooking(
                                        functions
                                            .returnAllBookingTests(
                                                containerBookingsRecord
                                                    .testPackTests
                                                    .toList(),
                                                containerBookingsRecord
                                                    .testsIncluded
                                                    .toList())
                                            .toList(),
                                        widget.package.testsIncluded.toList())
                                    .toList());
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: DuplicateTestsWidget(
                                    booking: containerBookingsRecord,
                                  ),
                                );
                              },
                            );
                          } else {
                            if (!(containerBookingsRecord.testPackages
                                .toList()
                                .contains(widget.package.reference))) {
                              final bookingsUpdateData = {
                                ...createBookingsRecordData(
                                  totalPrice: functions.addCartTotal(
                                      containerBookingsRecord.totalPrice,
                                      widget.package.price),
                                ),
                                'total_tests': FieldValue.increment(1),
                                'testPackages': FieldValue.arrayUnion(
                                    [widget.package.reference]),
                                'testPackTests':
                                    functions.addBookingPackageTests(
                                        containerBookingsRecord.testPackTests
                                            .toList(),
                                        widget.package.testsIncluded.toList()),
                              };
                              await containerBookingsRecord.reference
                                  .update(bookingsUpdateData);
                              context.pop();
                            } else {
                              return;
                            }
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
        ),
      ],
    );
  }
}
