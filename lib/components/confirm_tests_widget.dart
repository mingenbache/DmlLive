import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmTestsWidget extends StatefulWidget {
  const ConfirmTestsWidget({
    Key? key,
    this.labRefNum,
    this.booking,
  }) : super(key: key);

  final String? labRefNum;
  final DocumentReference? booking;

  @override
  _ConfirmTestsWidgetState createState() => _ConfirmTestsWidgetState();
}

class _ConfirmTestsWidgetState extends State<ConfirmTestsWidget>
    with TickerProviderStateMixin {
  BookedTestsRecord? newBookedTest;
  String? pathologistValue;
  TextEditingController? labReferenceController;
  BookedTestsRecord? newTestPackBookedTest;

  @override
  void initState() {
    super.initState();
    labReferenceController = TextEditingController(text: widget.labRefNum);
  }

  @override
  void dispose() {
    labReferenceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BookingsRecord>(
      stream: BookingsRecord.getDocument(widget.booking!),
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
        final confirmTestsSheetBookingsRecord = snapshot.data!;
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
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<StaffRecord> testConfirmationStaffRecordList =
                      snapshot.data!;
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
                        color: FlutterFlowTheme.of(context).secondaryColor,
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
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    context.pop();
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                            .primaryText,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Lab Reference Number',
                                    hintStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 24, 24),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  maxLines: null,
                                ),
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
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                    .map((e) => e.displayName!)
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
                                          .primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'choose pathologist',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 15,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2,
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderWidth: 2,
                                borderRadius: 8,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 12, 20),
                                hidesUnderline: true,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              indent: 4,
                              endIndent: 4,
                              color: FlutterFlowTheme.of(context).primaryText,
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
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (confirmTestsSheetBookingsRecord
                                    .hasTestPackages ??
                                true)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final bookedTestPacks =
                                          confirmTestsSheetBookingsRecord
                                              .testPackages!
                                              .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: bookedTestPacks.length,
                                        itemBuilder:
                                            (context, bookedTestPacksIndex) {
                                          final bookedTestPacksItem =
                                              bookedTestPacks[
                                                  bookedTestPacksIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: StreamBuilder<
                                                TestPackagesRecord>(
                                              stream: TestPackagesRecord
                                                  .getDocument(
                                                      bookedTestPacksItem),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerTestPackagesRecord =
                                                    snapshot.data!;
                                                return Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Text(
                                                                      containerTestPackagesRecord
                                                                          .packageName!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      '${containerTestPackagesRecord.testsIncluded!.toList().length.toString()} Tests',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 30,
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Stack(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .check_box_outline_blank_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .check_box_outlined,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final testPackTests =
                                                                containerTestPackagesRecord
                                                                    .testsIncluded!
                                                                    .toList();
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  testPackTests
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  testPackTestsIndex) {
                                                                final testPackTestsItem =
                                                                    testPackTests[
                                                                        testPackTestsIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          4,
                                                                          4),
                                                                  child: StreamBuilder<
                                                                      TestsRecord>(
                                                                    stream: TestsRecord
                                                                        .getDocument(
                                                                            testPackTestsItem),
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
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final containerTestsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          if (confirmTestsSheetBookingsRecord
                                                                              .bookedTests!
                                                                              .toList()
                                                                              .contains(testPackTestsItem)) {
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }

                                                                          final bookingsUpdateData =
                                                                              {
                                                                            'bookedTests':
                                                                                FieldValue.arrayUnion([
                                                                              testPackTestsItem
                                                                            ]),
                                                                          };
                                                                          await widget
                                                                              .booking!
                                                                              .update(bookingsUpdateData);

                                                                          final bookedTestsCreateData =
                                                                              createBookedTestsRecordData(
                                                                            testRef:
                                                                                testPackTestsItem,
                                                                            bookingRef:
                                                                                confirmTestsSheetBookingsRecord.reference,
                                                                          );
                                                                          var bookedTestsRecordReference = BookedTestsRecord
                                                                              .collection
                                                                              .doc();
                                                                          await bookedTestsRecordReference
                                                                              .set(bookedTestsCreateData);
                                                                          newBookedTest = BookedTestsRecord.getDocumentFromData(
                                                                              bookedTestsCreateData,
                                                                              bookedTestsRecordReference);
                                                                          _shouldSetState =
                                                                              true;
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: ChooseTechnologistWidget(
                                                                                  testRef: testPackTestsItem,
                                                                                  bookingRef: widget.booking,
                                                                                  scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                  bookedTest: newTestPackBookedTest,
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));

                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            height:
                                                                                35,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEEEEEE),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 280,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 280,
                                                                                    ),
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          containerTestsRecord.name!,
                                                                                          style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 30,
                                                                                        height: 30,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFEEEEEE),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.check_box_outline_blank_sharp,
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              size: 30,
                                                                                            ),
                                                                                            if (confirmTestsSheetBookingsRecord.bookedTests!.toList().contains(testPackTestsItem))
                                                                                              StreamBuilder<List<BookedTestsRecord>>(
                                                                                                stream: queryBookedTestsRecord(
                                                                                                  queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where('testRef', isEqualTo: testPackTestsItem).where('booking_ref', isEqualTo: confirmTestsSheetBookingsRecord.reference),
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
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<BookedTestsRecord> iconCheckedBookedTestsRecordList = snapshot.data!;
                                                                                                  // Return an empty Container when the document does not exist.
                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                    return Container();
                                                                                                  }
                                                                                                  final iconCheckedBookedTestsRecord = iconCheckedBookedTestsRecordList.isNotEmpty ? iconCheckedBookedTestsRecordList.first : null;
                                                                                                  return Icon(
                                                                                                    Icons.check_box_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 30,
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
                                                    ],
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
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final nopackTests =
                                        confirmTestsSheetBookingsRecord
                                            .testsIncluded!
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: nopackTests.length,
                                      itemBuilder: (context, nopackTestsIndex) {
                                        final nopackTestsItem =
                                            nopackTests[nopackTestsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: StreamBuilder<TestsRecord>(
                                            stream: TestsRecord.getDocument(
                                                nopackTestsItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: SpinKitRipple(
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
                                                  snapshot.data!;
                                              return InkWell(
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (confirmTestsSheetBookingsRecord
                                                      .bookedTests!
                                                      .toList()
                                                      .contains(
                                                          nopackTestsItem)) {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  final bookingsUpdateData = {
                                                    'bookedTests':
                                                        FieldValue.arrayUnion(
                                                            [nopackTestsItem]),
                                                  };
                                                  await widget.booking!.update(
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
                                                  newTestPackBookedTest =
                                                      BookedTestsRecord
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
                                                              nopackTestsItem,
                                                          bookingRef:
                                                              widget.booking,
                                                          scheduledDate:
                                                              confirmTestsSheetBookingsRecord
                                                                  .scheduledDate,
                                                          bookedTest:
                                                              newTestPackBookedTest,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                                    .name!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
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
                                                                                  nopackTestsItem)
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
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<BookedTestsRecord>
                                                                          iconCheckedBookedTestsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the document does not exist.
                                                                      if (snapshot
                                                                          .data!
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
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
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final specialTestsList =
                                        confirmTestsSheetBookingsRecord
                                            .specialTests!
                                            .toList()
                                            .map((e) => e)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: specialTestsList.length,
                                      itemBuilder:
                                          (context, specialTestsListIndex) {
                                        final specialTestsListItem =
                                            specialTestsList[
                                                specialTestsListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Container(
                                            width: 100,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFECECEC),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 280,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 280,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Test Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18,
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
                                                      Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_box_outline_blank_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              size: 30,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .check_box_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30,
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
                    FutureBuilder<List<StaffRecord>>(
                      future: queryStaffRecordOnce(),
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
                        List<StaffRecord> containerStaffRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<StaffRecord>>(
                                stream: queryStaffRecord(
                                  queryBuilder: (staffRecord) =>
                                      staffRecord.where('UserRef',
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
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<StaffRecord> buttonStaffRecordList =
                                      snapshot.data!;
                                  final buttonStaffRecord =
                                      buttonStaffRecordList.isNotEmpty
                                          ? buttonStaffRecordList.first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      setState(() => FFAppState()
                                          .proceedconfirmation = true);
                                      if (functions.checktestsListsEqual(
                                          confirmTestsSheetBookingsRecord
                                              .testsIncluded!
                                              .toList(),
                                          confirmTestsSheetBookingsRecord
                                              .bookedTests!
                                              .toList())) {
                                        if (FFAppState().proceedconfirmation) {
                                          final bookingsUpdateData =
                                              createBookingsRecordData(
                                            bookingConfirmed: true,
                                            bookingstatus: 'confirmed',
                                            pathologist: pathologistValue,
                                            labRefNum: widget.labRefNum,
                                            updatedDate: getCurrentTimestamp,
                                            updateStaff:
                                                buttonStaffRecord!.reference,
                                          );
                                          await confirmTestsSheetBookingsRecord
                                              .reference
                                              .update(bookingsUpdateData);
                                          triggerPushNotification(
                                            notificationTitle:
                                                'New Booking Confirmed',
                                            notificationText:
                                                'A New Booking has been confirmed for ${dateTimeFormat('MMMMEEEEd', confirmTestsSheetBookingsRecord.scheduledDate)}',
                                            userRefs: containerStaffRecordList
                                                .map((e) => e.userRef!)
                                                .toList(),
                                            initialPageName: 'BookingUpdates',
                                            parameterData: {
                                              'bookingRef': widget.booking,
                                            },
                                          );
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Your Booking is Confirmed',
                                            notificationText:
                                                'YourBooking has been confirmed for ${dateTimeFormat('MMMMEEEEd', confirmTestsSheetBookingsRecord.scheduledDate)}',
                                            userRefs: [
                                              confirmTestsSheetBookingsRecord
                                                  .user!
                                            ],
                                            initialPageName: 'BookingUpdates',
                                            parameterData: {
                                              'bookingRef': widget.booking,
                                            },
                                          );

                                          final notificationsCreateData = {
                                            ...createNotificationsRecordData(
                                              message:
                                                  'Your Booking for ${dateTimeFormat('MMMEd', confirmTestsSheetBookingsRecord.scheduledDate)} is confirmed.',
                                              createdDate: getCurrentTimestamp,
                                              isSeen: false,
                                            ),
                                            'users_receiving': [
                                              confirmTestsSheetBookingsRecord
                                                  .user
                                            ],
                                          };
                                          await NotificationsRecord.collection
                                              .doc()
                                              .set(notificationsCreateData);

                                          context.goNamed('BookingsSchedule');

                                          return;
                                        } else {
                                          return;
                                        }
                                      } else {
                                        return;
                                      }
                                    },
                                    text: 'Confirm',
                                    options: FFButtonOptions(
                                      width: 300,
                                      height: 70,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                      elevation: 2,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
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
