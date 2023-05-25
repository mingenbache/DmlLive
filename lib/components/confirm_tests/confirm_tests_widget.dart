import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/choose_technologist/choose_technologist_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_tests_model.dart';
export 'confirm_tests_model.dart';

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
  late ConfirmTestsModel _model;

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmTestsModel());

    _model.labReferenceController ??=
        TextEditingController(text: widget.labRefNum);
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<BookingsRecord>(
      stream: BookingsRecord.getDocument(widget.booking!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
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
              FutureBuilder<List<StaffRecord>>(
                future: queryStaffRecordOnce(
                  queryBuilder: (staffRecord) => staffRecord.where('UserRef',
                      isEqualTo: currentUserReference),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<StaffRecord> testConfirmationStaffRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final testConfirmationStaffRecord =
                      testConfirmationStaffRecordList.isNotEmpty
                          ? testConfirmationStaffRecordList.first
                          : null;
                  return Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 44.0, 20.0, 20.0),
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
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pop();
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 48.0,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  controller: _model.labReferenceController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Lab Reference Number',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Lab Reference Number',
                                    hintStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 24.0, 24.0),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                  validator: _model
                                      .labReferenceControllerValidator
                                      .asValidator(context),
                                ).animateOnPageLoad(animationsMap[
                                    'textFieldOnPageLoadAnimation']!),
                              ),
                            ),
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Assign Pathologist',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 10.0),
                              child: FutureBuilder<List<StaffRecord>>(
                                future: queryStaffRecordOnce(
                                  queryBuilder: (staffRecord) => staffRecord
                                      .where('role', isEqualTo: 'pathologist'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<StaffRecord> pathologistStaffRecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.pathologistValueController ??=
                                            FormFieldController<String>(null),
                                    options: pathologistStaffRecordList
                                        .map((e) => e.displayName)
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.pathologistValue = val),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 60.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'choose pathologist',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 15.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 12.0, 20.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                  ).animateOnPageLoad(animationsMap[
                                      'dropDownOnPageLoadAnimation']!);
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              indent: 4.0,
                              endIndent: 4.0,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Tap Each To Confirm',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.chevronDown,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (confirmTestsSheetBookingsRecord.hasTestPackages)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final bookedTestPacks =
                                          confirmTestsSheetBookingsRecord
                                              .testPackages
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
                                                    0.0, 0.0, 0.0, 8.0),
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
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerTestPackagesRecord =
                                                    snapshot.data!;
                                                return Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 280.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 280.0,
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
                                                                          .packageName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      '${containerTestPackagesRecord.testsIncluded.length.toString()} Tests',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            fontSize:
                                                                                15.0,
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
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Stack(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .check_box_outline_blank_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .check_box_outlined,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            30.0,
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
                                                                .width *
                                                            1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final testPackTests =
                                                                containerTestPackagesRecord
                                                                    .testsIncluded
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
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          4.0),
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
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final containerTestsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          if (confirmTestsSheetBookingsRecord
                                                                              .bookedTests
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
                                                                          _model.newBookedTest = BookedTestsRecord.getDocumentFromData(
                                                                              bookedTestsCreateData,
                                                                              bookedTestsRecordReference);
                                                                          _shouldSetState =
                                                                              true;
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (bottomSheetContext) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                child: ChooseTechnologistWidget(
                                                                                  testRef: testPackTestsItem,
                                                                                  bookingRef: widget.booking,
                                                                                  scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                  bookedTest: _model.newTestPackBookedTest,
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
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEEEEEE),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 280.0,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 280.0,
                                                                                    ),
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          containerTestsRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                        width: 30.0,
                                                                                        height: 30.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFEEEEEE),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.check_box_outline_blank_sharp,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 30.0,
                                                                                            ),
                                                                                            if (confirmTestsSheetBookingsRecord.bookedTests.contains(testPackTestsItem))
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
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        child: SpinKitRipple(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<BookedTestsRecord> iconCheckedBookedTestsRecordList = snapshot.data!;
                                                                                                  // Return an empty Container when the item does not exist.
                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                    return Container();
                                                                                                  }
                                                                                                  final iconCheckedBookedTestsRecord = iconCheckedBookedTestsRecordList.isNotEmpty ? iconCheckedBookedTestsRecordList.first : null;
                                                                                                  return Icon(
                                                                                                    Icons.check_box_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 30.0,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final nopackTests =
                                        confirmTestsSheetBookingsRecord
                                            .testsIncluded
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
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: StreamBuilder<TestsRecord>(
                                            stream: TestsRecord.getDocument(
                                                nopackTestsItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerTestsRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (confirmTestsSheetBookingsRecord
                                                      .bookedTests
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
                                                  _model.newTestPackBookedTest =
                                                      BookedTestsRecord
                                                          .getDocumentFromData(
                                                              bookedTestsCreateData,
                                                              bookedTestsRecordReference);
                                                  _shouldSetState = true;
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    context: context,
                                                    builder:
                                                        (bottomSheetContext) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                bottomSheetContext)
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
                                                          bookedTest: _model
                                                              .newTestPackBookedTest,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFECECEC),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 280.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 280.0,
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
                                                                    .titleSmall
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
                                                              width: 30.0,
                                                              height: 30.0,
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
                                                                        .secondary,
                                                                    size: 30.0,
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
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<BookedTestsRecord>
                                                                          iconCheckedBookedTestsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
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
                                                                            30.0,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final specialTestsList =
                                        confirmTestsSheetBookingsRecord
                                            .specialTests
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
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final specialTestsCreateData =
                                                  createSpecialTestsRecordData(
                                                name: specialTestsListItem.name,
                                                stringListIndex:
                                                    specialTestsListIndex,
                                                bookingRef:
                                                    confirmTestsSheetBookingsRecord
                                                        .reference,
                                                createdDate:
                                                    getCurrentTimestamp,
                                                scheduledDate:
                                                    confirmTestsSheetBookingsRecord
                                                        .scheduledDate,
                                                createdBy:
                                                    testConfirmationStaffRecord!
                                                        .reference,
                                                description:
                                                    specialTestsListItem
                                                        .description,
                                              );
                                              var specialTestsRecordReference =
                                                  SpecialTestsRecord.collection
                                                      .doc();
                                              await specialTestsRecordReference
                                                  .set(specialTestsCreateData);
                                              _model.newSpecialTest =
                                                  SpecialTestsRecord
                                                      .getDocumentFromData(
                                                          specialTestsCreateData,
                                                          specialTestsRecordReference);

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFECECEC),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 280.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 280.0,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            specialTestsListItem
                                                                .name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
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
                                                          width: 30.0,
                                                          height: 30.0,
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
                                                                    .secondary,
                                                                size: 30.0,
                                                              ),
                                                              StreamBuilder<
                                                                  List<
                                                                      SpecialTestsRecord>>(
                                                                stream:
                                                                    querySpecialTestsRecord(
                                                                  queryBuilder: (specialTestsRecord) => specialTestsRecord
                                                                      .where(
                                                                          'booking_ref',
                                                                          isEqualTo: confirmTestsSheetBookingsRecord
                                                                              .reference)
                                                                      .where(
                                                                          'name',
                                                                          isEqualTo: specialTestsListItem.name != ''
                                                                              ? specialTestsListItem.name
                                                                              : null),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<SpecialTestsRecord>
                                                                      iconCheckedSpecialTestsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final iconCheckedSpecialTestsRecord = iconCheckedSpecialTestsRecordList
                                                                          .isNotEmpty
                                                                      ? iconCheckedSpecialTestsRecordList
                                                                          .first
                                                                      : null;
                                                                  return Icon(
                                                                    Icons
                                                                        .check_box_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 30.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
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
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
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
                                      FFAppState().update(() {
                                        FFAppState().proceedconfirmation = true;
                                      });
                                      if (functions.checktestsListsEqual(
                                          confirmTestsSheetBookingsRecord
                                              .testsIncluded
                                              .toList(),
                                          confirmTestsSheetBookingsRecord
                                              .bookedTests
                                              .toList())) {
                                        if (FFAppState().proceedconfirmation) {
                                          final bookingsUpdateData =
                                              createBookingsRecordData(
                                            bookingConfirmed: true,
                                            bookingstatus: 'confirmed',
                                            pathologist:
                                                _model.pathologistValue,
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
                                                'A New Booking has been confirmed for ${dateTimeFormat(
                                              'MMMMEEEEd',
                                              confirmTestsSheetBookingsRecord
                                                  .scheduledDate,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            userRefs: containerStaffRecordList
                                                .map((e) => e.userRef)
                                                .withoutNulls
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
                                                'YourBooking has been confirmed for ${dateTimeFormat(
                                              'MMMMEEEEd',
                                              confirmTestsSheetBookingsRecord
                                                  .scheduledDate,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
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
                                                  'Your Booking for ${dateTimeFormat(
                                                'MMMEd',
                                                confirmTestsSheetBookingsRecord
                                                    .scheduledDate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} is confirmed.',
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
                                      width: 300.0,
                                      height: 70.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
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
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 15.0,
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
