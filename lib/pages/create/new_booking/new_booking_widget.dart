import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/add_special_test_booking/add_special_test_booking_widget.dart';
import '/components/no_tests_added/no_tests_added_widget.dart';
import '/components/package_details_popup/package_details_popup_widget.dart';
import '/components/special_test_list_item/special_test_list_item_widget.dart';
import '/components/test_list_booking_sheet/test_list_booking_sheet_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'new_booking_model.dart';
export 'new_booking_model.dart';

class NewBookingWidget extends StatefulWidget {
  const NewBookingWidget({
    Key? key,
    this.bookingRef,
  }) : super(key: key);

  final DocumentReference? bookingRef;

  @override
  _NewBookingWidgetState createState() => _NewBookingWidgetState();
}

class _NewBookingWidgetState extends State<NewBookingWidget>
    with TickerProviderStateMixin {
  late NewBookingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1220.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1220.ms,
          begin: Offset(0.0, -97.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1220.ms,
          begin: 3.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1100.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1100.ms,
          begin: 1.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewBookingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(FFAppState().selectedDate != null)) {
        setState(() {
          FFAppState().selectedDate = functions.getNextWeekday();
        });
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<BookingsRecord>(
        stream:
            BookingsRecord.getDocument(currentUserDocument!.currentBooking!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50.0,
                ),
              ),
            );
          }
          final newBookingBookingsRecord = snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Image.asset(
                          'assets/images/Doctor_office_examination_-_1280x757.jpeg',
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x996CD7B7), Colors.white],
                          stops: [0.0, 0.6],
                          begin: AlignmentDirectional(0.14, -1.0),
                          end: AlignmentDirectional(-0.14, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.topActionsModel,
                                    updateCallback: () => setState(() {}),
                                    child: TopActionsWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'TEST REQUEST',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 24.0,
                                            ),
                                            Text(
                                              'Preferred Date',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            final _datePicked1Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  newBookingBookingsRecord
                                                      .scheduledDate!,
                                              firstDate:
                                                  newBookingBookingsRecord
                                                      .scheduledDate!,
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePicked1Date != null) {
                                              setState(() {
                                                _model.datePicked1 = DateTime(
                                                  _datePicked1Date.year,
                                                  _datePicked1Date.month,
                                                  _datePicked1Date.day,
                                                );
                                              });
                                            }
                                            FFAppState().update(() {
                                              FFAppState().selectedDate =
                                                  _model.datePicked1;
                                            });
                                          },
                                          text: functions.scheduleButtonString(
                                              FFAppState().selectedDate,
                                              functions.getNextWeekday())!,
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 12.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation']!),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 20.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.person_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Patient Details',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            constraints: BoxConstraints(
                                              maxHeight: 70.0,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 3.0,
                                                                3.0, 3.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                              .firstNameController ??=
                                                          TextEditingController(
                                                        text:
                                                            newBookingBookingsRecord
                                                                .firstname,
                                                      ),
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.firstNameController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'First Name',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        hintText:
                                                            'Enter your name here...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFFFCFCFC),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xCAFFFFFF),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      validator: _model
                                                          .firstNameControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(3.0, 3.0,
                                                                3.0, 3.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                              .lastNameController ??=
                                                          TextEditingController(
                                                        text:
                                                            newBookingBookingsRecord
                                                                .lastname,
                                                      ),
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.lastNameController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Last Name',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        hintText:
                                                            'Enter your name here...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFFFCFCFC),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xCAFFFFFF),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    0.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      validator: _model
                                                          .lastNameControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          constraints: BoxConstraints(
                                            maxHeight: 70.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 3.0, 3.0, 3.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                            .emailAddressController ??=
                                                        TextEditingController(
                                                      text:
                                                          newBookingBookingsRecord
                                                              .emailaddress,
                                                    ),
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.emailAddressController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () => setState(() {}),
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Email Address',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      hintText:
                                                          'Enter the patient\'s email address  here...',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xC9FFFFFF),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  24.0,
                                                                  0.0,
                                                                  24.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: _model
                                                        .emailAddressControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          constraints: BoxConstraints(
                                            maxHeight: 70.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 3.0, 3.0, 3.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                            .phoneNumberController ??=
                                                        TextEditingController(
                                                      text:
                                                          newBookingBookingsRecord
                                                              .phonenumber,
                                                    ),
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.phoneNumberController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () => setState(() {}),
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Phone Number',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      hintText:
                                                          'Enter the patient\'s phone number  here...',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xC9FFFFFF),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  24.0,
                                                                  0.0,
                                                                  24.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    validator: _model
                                                        .phoneNumberControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          constraints: BoxConstraints(
                                            maxHeight: 70.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Sex',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Stack(
                                                    children: [
                                                      if (!newBookingBookingsRecord
                                                          .userPatient!)
                                                        FlutterFlowChoiceChips(
                                                          initiallySelected: [
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.sex,
                                                                '')
                                                          ],
                                                          options: functions
                                                              .returnSexOptions()
                                                              .map((label) =>
                                                                  ChipData(
                                                                      label))
                                                              .toList(),
                                                          onChanged: (val) =>
                                                              setState(() => _model
                                                                      .choiceChipsValue =
                                                                  val?.first),
                                                          selectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                            iconColor:
                                                                Colors.white,
                                                            iconSize: 18.0,
                                                            elevation: 4.0,
                                                          ),
                                                          unselectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                Color(
                                                                    0x1DFFFFFF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                            iconSize: 18.0,
                                                            elevation: 0.0,
                                                          ),
                                                          chipSpacing: 10.0,
                                                          multiselect: false,
                                                          initialized: _model
                                                                  .choiceChipsValue !=
                                                              null,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                        ),
                                                      if (newBookingBookingsRecord
                                                              .userPatient ??
                                                          true)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.6,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.04,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if (newBookingBookingsRecord
                                                                          .userPatient ??
                                                                      true)
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.18,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.04,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xC9FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              newBookingBookingsRecord.sex!,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Open Sans',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontWeight: FontWeight.normal,
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          constraints: BoxConstraints(
                                            maxHeight: 70.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Date of Birth',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Stack(
                                                children: [
                                                  if (newBookingBookingsRecord
                                                          .userPatient ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xCAFFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      6.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            functions.returnDateString(functions.returnDOB(
                                                                newBookingBookingsRecord,
                                                                FFAppState()
                                                                    .dob,
                                                                FFAppState()
                                                                    .dobEntered,
                                                                newBookingBookingsRecord
                                                                    .userPatient)),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (!newBookingBookingsRecord
                                                      .userPatient!)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -0.1),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          final _datePicked2Date =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                getCurrentTimestamp,
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2050),
                                                          );

                                                          if (_datePicked2Date !=
                                                              null) {
                                                            setState(() {
                                                              _model.datePicked2 =
                                                                  DateTime(
                                                                _datePicked2Date
                                                                    .year,
                                                                _datePicked2Date
                                                                    .month,
                                                                _datePicked2Date
                                                                    .day,
                                                              );
                                                            });
                                                          }
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState().dob =
                                                                _model
                                                                    .datePicked2;
                                                            FFAppState()
                                                                    .dobEntered =
                                                                true;
                                                          });
                                                        },
                                                        text: functions
                                                            .dobButtonString(
                                                                FFAppState()
                                                                    .dobEntered,
                                                                FFAppState()
                                                                    .dob),
                                                        icon: Icon(
                                                          Icons.calendar_today,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          size: 12.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130.0,
                                                          height: 30.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 10.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  constraints: BoxConstraints(
                                    maxHeight: 190.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.art_track,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 18.0,
                                              ),
                                              Text(
                                                'Attached Documents',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          constraints: BoxConstraints(
                                            maxWidth: 380.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final bookingImages = _model
                                                  .uploadedFileUrls
                                                  .toList();
                                              return Wrap(
                                                spacing: 5.0,
                                                runSpacing: 5.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    bookingImages.length,
                                                    (bookingImagesIndex) {
                                                  final bookingImagesItem =
                                                      bookingImages[
                                                          bookingImagesIndex];
                                                  return InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              bookingImagesItem,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag:
                                                                bookingImagesItem,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: bookingImagesItem,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          bookingImagesItem,
                                                          width: 70.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          constraints: BoxConstraints(
                                            maxWidth: 380.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.9, 0.9),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        final selectedMedia =
                                                            await selectMedia(
                                                          mediaSource:
                                                              MediaSource
                                                                  .photoGallery,
                                                          multiImage: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          setState(() => _model
                                                                  .isMediaUploading =
                                                              true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];
                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes),
                                                              ),
                                                            ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                          } finally {
                                                            _model.isMediaUploading =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            setState(() {
                                                              _model.uploadedLocalFiles =
                                                                  selectedUploadedFiles;
                                                              _model.uploadedFileUrls =
                                                                  downloadUrls;
                                                            });
                                                          } else {
                                                            setState(() {});
                                                            return;
                                                          }
                                                        }
                                                      },
                                                      text: 'Add Image',
                                                      icon: Icon(
                                                        Icons
                                                            .drive_folder_upload,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 16.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
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
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 3.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.thermostat_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 18.0,
                                            ),
                                            Text(
                                              'Diagnosis Details',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Open Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 20.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: TextFormField(
                                            controller:
                                                _model.diagnosisController ??=
                                                    TextEditingController(
                                              text: newBookingBookingsRecord
                                                  .diagnosis,
                                            ),
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.diagnosisController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText: 'Clinical Diagnosis',
                                              labelStyle: GoogleFonts.getFont(
                                                'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              hintText:
                                                  'what symptioms are presenting?',
                                              hintStyle: GoogleFonts.getFont(
                                                'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14.0,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xCAFFFFFF),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 20.0, 0.0, 5.0),
                                              suffixIcon: _model
                                                      .diagnosisController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .diagnosisController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 15.0,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 99,
                                            keyboardType:
                                                TextInputType.multiline,
                                            validator: _model
                                                .diagnosisControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        constraints: BoxConstraints(
                                          maxHeight: 70.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 3.0, 3.0, 3.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .refDoctorController ??=
                                                      TextEditingController(
                                                    text:
                                                        '${newBookingBookingsRecord.docNames}',
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Doctor\'s Name and Address',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText:
                                                        'Enter your doctor\'s name and address...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF95A1AC),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xC9FFFFFF),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                24.0,
                                                                0.0,
                                                                24.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  validator: _model
                                                      .refDoctorControllerValidator
                                                      .asValidator(context),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 10.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.list_alt_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                              Text(
                                                ' Requested Tests',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Container(
                                              height: newBookingBookingsRecord
                                                          .testPackages!
                                                          .toList()
                                                          .length <
                                                      1
                                                  ? 100.0
                                                  : 400.0,
                                              constraints: BoxConstraints(
                                                maxHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.4,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Test Packages',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      if (newBookingBookingsRecord
                                                              .testPackages!
                                                              .toList()
                                                              .length >
                                                          0)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        4.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    newBookingBookingsRecord
                                                                        .testPackages!
                                                                        .toList()
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            11.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final packagesList =
                                                              newBookingBookingsRecord
                                                                  .testPackages!
                                                                  .toList();
                                                          if (packagesList
                                                              .isEmpty) {
                                                            return NoTestsAddedWidget(
                                                              testString:
                                                                  'you have not added any packages to this list yet.',
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                packagesList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                packagesListIndex) {
                                                              final packagesListItem =
                                                                  packagesList[
                                                                      packagesListIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    TestPackagesRecord>(
                                                                  stream: TestPackagesRecord
                                                                      .getDocument(
                                                                          packagesListItem),
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
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final bookingTestPackageItemTestPackagesRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
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
                                                                              child: PackageDetailsPopupWidget(
                                                                                package: bookingTestPackageItemTestPackagesRecord,
                                                                                booking: widget.bookingRef,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: MediaQuery.of(context).size.width * 0.4,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            bookingTestPackageItemTestPackagesRecord.packageName!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Text(
                                                                                            'Ksh',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Open Sans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          bookingTestPackageItemTestPackagesRecord.price!.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Open Sans',
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          onTap: () async {
                                                                                            final bookingsUpdateData = {
                                                                                              ...createBookingsRecordData(
                                                                                                totalPrice: functions.removeFromCart(newBookingBookingsRecord.totalPrice, bookingTestPackageItemTestPackagesRecord.price),
                                                                                                paymentBalance: functions.returnBookingBalance(bookingTestPackageItemTestPackagesRecord.price?.toDouble(), newBookingBookingsRecord.paymentBalance),
                                                                                              ),
                                                                                              'total_tests': FieldValue.increment(-(bookingTestPackageItemTestPackagesRecord.testsIncluded!.toList().length)),
                                                                                              'testPackages': FieldValue.arrayRemove([
                                                                                                packagesListItem
                                                                                              ]),
                                                                                              'testPackTests': functions.removeTestsfromList(bookingTestPackageItemTestPackagesRecord.testsIncluded!.toList(), newBookingBookingsRecord.testPackTests!.toList()),
                                                                                            };
                                                                                            await newBookingBookingsRecord.reference.update(bookingsUpdateData);
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  'Test Removed',
                                                                                                  style: TextStyle(),
                                                                                                ),
                                                                                                duration: Duration(milliseconds: 4000),
                                                                                                backgroundColor: Color(0x00000000),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.highlight_off,
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final packageTests = bookingTestPackageItemTestPackagesRecord.testsIncluded!.toList();
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: packageTests.length,
                                                                                  itemBuilder: (context, packageTestsIndex) {
                                                                                    final packageTestsItem = packageTests[packageTestsIndex];
                                                                                    return Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                                                                                      child: StreamBuilder<TestsRecord>(
                                                                                        stream: TestsRecord.getDocument(packageTestsItem),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                child: SpinKitRipple(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  size: 50.0,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          final packageTestItemTestsRecord = snapshot.data!;
                                                                                          return InkWell(
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                'Details',
                                                                                                queryParams: {
                                                                                                  'testId': serializeParam(
                                                                                                    packageTestItemTestsRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 2.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              functions.camelCase(packageTestItemTestsRecord.name),
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Open Sans',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
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
                                                                          ],
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
                                                  Divider(
                                                    thickness: 1.0,
                                                    indent: 12.0,
                                                    endIndent: 12.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.3,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Standalone Tests',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      if (newBookingBookingsRecord
                                                              .testsIncluded!
                                                              .toList()
                                                              .length >
                                                          0)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        4.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    newBookingBookingsRecord
                                                                        .testsIncluded!
                                                                        .toList()
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            11.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final testsList =
                                                              newBookingBookingsRecord
                                                                  .testsIncluded!
                                                                  .toList();
                                                          if (testsList
                                                              .isEmpty) {
                                                            return NoTestsAddedWidget(
                                                              testString:
                                                                  'you have not added any tests yet. ',
                                                            );
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: testsList
                                                                .length,
                                                            itemBuilder: (context,
                                                                testsListIndex) {
                                                              final testsListItem =
                                                                  testsList[
                                                                      testsListIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    TestsRecord>(
                                                                  stream: TestsRecord
                                                                      .getDocument(
                                                                          testsListItem),
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
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final bookingTestItemTestsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Details',
                                                                          queryParams:
                                                                              {
                                                                            'testId':
                                                                                serializeParam(
                                                                              testsListItem,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.03,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        functions.camelCase(bookingTestItemTestsRecord.name),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Open Sans',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        'Ksh',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Open Sans',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      bookingTestItemTestsRecord.price!.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        final bookingsUpdateData = {
                                                                                          ...createBookingsRecordData(
                                                                                            totalPrice: functions.removeFromCart(newBookingBookingsRecord.totalPrice, bookingTestItemTestsRecord.price),
                                                                                            paymentBalance: functions.returnBookingBalance(bookingTestItemTestsRecord.price?.toDouble(), newBookingBookingsRecord.paymentBalance),
                                                                                          ),
                                                                                          'tests_included': FieldValue.arrayRemove([
                                                                                            testsListItem
                                                                                          ]),
                                                                                          'total_tests': FieldValue.increment(-1),
                                                                                        };
                                                                                        await newBookingBookingsRecord.reference.update(bookingsUpdateData);
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Test Removed',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: Color(0x00000000),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.highlight_off,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 18.0,
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
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    indent: 12.0,
                                                    endIndent: 12.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if (newBookingBookingsRecord
                                                      .specialTests!
                                                      .toList()
                                                      .length >
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.16,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (FFAppState()
                                                              .specialTestsAdded)
                                                            Icon(
                                                              Icons
                                                                  .arrow_downward,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          if (FFAppState()
                                                              .specialTestsAdded)
                                                            Text(
                                                              'Pull to refresh after editing',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (newBookingBookingsRecord
                                                      .specialTests!
                                                      .toList()
                                                      .length >
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxHeight:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.4,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Special Tests',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            if (newBookingBookingsRecord
                                                                    .specialTests!
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          newBookingBookingsRecord
                                                                              .specialTests!
                                                                              .toList()
                                                                              .length
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 11.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final specialtestsList =
                                                                    newBookingBookingsRecord
                                                                        .specialTests!
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList();
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      specialtestsList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          specialtestsListIndex) {
                                                                    final specialtestsListItem =
                                                                        specialtestsList[
                                                                            specialtestsListIndex];
                                                                    return SpecialTestListItemWidget(
                                                                      key: Key(
                                                                          'Keyt3y_${specialtestsListIndex}_of_${specialtestsList.length}'),
                                                                      index:
                                                                          specialtestsListIndex,
                                                                      bookingRef:
                                                                          widget
                                                                              .bookingRef,
                                                                      specialTestDataType:
                                                                          specialtestsListItem,
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
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            Color(0xAEF1F4F8),
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                AddSpecialTestBookingWidget(
                                                              userRef:
                                                                  currentUserReference,
                                                              bookingRef: widget
                                                                  .bookingRef,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: 'Add Special Test',
                                                    icon: Icon(
                                                      Icons.playlist_add,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 170.0,
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 1.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      final bookingsUpdateData =
                                                          createBookingsRecordData(
                                                        diagnosis: _model
                                                            .diagnosisController
                                                            .text,
                                                        scheduledDate:
                                                            _model.datePicked1,
                                                        docNameAddress: _model
                                                            .refDoctorController
                                                            .text,
                                                      );
                                                      await newBookingBookingsRecord
                                                          .reference
                                                          .update(
                                                              bookingsUpdateData);
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .allCategories =
                                                            true;
                                                      });
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                TestListBookingSheetWidget(
                                                              bookingRef:
                                                                  newBookingBookingsRecord
                                                                      .reference,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: 'Add Test',
                                                    icon: Icon(
                                                      Icons.playlist_add,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130.0,
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                      elevation: 1.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
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
                                ),
                              ),
                              Divider(
                                height: 35.0,
                                thickness: 1.0,
                                indent: 35.0,
                                endIndent: 35.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 5.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Price',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 6.0, 6.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: Text(
                                                  formatNumber(
                                                    newBookingBookingsRecord
                                                        .totalPrice!,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .periodDecimal,
                                                    currency: 'Ksh ',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.05),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 10.0),
                                  child: FutureBuilder<List<UsersRecord>>(
                                    future: queryUsersRecordOnce(
                                      queryBuilder: (usersRecord) => usersRecord
                                          .where('role', isEqualTo: 'front'),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord> buttonUsersRecordList =
                                          snapshot.data!;
                                      final buttonUsersRecord =
                                          buttonUsersRecordList.isNotEmpty
                                              ? buttonUsersRecordList.first
                                              : null;
                                      return InkWell(
                                        onLongPress: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                functions.bookingValidator(
                                                    _model.firstNameController
                                                        .text,
                                                    _model.lastNameController
                                                        .text,
                                                    _model
                                                        .emailAddressController
                                                        .text,
                                                    _model.phoneNumberController
                                                        .text,
                                                    _model.choiceChipsValue,
                                                    newBookingBookingsRecord
                                                        .testsIncluded!
                                                        .toList()),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor: Colors.white,
                                            ),
                                          );
                                        },
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Confirm New Booking?'),
                                                          content: Text(
                                                              'Booking for ${dateTimeFormat('MMMEd', FFAppState().selectedDate)} with  ${newBookingBookingsRecord.testsIncluded!.toList().length.toString()} tests and ${newBookingBookingsRecord.testPackages!.toList().length.toString()} test packages.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              final bookingsUpdateData =
                                                  createBookingsRecordData(
                                                scheduledDate:
                                                    _model.datePicked1,
                                                diagnosis: _model
                                                    .diagnosisController.text,
                                                firstname: _model
                                                    .firstNameController.text,
                                                lastname: _model
                                                    .lastNameController.text,
                                                phonenumber: _model
                                                    .phoneNumberController.text,
                                                sex: _model.choiceChipsValue,
                                                emailaddress: _model
                                                    .emailAddressController
                                                    .text,
                                                docNameAddress: _model
                                                    .refDoctorController.text,
                                                isSubmitted: true,
                                                dOB: functions.returnDOB(
                                                    newBookingBookingsRecord,
                                                    FFAppState().dob,
                                                    FFAppState().dobEntered,
                                                    FFAppState().isPatient),
                                                paymentBalance:
                                                    newBookingBookingsRecord
                                                        .totalPrice
                                                        ?.toDouble(),
                                              );
                                              await widget.bookingRef!
                                                  .update(bookingsUpdateData);
                                              FFAppState().update(() {
                                                FFAppState().isSubmitted = true;
                                              });

                                              final usersUpdateData = {
                                                ...createUsersRecordData(
                                                  hasCurrentBooking: false,
                                                ),
                                                'current_booking':
                                                    FieldValue.delete(),
                                              };
                                              await currentUserReference!
                                                  .update(usersUpdateData);

                                              final notificationsCreateData = {
                                                ...createNotificationsRecordData(
                                                  userRole: 'front',
                                                  message:
                                                      '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')} Has created a new booking for ${dateTimeFormat('MMMEd', _model.datePicked1)}',
                                                  createdDate:
                                                      getCurrentTimestamp,
                                                  isSeen: false,
                                                  isBooking: true,
                                                  isTest: false,
                                                  type: 'newbooking',
                                                  bookingRef:
                                                      newBookingBookingsRecord
                                                          .reference,
                                                  userRef: currentUserReference,
                                                  istestedtest: false,
                                                ),
                                                'users_receiving': [
                                                  buttonUsersRecord!.reference
                                                ],
                                              };
                                              await NotificationsRecord
                                                  .collection
                                                  .doc()
                                                  .set(notificationsCreateData);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Booking successfully created.',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              );
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'New Booking Created',
                                                notificationText:
                                                    'User created a new booking.',
                                                userRefs: [
                                                  buttonUsersRecord!.reference
                                                ],
                                                initialPageName:
                                                    'BookingConfirmation',
                                                parameterData: {
                                                  'bookingRef':
                                                      widget.bookingRef,
                                                },
                                              );

                                              context.goNamed('MyBookings');
                                            }
                                          },
                                          text: 'Submit',
                                          options: FFButtonOptions(
                                            width: 280.0,
                                            height: 60.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'buttonOnActionTriggerAnimation']!,
                                          hasBeenTriggered: hasButtonTriggered);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
