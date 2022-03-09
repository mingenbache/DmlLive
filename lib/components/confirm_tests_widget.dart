import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../bookings_schedule/bookings_schedule_widget.dart';
import '../components/choose_technologist_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmTestsWidget extends StatefulWidget {
  const ConfirmTestsWidget({
    Key key,
    this.labRefNum,
    this.booking,
  }) : super(key: key);

  final String labRefNum;
  final DocumentReference booking;

  @override
  _ConfirmTestsWidgetState createState() => _ConfirmTestsWidgetState();
}

class _ConfirmTestsWidgetState extends State<ConfirmTestsWidget>
    with TickerProviderStateMixin {
  BookedTestsRecord newBookedTest;
  String pathologistValue;
  TextEditingController labReferenceController;
  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 170,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 80),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    labReferenceController = TextEditingController(text: widget.labRefNum);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BookingsRecord>(
      stream: BookingsRecord.getDocument(widget.booking),
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
        final confirmTestsSheetBookingsRecord = snapshot.data;
        return Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<StaffRecord>>(
                stream: queryStaffRecord(
                  queryBuilder: (staffRecord) =>
                      staffRecord.where('role', isEqualTo: 'pathologist'),
                ),
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
                  List<StaffRecord> testConfirmationStaffRecordList =
                      snapshot.data;
                  return Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
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
                                  'CONFIRM TESTS',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF586B06),
                                      ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
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
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  controller: labReferenceController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Lab Reference Number',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF586B06),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Lab Reference Number',
                                    hintStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Color(0xFF586B06),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF586B06),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF586B06),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x33FFFFFF),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 24, 24),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Color(0xFF586B06),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                ).animated([
                                  animationsMap['textFieldOnPageLoadAnimation']
                                ]),
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Assign Pathologist',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 10),
                              child: FlutterFlowDropDown(
                                options: testConfirmationStaffRecordList
                                    .map((e) => e.displayName)
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => pathologistValue = val),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 60,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 15,
                                ),
                                fillColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                elevation: 2,
                                borderColor: Color(0x00FFFFFF),
                                borderWidth: 2,
                                borderRadius: 8,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 12, 20),
                                hidesUnderline: true,
                              ).animated([
                                animationsMap['dropDownOnPageLoadAnimation']
                              ]),
                            ),
                            Divider(
                              thickness: 1,
                              indent: 4,
                              endIndent: 4,
                              color: Color(0xFF586B06),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Tap Each To Confirm',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronDown,
                                      color: Color(0xFF586B06),
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final bookedTests =
                                        confirmTestsSheetBookingsRecord
                                                .testsIncluded
                                                .toList()
                                                ?.toList() ??
                                            [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: bookedTests.length,
                                      itemBuilder: (context, bookedTestsIndex) {
                                        final bookedTestsItem =
                                            bookedTests[bookedTestsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: StreamBuilder<TestsRecord>(
                                            stream: TestsRecord.getDocument(
                                                bookedTestsItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitDoubleBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerTestsRecord =
                                                  snapshot.data;
                                              return InkWell(
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (confirmTestsSheetBookingsRecord
                                                      .bookedTests
                                                      .toList()
                                                      .contains(
                                                          containerTestsRecord
                                                              .reference)) {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  final bookingsUpdateData = {
                                                    'bookedTests':
                                                        FieldValue.arrayUnion([
                                                      containerTestsRecord
                                                          .reference
                                                    ]),
                                                  };
                                                  await widget.booking.update(
                                                      bookingsUpdateData);

                                                  final bookedTestsCreateData =
                                                      createBookedTestsRecordData(
                                                    testRef:
                                                        containerTestsRecord
                                                            .reference,
                                                    bookingRef:
                                                        confirmTestsSheetBookingsRecord
                                                            .reference,
                                                  );
                                                  var bookedTestsRecordReference =
                                                      BookedTestsRecord
                                                          .collection
                                                          .doc();
                                                  await bookedTestsRecordReference
                                                      .set(
                                                          bookedTestsCreateData);
                                                  newBookedTest = BookedTestsRecord
                                                      .getDocumentFromData(
                                                          bookedTestsCreateData,
                                                          bookedTestsRecordReference);
                                                  _shouldSetState = true;
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            ChooseTechnologistWidget(
                                                          testRef:
                                                              containerTestsRecord
                                                                  .reference,
                                                          bookingRef:
                                                              widget.booking,
                                                          scheduledDate:
                                                              confirmTestsSheetBookingsRecord
                                                                  .scheduledDate,
                                                          bookedTestRef:
                                                              newBookedTest
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFECECEC),
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
                                                          width: 280,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 280,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                containerTestsRecord
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .check_box_outline_blank_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    size: 30,
                                                                  ),
                                                                  StreamBuilder<
                                                                      List<
                                                                          BookedTestsRecord>>(
                                                                    stream:
                                                                        queryBookedTestsRecord(
                                                                      queryBuilder: (bookedTestsRecord) => bookedTestsRecord
                                                                          .where(
                                                                              'testRef',
                                                                              isEqualTo:
                                                                                  bookedTestsItem)
                                                                          .where(
                                                                              'booking_ref',
                                                                              isEqualTo: confirmTestsSheetBookingsRecord.reference),
                                                                      singleRecord:
                                                                          true,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SpinKitDoubleBounce(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<BookedTestsRecord>
                                                                          iconCheckedBookedTestsRecordList =
                                                                          snapshot
                                                                              .data;
                                                                      // Return an empty Container when the document does not exist.
                                                                      if (snapshot
                                                                          .data
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final iconCheckedBookedTestsRecord = iconCheckedBookedTestsRecordList
                                                                              .isNotEmpty
                                                                          ? iconCheckedBookedTestsRecordList
                                                                              .first
                                                                          : null;
                                                                      return Icon(
                                                                        Icons
                                                                            .check_box_outlined,
                                                                        color: Color(
                                                                            0xFF586B06),
                                                                        size:
                                                                            30,
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
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
                        StreamBuilder<List<StaffRecord>>(
                          stream: queryStaffRecord(
                            queryBuilder: (staffRecord) => staffRecord.where(
                                'UserRef',
                                isEqualTo: currentUserReference),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitDoubleBounce(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<StaffRecord> buttonStaffRecordList =
                                snapshot.data;
                            final buttonStaffRecord =
                                buttonStaffRecordList.isNotEmpty
                                    ? buttonStaffRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                if (functions.checktestsListsEqual(
                                    confirmTestsSheetBookingsRecord
                                        .testsIncluded
                                        .toList(),
                                    confirmTestsSheetBookingsRecord.bookedTests
                                        .toList())) {
                                  final bookingsUpdateData =
                                      createBookingsRecordData(
                                    bookingConfirmed: true,
                                    bookingstatus: 'confirmed',
                                    pathologist: pathologistValue,
                                    labRefNum: widget.labRefNum,
                                    updatedDate: getCurrentTimestamp,
                                    updateStaff: buttonStaffRecord.reference,
                                  );
                                  await confirmTestsSheetBookingsRecord
                                      .reference
                                      .update(bookingsUpdateData);
                                } else {
                                  return;
                                }

                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookingsScheduleWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Confirm',
                              options: FFButtonOptions(
                                width: 300,
                                height: 70,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
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
                            );
                          },
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
