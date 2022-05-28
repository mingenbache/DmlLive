import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DuplicateTestItemWidget extends StatefulWidget {
  const DuplicateTestItemWidget({
    Key key,
    this.booking,
    this.packageRef,
  }) : super(key: key);

  final BookingsRecord booking;
  final DocumentReference packageRef;

  @override
  _DuplicateTestItemWidgetState createState() =>
      _DuplicateTestItemWidgetState();
}

class _DuplicateTestItemWidgetState extends State<DuplicateTestItemWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TestPackagesRecord>(
      stream: TestPackagesRecord.getDocument(widget.packageRef),
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
        final duplicateTestsContainerTestPackagesRecord = snapshot.data;
        return Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StreamBuilder<List<TestPackagesRecord>>(
                stream: queryTestPackagesRecord(),
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
                  List<TestPackagesRecord> containerTestPackagesRecordList =
                      snapshot.data;
                  return Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Error',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF586B06),
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    context.pop();
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 48,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 20,
                              decoration: BoxDecoration(),
                              child: Text(
                                'This Test is already in your Booking.\n',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Please remove the package to proceed with adding this Test .',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                child: Builder(
                                  builder: (context) {
                                    final duplicatetestPackage = functions
                                            .returnPackagesContainingDuplicateTests(
                                                functions
                                                    .returnPackagesinBooking(
                                                        containerTestPackagesRecordList
                                                            .toList(),
                                                        widget.booking
                                                            .testPackages
                                                            .toList())
                                                    .toList(),
                                                FFAppState()
                                                    .duplicateTests
                                                    .toList())
                                            ?.toList() ??
                                        [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: duplicatetestPackage.length,
                                      itemBuilder:
                                          (context, duplicatetestPackageIndex) {
                                        final duplicatetestPackageItem =
                                            duplicatetestPackage[
                                                duplicatetestPackageIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 5, 10, 0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 10, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                duplicatetestPackageItem
                                                                    .packageName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                if (widget
                                                                    .booking
                                                                    .testPackages
                                                                    .toList()
                                                                    .contains(
                                                                        duplicatetestPackageItem
                                                                            .reference)) {
                                                                  final bookingsUpdateData =
                                                                      {
                                                                    ...createBookingsRecordData(
                                                                      totalPrice: functions.removeFromCart(
                                                                          widget
                                                                              .booking
                                                                              .totalPrice,
                                                                          duplicatetestPackageItem
                                                                              .price),
                                                                    ),
                                                                    'testPackages':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      widget
                                                                          .packageRef
                                                                    ]),
                                                                    'testPackTests': functions.removeBookingPackageTests(
                                                                        duplicateTestsContainerTestPackagesRecord
                                                                            .testsIncluded
                                                                            .toList(),
                                                                        widget
                                                                            .booking
                                                                            .testPackTests
                                                                            .toList()),
                                                                  };
                                                                  await widget
                                                                      .booking
                                                                      .reference
                                                                      .update(
                                                                          bookingsUpdateData);
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Test Package Removed',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0x00000000),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .highlight_off,
                                                                color: Colors
                                                                    .white,
                                                                size: 18,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 3, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 3, 0, 0),
                                                      child: StreamBuilder<
                                                          TestsRecord>(
                                                        stream: TestsRecord
                                                            .getDocument(
                                                                FFAppState()
                                                                    .duplicateTest),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitRipple(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final containerTestsRecord =
                                                              snapshot.data;
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Container(
                                                              width: 100,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      functions.camelCase(
                                                                          containerTestsRecord
                                                                              .name),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Retry',
                          options: FFButtonOptions(
                            width: 300,
                            height: 70,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Tap above to complete request',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
