import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/choose_technologist/choose_technologist_widget.dart';
import '/components/view_special_test_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_tests_copy_model.dart';
export 'confirm_tests_copy_model.dart';

class ConfirmTestsCopyWidget extends StatefulWidget {
  const ConfirmTestsCopyWidget({
    Key? key,
    this.labRefNum,
    this.booking,
  }) : super(key: key);

  final String? labRefNum;
  final DocumentReference? booking;

  @override
  _ConfirmTestsCopyWidgetState createState() => _ConfirmTestsCopyWidgetState();
}

class _ConfirmTestsCopyWidgetState extends State<ConfirmTestsCopyWidget>
    with TickerProviderStateMixin {
  late ConfirmTestsCopyModel _model;

  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

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
    _model = createModel(context, () => ConfirmTestsCopyModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: StreamBuilder<BookingsRecord>(
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
            constraints: BoxConstraints(
              maxWidth: 380.0,
            ),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Material(
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
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: ClipRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 3.0,
                              sigmaY: 3.0,
                            ),
                            child: Image.asset(
                              'assets/images/Doctor_office_examination_-_1280x757.jpeg',
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<List<StaffRecord>>(
                      future: queryStaffRecordOnce(
                        queryBuilder: (staffRecord) => staffRecord
                            .where('UserRef', isEqualTo: currentUserReference),
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
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x686CD7B7),
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 0.4],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'CONFIRM TESTS',
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 48.0,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: TextFormField(
                                        controller:
                                            _model.labReferenceController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Lab Reference Number',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                        queryBuilder: (staffRecord) =>
                                            staffRecord.where('role',
                                                isEqualTo: 'pathologist'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<StaffRecord>
                                            pathologistStaffRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .pathologistValueController ??=
                                              FormFieldController<String>(null),
                                          options: pathologistStaffRecordList
                                              .map((e) => e.displayName)
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.pathologistValue = val),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 60.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 500.0,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 50.0),
                                            child: PageView(
                                              controller:
                                                  _model.pageViewController ??=
                                                      PageController(
                                                          initialPage: 0),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.95, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'Individual Tests',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall,
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final individualTests =
                                                              confirmTestsSheetBookingsRecord
                                                                  .testsIncluded
                                                                  .toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                individualTests
                                                                    .length,
                                                            itemBuilder: (context,
                                                                individualTestsIndex) {
                                                              final individualTestsItem =
                                                                  individualTests[
                                                                      individualTestsIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        10.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        BookedTestsRecord>>(
                                                                  stream:
                                                                      queryBookedTestsRecord(
                                                                    queryBuilder: (bookedTestsRecord) => bookedTestsRecord
                                                                        .where(
                                                                            'testRef',
                                                                            isEqualTo:
                                                                                individualTestsItem)
                                                                        .where(
                                                                            'booking_ref',
                                                                            isEqualTo:
                                                                                widget.booking),
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
                                                                    List<BookedTestsRecord>
                                                                        confirmTestCardBookedTestsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final confirmTestCardBookedTestsRecord = confirmTestCardBookedTestsRecordList
                                                                            .isNotEmpty
                                                                        ? confirmTestCardBookedTestsRecordList
                                                                            .first
                                                                        : null;
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (confirmTestsSheetBookingsRecord
                                                                            .bookedTests
                                                                            .contains(individualTestsItem)) {
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('undo confirmation?'),
                                                                                    content: Text('are you sure you want to undo confirmation of this test?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('Cancel'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('Confirm'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                        } else {
                                                                          final bookedTestsCreateData =
                                                                              createBookedTestsRecordData(
                                                                            testRef:
                                                                                individualTestsItem,
                                                                            bookingRef:
                                                                                confirmTestsSheetBookingsRecord.reference,
                                                                            scheduledDate:
                                                                                confirmTestsSheetBookingsRecord.scheduledDate,
                                                                            sampleCollected:
                                                                                false,
                                                                            sampleSlideRequested:
                                                                                false,
                                                                            sampleSlideSurrendered:
                                                                                false,
                                                                            user:
                                                                                confirmTestsSheetBookingsRecord.user,
                                                                            createdDate:
                                                                                getCurrentTimestamp,
                                                                            hasResult:
                                                                                false,
                                                                            labRefNum:
                                                                                widget.labRefNum,
                                                                            createUser:
                                                                                testConfirmationStaffRecord!.reference,
                                                                            hasTestPack:
                                                                                false,
                                                                          );
                                                                          var bookedTestsRecordReference = BookedTestsRecord
                                                                              .collection
                                                                              .doc();
                                                                          await bookedTestsRecordReference
                                                                              .set(bookedTestsCreateData);
                                                                          _model.newBookedTestRecord = BookedTestsRecord.getDocumentFromData(
                                                                              bookedTestsCreateData,
                                                                              bookedTestsRecordReference);

                                                                          final bookingsUpdateData =
                                                                              {
                                                                            'bookedTests':
                                                                                FieldValue.arrayUnion([
                                                                              individualTestsItem
                                                                            ]),
                                                                            'bookedTestRefs':
                                                                                FieldValue.arrayUnion([
                                                                              _model.newBookedTestRecord!.reference
                                                                            ]),
                                                                          };
                                                                          await widget
                                                                              .booking!
                                                                              .update(bookingsUpdateData);
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (bottomSheetContext) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                child: ChooseTechnologistWidget(
                                                                                  testRef: individualTestsItem,
                                                                                  bookingRef: widget.booking,
                                                                                  scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                  bookedTest: _model.newBookedTestRecord,
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        }

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 7.0,
                                                                              color: Color(0x2F1D2429),
                                                                              offset: Offset(0.0, 3.0),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              12.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          StreamBuilder<TestsRecord>(
                                                                                            stream: TestsRecord.getDocument(individualTestsItem),
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
                                                                                              final textTestsRecord = snapshot.data!;
                                                                                              return Text(
                                                                                                textTestsRecord.name,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Open Sans',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      if ((confirmTestCardBookedTestsRecord != null) && (confirmTestCardBookedTestsRecord!.technologist != null))
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                              child: StreamBuilder<StaffRecord>(
                                                                                                stream: StaffRecord.getDocument(confirmTestCardBookedTestsRecord!.technologist!),
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
                                                                                                  final textStaffRecord = snapshot.data!;
                                                                                                  return Text(
                                                                                                    '${textStaffRecord.firstName} ${textStaffRecord.lastName}',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Open Sans',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              FlutterFlowIconButton(
                                                                                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: 8.0,
                                                                                borderWidth: 2.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  Icons.more_vert,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                                onPressed: () {
                                                                                  print('IconButton pressed ...');
                                                                                },
                                                                              ),
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if (confirmTestCardBookedTestsRecord != null)
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                              ),
                                                                                            ),
                                                                                            unselectedWidgetColor: Color(0xFFF5F5F5),
                                                                                          ),
                                                                                          child: Checkbox(
                                                                                            value: _model.checkboxValueMap1[individualTestsItem] ??= confirmTestCardBookedTestsRecord != null,
                                                                                            onChanged: (newValue) async {
                                                                                              setState(() => _model.checkboxValueMap1[individualTestsItem] = newValue!);
                                                                                              if (newValue!) {
                                                                                                if (confirmTestsSheetBookingsRecord.bookedTests.contains(individualTestsItem)) {
                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: Text('undo confirmation?'),
                                                                                                            content: Text('are you sure you want to undo confirmation of this test?'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                child: Text('Cancel'),
                                                                                                              ),
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                child: Text('Confirm'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      ) ??
                                                                                                      false;
                                                                                                } else {
                                                                                                  final bookedTestsCreateData = createBookedTestsRecordData(
                                                                                                    testRef: individualTestsItem,
                                                                                                    bookingRef: confirmTestsSheetBookingsRecord.reference,
                                                                                                    scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                    sampleCollected: false,
                                                                                                    sampleSlideRequested: false,
                                                                                                    sampleSlideSurrendered: false,
                                                                                                    user: confirmTestsSheetBookingsRecord.user,
                                                                                                    createdDate: getCurrentTimestamp,
                                                                                                    hasResult: false,
                                                                                                    labRefNum: widget.labRefNum,
                                                                                                    createUser: testConfirmationStaffRecord!.reference,
                                                                                                    hasTestPack: false,
                                                                                                  );
                                                                                                  var bookedTestsRecordReference = BookedTestsRecord.collection.doc();
                                                                                                  await bookedTestsRecordReference.set(bookedTestsCreateData);
                                                                                                  _model.newBookedTestRecord4 = BookedTestsRecord.getDocumentFromData(bookedTestsCreateData, bookedTestsRecordReference);

                                                                                                  final bookingsUpdateData = {
                                                                                                    'bookedTests': FieldValue.arrayUnion([individualTestsItem]),
                                                                                                    'bookedTestRefs': FieldValue.arrayUnion([
                                                                                                      _model.newBookedTestRecord!.reference
                                                                                                    ]),
                                                                                                  };
                                                                                                  await widget.booking!.update(bookingsUpdateData);
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    context: context,
                                                                                                    builder: (bottomSheetContext) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                        child: ChooseTechnologistWidget(
                                                                                                          testRef: individualTestsItem,
                                                                                                          bookingRef: widget.booking,
                                                                                                          scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                          bookedTest: _model.newBookedTestRecord,
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                }

                                                                                                setState(() {});
                                                                                              } else {
                                                                                                if (confirmTestsSheetBookingsRecord.bookedTests.contains(individualTestsItem)) {
                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: Text('undo confirmation?'),
                                                                                                            content: Text('are you sure you want to undo confirmation of this test?'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                child: Text('Cancel'),
                                                                                                              ),
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                child: Text('Confirm'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      ) ??
                                                                                                      false;
                                                                                                } else {
                                                                                                  final bookedTestsCreateData = createBookedTestsRecordData(
                                                                                                    testRef: individualTestsItem,
                                                                                                    bookingRef: confirmTestsSheetBookingsRecord.reference,
                                                                                                    scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                    sampleCollected: false,
                                                                                                    sampleSlideRequested: false,
                                                                                                    sampleSlideSurrendered: false,
                                                                                                    user: confirmTestsSheetBookingsRecord.user,
                                                                                                    createdDate: getCurrentTimestamp,
                                                                                                    hasResult: false,
                                                                                                    labRefNum: widget.labRefNum,
                                                                                                    createUser: testConfirmationStaffRecord!.reference,
                                                                                                    hasTestPack: false,
                                                                                                  );
                                                                                                  var bookedTestsRecordReference = BookedTestsRecord.collection.doc();
                                                                                                  await bookedTestsRecordReference.set(bookedTestsCreateData);
                                                                                                  _model.newBookedTestRecord3 = BookedTestsRecord.getDocumentFromData(bookedTestsCreateData, bookedTestsRecordReference);

                                                                                                  final bookingsUpdateData = {
                                                                                                    'bookedTests': FieldValue.arrayUnion([individualTestsItem]),
                                                                                                    'bookedTestRefs': FieldValue.arrayUnion([
                                                                                                      _model.newBookedTestRecord!.reference
                                                                                                    ]),
                                                                                                  };
                                                                                                  await widget.booking!.update(bookingsUpdateData);
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    context: context,
                                                                                                    builder: (bottomSheetContext) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                        child: ChooseTechnologistWidget(
                                                                                                          testRef: individualTestsItem,
                                                                                                          bookingRef: widget.booking,
                                                                                                          scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                          bookedTest: _model.newBookedTestRecord,
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                }

                                                                                                setState(() {});
                                                                                              }
                                                                                            },
                                                                                            activeColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (confirmTestsSheetBookingsRecord.bookedTests.contains(individualTestsItem)) {
                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('undo confirmation?'),
                                                                                                      content: Text('are you sure you want to undo confirmation of this test?'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('Cancel'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Confirm'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ) ??
                                                                                                false;
                                                                                          } else {
                                                                                            final bookedTestsCreateData = createBookedTestsRecordData(
                                                                                              testRef: individualTestsItem,
                                                                                              bookingRef: confirmTestsSheetBookingsRecord.reference,
                                                                                              scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                              sampleCollected: false,
                                                                                              sampleSlideRequested: false,
                                                                                              sampleSlideSurrendered: false,
                                                                                              user: confirmTestsSheetBookingsRecord.user,
                                                                                              createdDate: getCurrentTimestamp,
                                                                                              hasResult: false,
                                                                                              labRefNum: widget.labRefNum,
                                                                                              createUser: testConfirmationStaffRecord!.reference,
                                                                                              hasTestPack: false,
                                                                                            );
                                                                                            var bookedTestsRecordReference = BookedTestsRecord.collection.doc();
                                                                                            await bookedTestsRecordReference.set(bookedTestsCreateData);
                                                                                            _model.newBookedTestRecord2 = BookedTestsRecord.getDocumentFromData(bookedTestsCreateData, bookedTestsRecordReference);

                                                                                            final bookingsUpdateData = {
                                                                                              'bookedTests': FieldValue.arrayUnion([
                                                                                                individualTestsItem
                                                                                              ]),
                                                                                              'bookedTestRefs': FieldValue.arrayUnion([
                                                                                                _model.newBookedTestRecord!.reference
                                                                                              ]),
                                                                                            };
                                                                                            await widget.booking!.update(bookingsUpdateData);
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              context: context,
                                                                                              builder: (bottomSheetContext) {
                                                                                                return Padding(
                                                                                                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                  child: ChooseTechnologistWidget(
                                                                                                    testRef: individualTestsItem,
                                                                                                    bookingRef: widget.booking,
                                                                                                    scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                    bookedTest: _model.newBookedTestRecord,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.check_box_outline_blank_sharp,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 30.0,
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
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.95, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'Test Packages',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall,
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final testPackages =
                                                              confirmTestsSheetBookingsRecord
                                                                  .testPackages
                                                                  .toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                testPackages
                                                                    .length,
                                                            itemBuilder: (context,
                                                                testPackagesIndex) {
                                                              final testPackagesItem =
                                                                  testPackages[
                                                                      testPackagesIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: StreamBuilder<
                                                                    TestPackagesRecord>(
                                                                  stream: TestPackagesRecord
                                                                      .getDocument(
                                                                          testPackagesItem),
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
                                                                    final testPackageCardTestPackagesRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                7.0,
                                                                            color:
                                                                                Color(0x2F1D2429),
                                                                            offset:
                                                                                Offset(0.0, 3.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                12.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              testPackageCardTestPackagesRecord.packageName,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Open Sans',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                '${testPackageCardTestPackagesRecord.testsIncluded.length.toString()} Tests',
                                                                                                '0 ',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Open Sans',
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: 8.0,
                                                                                  borderWidth: 2.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.more_vert,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    print('IconButton pressed ...');
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1.0,
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final packageTests = testPackageCardTestPackagesRecord.testsIncluded.toList();
                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: packageTests.length,
                                                                                itemBuilder: (context, packageTestsIndex) {
                                                                                  final packageTestsItem = packageTests[packageTestsIndex];
                                                                                  return StreamBuilder<List<BookedTestsRecord>>(
                                                                                    stream: queryBookedTestsRecord(
                                                                                      queryBuilder: (bookedTestsRecord) => bookedTestsRecord.where('booking_ref', isEqualTo: widget.booking).where('testRef', isEqualTo: packageTestsItem).where('test_pack_ref', isEqualTo: testPackagesItem),
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
                                                                                      List<BookedTestsRecord> testPackItemBookedTestsRecordList = snapshot.data!;
                                                                                      final testPackItemBookedTestsRecord = testPackItemBookedTestsRecordList.isNotEmpty ? testPackItemBookedTestsRecordList.first : null;
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (testPackItemBookedTestsRecord != null) {
                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Undo Confirm?'),
                                                                                                      content: Text('are you sure you want to remove this record from the confirmed tests list?'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('Cancel'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Confirm'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ) ??
                                                                                                false;
                                                                                            if (confirmDialogResponse) {
                                                                                              await testPackItemBookedTestsRecord!.reference.delete();

                                                                                              final bookingsUpdateData1 = {
                                                                                                'bookedTests': FieldValue.arrayRemove([packageTestsItem]),
                                                                                              };
                                                                                              await widget.booking!.update(bookingsUpdateData1);
                                                                                            }
                                                                                          } else {
                                                                                            final bookedTestsCreateData = createBookedTestsRecordData(
                                                                                              testRef: packageTestsItem,
                                                                                              scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                              bookingRef: widget.booking,
                                                                                              sampleCollected: false,
                                                                                              sampleSlideRequested: false,
                                                                                              sampleSlideSurrendered: false,
                                                                                              user: confirmTestsSheetBookingsRecord.user,
                                                                                              createdDate: getCurrentTimestamp,
                                                                                              hasResult: false,
                                                                                              labRefNum: _model.labReferenceController.text,
                                                                                              createUser: testConfirmationStaffRecord!.reference,
                                                                                              hasTestPack: true,
                                                                                              testPackRef: testPackagesItem,
                                                                                            );
                                                                                            var bookedTestsRecordReference = BookedTestsRecord.collection.doc();
                                                                                            await bookedTestsRecordReference.set(bookedTestsCreateData);
                                                                                            _model.newBookedTestRef = BookedTestsRecord.getDocumentFromData(bookedTestsCreateData, bookedTestsRecordReference);

                                                                                            final bookingsUpdateData2 = {
                                                                                              'bookedTests': FieldValue.arrayUnion([
                                                                                                packageTestsItem
                                                                                              ]),
                                                                                            };
                                                                                            await widget.booking!.update(bookingsUpdateData2);
                                                                                            _model.testDocument = await actions.getTestDocument(
                                                                                              packageTestsItem,
                                                                                            );
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (bottomSheetContext) {
                                                                                                return Padding(
                                                                                                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                  child: ChooseTechnologistWidget(
                                                                                                    testRef: packageTestsItem,
                                                                                                    bookingRef: widget.booking,
                                                                                                    scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                    booking: confirmTestsSheetBookingsRecord,
                                                                                                    bookedTest: _model.newBookedTestRef,
                                                                                                    testName: _model.testDocument!.name,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          }

                                                                                          setState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          children: [
                                                                                                            StreamBuilder<TestsRecord>(
                                                                                                              stream: TestsRecord.getDocument(packageTestsItem),
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
                                                                                                                final textTestsRecord = snapshot.data!;
                                                                                                                return Text(
                                                                                                                  textTestsRecord.name,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Open Sans',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (testPackItemBookedTestsRecord != null)
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: StreamBuilder<StaffRecord>(
                                                                                                                  stream: StaffRecord.getDocument(testPackItemBookedTestsRecord!.technologist!),
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
                                                                                                                    final textStaffRecord = snapshot.data!;
                                                                                                                    return Text(
                                                                                                                      textStaffRecord != null ? '${textStaffRecord.firstName} ${textStaffRecord.lastName}' : 'no technician selected',
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                            fontFamily: 'Open Sans',
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Theme(
                                                                                                          data: ThemeData(
                                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                            unselectedWidgetColor: Color(0xFFF5F5F5),
                                                                                                          ),
                                                                                                          child: Checkbox(
                                                                                                            value: _model.checkboxValueMap2[packageTestsItem] ??= testPackItemBookedTestsRecord != null,
                                                                                                            onChanged: (newValue) async {
                                                                                                              setState(() => _model.checkboxValueMap2[packageTestsItem] = newValue!);
                                                                                                              if (newValue!) {
                                                                                                                if (testPackItemBookedTestsRecord != null) {
                                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                                        context: context,
                                                                                                                        builder: (alertDialogContext) {
                                                                                                                          return AlertDialog(
                                                                                                                            title: Text('Undo Confirm?'),
                                                                                                                            content: Text('are you sure you want to remove this record from the confirmed tests list?'),
                                                                                                                            actions: [
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                child: Text('Cancel'),
                                                                                                                              ),
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                child: Text('Confirm'),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ) ??
                                                                                                                      false;
                                                                                                                  if (confirmDialogResponse) {
                                                                                                                    await testPackItemBookedTestsRecord!.reference.delete();

                                                                                                                    final bookingsUpdateData1 = {
                                                                                                                      'bookedTests': FieldValue.arrayRemove([packageTestsItem]),
                                                                                                                    };
                                                                                                                    await widget.booking!.update(bookingsUpdateData1);
                                                                                                                  }
                                                                                                                } else {
                                                                                                                  final bookedTestsCreateData = createBookedTestsRecordData(
                                                                                                                    testRef: packageTestsItem,
                                                                                                                    scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                                    bookingRef: widget.booking,
                                                                                                                    sampleCollected: false,
                                                                                                                    sampleSlideRequested: false,
                                                                                                                    sampleSlideSurrendered: false,
                                                                                                                    user: confirmTestsSheetBookingsRecord.user,
                                                                                                                    createdDate: getCurrentTimestamp,
                                                                                                                    hasResult: false,
                                                                                                                    labRefNum: _model.labReferenceController.text,
                                                                                                                    createUser: testConfirmationStaffRecord!.reference,
                                                                                                                    hasTestPack: true,
                                                                                                                    testPackRef: testPackagesItem,
                                                                                                                  );
                                                                                                                  var bookedTestsRecordReference = BookedTestsRecord.collection.doc();
                                                                                                                  await bookedTestsRecordReference.set(bookedTestsCreateData);
                                                                                                                  _model.newBookedTestRefCopy = BookedTestsRecord.getDocumentFromData(bookedTestsCreateData, bookedTestsRecordReference);

                                                                                                                  final bookingsUpdateData2 = {
                                                                                                                    'bookedTests': FieldValue.arrayUnion([packageTestsItem]),
                                                                                                                  };
                                                                                                                  await widget.booking!.update(bookingsUpdateData2);
                                                                                                                  _model.testDocumentCopy = await actions.getTestDocument(
                                                                                                                    packageTestsItem,
                                                                                                                  );
                                                                                                                  await showModalBottomSheet(
                                                                                                                    isScrollControlled: true,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    barrierColor: Color(0x00000000),
                                                                                                                    enableDrag: false,
                                                                                                                    context: context,
                                                                                                                    builder: (bottomSheetContext) {
                                                                                                                      return Padding(
                                                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                        child: ChooseTechnologistWidget(
                                                                                                                          testRef: packageTestsItem,
                                                                                                                          bookingRef: widget.booking,
                                                                                                                          scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                                          booking: confirmTestsSheetBookingsRecord,
                                                                                                                          bookedTest: _model.newBookedTestRef,
                                                                                                                          testName: _model.testDocument!.name,
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ).then((value) => setState(() {}));
                                                                                                                }

                                                                                                                setState(() {});
                                                                                                              } else {
                                                                                                                if (testPackItemBookedTestsRecord != null) {
                                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                                        context: context,
                                                                                                                        builder: (alertDialogContext) {
                                                                                                                          return AlertDialog(
                                                                                                                            title: Text('Undo Confirm?'),
                                                                                                                            content: Text('are you sure you want to remove this record from the confirmed tests list?'),
                                                                                                                            actions: [
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                child: Text('Cancel'),
                                                                                                                              ),
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                child: Text('Confirm'),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ) ??
                                                                                                                      false;
                                                                                                                  if (confirmDialogResponse) {
                                                                                                                    await testPackItemBookedTestsRecord!.reference.delete();

                                                                                                                    final bookingsUpdateData1 = {
                                                                                                                      'bookedTests': FieldValue.arrayRemove([packageTestsItem]),
                                                                                                                    };
                                                                                                                    await widget.booking!.update(bookingsUpdateData1);
                                                                                                                  }
                                                                                                                } else {
                                                                                                                  final bookedTestsCreateData = createBookedTestsRecordData(
                                                                                                                    testRef: packageTestsItem,
                                                                                                                    scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                                    bookingRef: widget.booking,
                                                                                                                    sampleCollected: false,
                                                                                                                    sampleSlideRequested: false,
                                                                                                                    sampleSlideSurrendered: false,
                                                                                                                    user: confirmTestsSheetBookingsRecord.user,
                                                                                                                    createdDate: getCurrentTimestamp,
                                                                                                                    hasResult: false,
                                                                                                                    labRefNum: _model.labReferenceController.text,
                                                                                                                    createUser: testConfirmationStaffRecord!.reference,
                                                                                                                    hasTestPack: true,
                                                                                                                    testPackRef: testPackagesItem,
                                                                                                                  );
                                                                                                                  var bookedTestsRecordReference = BookedTestsRecord.collection.doc();
                                                                                                                  await bookedTestsRecordReference.set(bookedTestsCreateData);
                                                                                                                  _model.newBookedTestRefCopy2 = BookedTestsRecord.getDocumentFromData(bookedTestsCreateData, bookedTestsRecordReference);

                                                                                                                  final bookingsUpdateData2 = {
                                                                                                                    'bookedTests': FieldValue.arrayUnion([packageTestsItem]),
                                                                                                                  };
                                                                                                                  await widget.booking!.update(bookingsUpdateData2);
                                                                                                                  _model.testDocumentCopy2 = await actions.getTestDocument(
                                                                                                                    packageTestsItem,
                                                                                                                  );
                                                                                                                  await showModalBottomSheet(
                                                                                                                    isScrollControlled: true,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    barrierColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                    enableDrag: false,
                                                                                                                    context: context,
                                                                                                                    builder: (bottomSheetContext) {
                                                                                                                      return Padding(
                                                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                        child: ChooseTechnologistWidget(
                                                                                                                          testRef: packageTestsItem,
                                                                                                                          bookingRef: widget.booking,
                                                                                                                          scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                                          booking: confirmTestsSheetBookingsRecord,
                                                                                                                          bookedTest: _model.newBookedTestRef,
                                                                                                                          testName: _model.testDocument!.name,
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ).then((value) => setState(() {}));
                                                                                                                }

                                                                                                                setState(() {});
                                                                                                              }
                                                                                                            },
                                                                                                            activeColor: FlutterFlowTheme.of(context).primaryText,
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
                                                                                    },
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
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
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.95, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'Special Tests',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall,
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final specialTests =
                                                              confirmTestsSheetBookingsRecord
                                                                  .specialTests
                                                                  .toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                specialTests
                                                                    .length,
                                                            itemBuilder: (context,
                                                                specialTestsIndex) {
                                                              final specialTestsItem =
                                                                  specialTests[
                                                                      specialTestsIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        10.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        SpecialTestsRecord>>(
                                                                  stream:
                                                                      querySpecialTestsRecord(
                                                                    queryBuilder: (specialTestsRecord) => specialTestsRecord
                                                                        .where(
                                                                            'name',
                                                                            isEqualTo: specialTestsItem
                                                                                .name)
                                                                        .where(
                                                                            'booking_ref',
                                                                            isEqualTo:
                                                                                widget.booking),
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
                                                                        specialTestsCardSpecialTestsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final specialTestsCardSpecialTestsRecord = specialTestsCardSpecialTestsRecordList
                                                                            .isNotEmpty
                                                                        ? specialTestsCardSpecialTestsRecordList
                                                                            .first
                                                                        : null;
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (specialTestsCardSpecialTestsRecord !=
                                                                            null) {
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Remove Test?'),
                                                                                    content: Text('Are you sure you want to undo confirmation of this test?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('Cancel'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('Confirm'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            final bookingsUpdateData1 =
                                                                                {
                                                                              'bookedSpecialTests': FieldValue.arrayRemove([
                                                                                specialTestsCardSpecialTestsRecord!.reference
                                                                              ]),
                                                                            };
                                                                            await widget.booking!.update(bookingsUpdateData1);
                                                                            await specialTestsCardSpecialTestsRecord!.reference.delete();
                                                                          }
                                                                        } else {
                                                                          final specialTestsCreateData =
                                                                              createSpecialTestsRecordData(
                                                                            name:
                                                                                specialTestsItem.name,
                                                                            stringListIndex:
                                                                                specialTestsIndex,
                                                                            bookingRef:
                                                                                confirmTestsSheetBookingsRecord.reference,
                                                                            createdDate:
                                                                                getCurrentTimestamp,
                                                                            scheduledDate:
                                                                                confirmTestsSheetBookingsRecord.scheduledDate,
                                                                            createdBy:
                                                                                testConfirmationStaffRecord!.reference,
                                                                            sampleCollected:
                                                                                false,
                                                                            resultSubmitted:
                                                                                false,
                                                                            description:
                                                                                specialTestsItem.description,
                                                                          );
                                                                          var specialTestsRecordReference = SpecialTestsRecord
                                                                              .collection
                                                                              .doc();
                                                                          await specialTestsRecordReference
                                                                              .set(specialTestsCreateData);
                                                                          _model.newSpecialTest = SpecialTestsRecord.getDocumentFromData(
                                                                              specialTestsCreateData,
                                                                              specialTestsRecordReference);

                                                                          final bookingsUpdateData2 =
                                                                              {
                                                                            'bookedSpecialTests':
                                                                                FieldValue.arrayUnion([
                                                                              _model.newSpecialTest!.reference
                                                                            ]),
                                                                          };
                                                                          await widget
                                                                              .booking!
                                                                              .update(bookingsUpdateData2);
                                                                        }

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 7.0,
                                                                              color: Color(0x2F1D2429),
                                                                              offset: Offset(0.0, 3.0),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              12.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            specialTestsItem.name,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (specialTestsCardSpecialTestsRecord != null)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                              child: StreamBuilder<StaffRecord>(
                                                                                                stream: StaffRecord.getDocument(specialTestsCardSpecialTestsRecord!.technologistAssigned!),
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
                                                                                                  final textStaffRecord = snapshot.data!;
                                                                                                  return Text(
                                                                                                    '${textStaffRecord.firstName} ${textStaffRecord.lastName}',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Open Sans',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              FlutterFlowIconButton(
                                                                                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: 8.0,
                                                                                borderWidth: 2.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  Icons.more_vert,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 20.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                        child: ViewSpecialTestWidget(
                                                                                          specialTest: specialTestsItem,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                              ),
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Theme(
                                                                                        data: ThemeData(
                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                            ),
                                                                                          ),
                                                                                          unselectedWidgetColor: Color(0xFFF5F5F5),
                                                                                        ),
                                                                                        child: Checkbox(
                                                                                          value: _model.checkboxValueMap3[specialTestsItem] ??= specialTestsCardSpecialTestsRecord != null,
                                                                                          onChanged: (newValue) async {
                                                                                            setState(() => _model.checkboxValueMap3[specialTestsItem] = newValue!);
                                                                                            if (newValue!) {
                                                                                              if (specialTestsCardSpecialTestsRecord != null) {
                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return AlertDialog(
                                                                                                          title: Text('Remove Test?'),
                                                                                                          content: Text('Are you sure you want to undo confirmation of this test?'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                              child: Text('Cancel'),
                                                                                                            ),
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                              child: Text('Confirm'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    ) ??
                                                                                                    false;
                                                                                                if (confirmDialogResponse) {
                                                                                                  final bookingsUpdateData1 = {
                                                                                                    'bookedSpecialTests': FieldValue.arrayRemove([
                                                                                                      specialTestsCardSpecialTestsRecord!.reference
                                                                                                    ]),
                                                                                                  };
                                                                                                  await widget.booking!.update(bookingsUpdateData1);
                                                                                                  await specialTestsCardSpecialTestsRecord!.reference.delete();
                                                                                                }
                                                                                              } else {
                                                                                                final specialTestsCreateData = createSpecialTestsRecordData(
                                                                                                  name: specialTestsItem.name,
                                                                                                  stringListIndex: specialTestsIndex,
                                                                                                  bookingRef: confirmTestsSheetBookingsRecord.reference,
                                                                                                  createdDate: getCurrentTimestamp,
                                                                                                  scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                  createdBy: testConfirmationStaffRecord!.reference,
                                                                                                  sampleCollected: false,
                                                                                                  resultSubmitted: false,
                                                                                                  description: specialTestsItem.description,
                                                                                                );
                                                                                                var specialTestsRecordReference = SpecialTestsRecord.collection.doc();
                                                                                                await specialTestsRecordReference.set(specialTestsCreateData);
                                                                                                _model.newSpecialTestCopy = SpecialTestsRecord.getDocumentFromData(specialTestsCreateData, specialTestsRecordReference);

                                                                                                final bookingsUpdateData2 = {
                                                                                                  'bookedSpecialTests': FieldValue.arrayUnion([
                                                                                                    _model.newSpecialTest!.reference
                                                                                                  ]),
                                                                                                };
                                                                                                await widget.booking!.update(bookingsUpdateData2);
                                                                                              }

                                                                                              setState(() {});
                                                                                            } else {
                                                                                              if (specialTestsCardSpecialTestsRecord != null) {
                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return AlertDialog(
                                                                                                          title: Text('Remove Test?'),
                                                                                                          content: Text('Are you sure you want to undo confirmation of this test?'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                              child: Text('Cancel'),
                                                                                                            ),
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                              child: Text('Confirm'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    ) ??
                                                                                                    false;
                                                                                                if (confirmDialogResponse) {
                                                                                                  final bookingsUpdateData1 = {
                                                                                                    'bookedSpecialTests': FieldValue.arrayRemove([
                                                                                                      specialTestsCardSpecialTestsRecord!.reference
                                                                                                    ]),
                                                                                                  };
                                                                                                  await widget.booking!.update(bookingsUpdateData1);
                                                                                                  await specialTestsCardSpecialTestsRecord!.reference.delete();
                                                                                                }
                                                                                              } else {
                                                                                                final specialTestsCreateData = createSpecialTestsRecordData(
                                                                                                  name: specialTestsItem.name,
                                                                                                  stringListIndex: specialTestsIndex,
                                                                                                  bookingRef: confirmTestsSheetBookingsRecord.reference,
                                                                                                  createdDate: getCurrentTimestamp,
                                                                                                  scheduledDate: confirmTestsSheetBookingsRecord.scheduledDate,
                                                                                                  createdBy: testConfirmationStaffRecord!.reference,
                                                                                                  sampleCollected: false,
                                                                                                  resultSubmitted: false,
                                                                                                  description: specialTestsItem.description,
                                                                                                );
                                                                                                var specialTestsRecordReference = SpecialTestsRecord.collection.doc();
                                                                                                await specialTestsRecordReference.set(specialTestsCreateData);
                                                                                                _model.newSpecialTestCopy2 = SpecialTestsRecord.getDocumentFromData(specialTestsCreateData, specialTestsRecordReference);

                                                                                                final bookingsUpdateData2 = {
                                                                                                  'bookedSpecialTests': FieldValue.arrayUnion([
                                                                                                    _model.newSpecialTest!.reference
                                                                                                  ]),
                                                                                                };
                                                                                                await widget.booking!.update(bookingsUpdateData2);
                                                                                              }

                                                                                              setState(() {});
                                                                                            }
                                                                                          },
                                                                                          activeColor: FlutterFlowTheme.of(context).primaryText,
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
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: smooth_page_indicator
                                                  .SmoothPageIndicator(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: 0),
                                                count: 3,
                                                axisDirection: Axis.horizontal,
                                                onDotClicked: (i) async {
                                                  await _model
                                                      .pageViewController!
                                                      .animateToPage(
                                                    i,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                effect: smooth_page_indicator
                                                    .ExpandingDotsEffect(
                                                  expansionFactor: 2.0,
                                                  spacing: 8.0,
                                                  radius: 16.0,
                                                  dotWidth: 16.0,
                                                  dotHeight: 16.0,
                                                  dotColor: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  activeDotColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  paintStyle:
                                                      PaintingStyle.fill,
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
                        );
                      },
                    ),
                  ],
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
                                          FFAppState().proceedconfirmation =
                                              true;
                                        });
                                        if (functions.checktestsListsEqual(
                                            confirmTestsSheetBookingsRecord
                                                .testsIncluded
                                                .toList(),
                                            confirmTestsSheetBookingsRecord
                                                .bookedTests
                                                .toList())) {
                                          if (FFAppState()
                                              .proceedconfirmation) {
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
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )} is confirmed.',
                                                createdDate:
                                                    getCurrentTimestamp,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
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
      ),
    );
  }
}
