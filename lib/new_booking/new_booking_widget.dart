import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/test_list_booking_sheet_widget.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBookingWidget extends StatefulWidget {
  const NewBookingWidget({
    Key key,
    this.bookingRef,
  }) : super(key: key);

  final DocumentReference bookingRef;

  @override
  _NewBookingWidgetState createState() => _NewBookingWidgetState();
}

class _NewBookingWidgetState extends State<NewBookingWidget>
    with TickerProviderStateMixin {
  DateTime datePicked1;
  DateTime datePicked2;
  String choiceChipsValue;
  TextEditingController emailAddressController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController phoneNumberController;
  TextEditingController diagnosisController;
  TextEditingController refDoctorController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1220,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -97),
        scale: 3,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 1100,
      hideBeforeAnimating: false,
      fadeIn: true,
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
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BookingsRecord>(
      stream: BookingsRecord.getDocument(widget.bookingRef),
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
        final newBookingBookingsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
                        sigmaX: 5,
                        sigmaY: 5,
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
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxWidth: 500,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x1F353535),
                          FlutterFlowTheme.of(context).tertiaryColor,
                          FlutterFlowTheme.of(context).primaryColor
                        ],
                        stops: [0, 0.6, 1],
                        begin: AlignmentDirectional(0.14, -1),
                        end: AlignmentDirectional(-0.14, 1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TopActionsWidget(),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Text(
                                  'TEST REQUEST',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Preferred Date',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -0.1),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await DatePicker.showDatePicker(
                                                context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(
                                                      () => datePicked1 = date);
                                                },
                                                currentTime:
                                                    newBookingBookingsRecord
                                                        .scheduledDate,
                                                minTime:
                                                    newBookingBookingsRecord
                                                        .scheduledDate,
                                              );

                                              setState(() => FFAppState()
                                                  .selectedDate = datePicked1);
                                            },
                                            text:
                                                functions.scheduleButtonString(
                                                    FFAppState().selectedDate,
                                                    functions.getNextWeekday()),
                                            icon: Icon(
                                              Icons.calendar_today,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 12,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 30,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ).animated(
                                    [animationsMap['rowOnPageLoadAnimation']]),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    currentUserReference),
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
                                  final containerUsersRecord = snapshot.data;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
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
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            constraints: BoxConstraints(
                                              maxHeight: 70,
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
                                                            .fromSTEB(
                                                                3, 3, 3, 3),
                                                    child: TextFormField(
                                                      controller:
                                                          firstNameController ??=
                                                              TextEditingController(
                                                        text:
                                                            newBookingBookingsRecord
                                                                .firstname,
                                                      ),
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        'firstNameController',
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
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
                                                                      0xFF95A1AC),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF586B06),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF586B06),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x2BFFFFFF),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    24, 0, 24),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      validator: (val) {
                                                        if (val == null ||
                                                            val.isEmpty) {
                                                          return 'Field is required';
                                                        }
                                                        if (val.length < 3) {
                                                          return 'Requires at least 3 characters.';
                                                        }

                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3, 3, 3, 3),
                                                    child: TextFormField(
                                                      controller:
                                                          lastNameController ??=
                                                              TextEditingController(
                                                        text:
                                                            newBookingBookingsRecord
                                                                .lastname,
                                                      ),
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        'lastNameController',
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
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
                                                                      0xFF95A1AC),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF586B06),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF586B06),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x2BFFFFFF),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    24, 0, 24),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      validator: (val) {
                                                        if (val == null ||
                                                            val.isEmpty) {
                                                          return 'Field is required';
                                                        }
                                                        if (val.length < 2) {
                                                          return 'Requires at least 2 characters.';
                                                        }

                                                        return null;
                                                      },
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
                                            maxHeight: 70,
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
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: TextFormField(
                                                    controller:
                                                        emailAddressController ??=
                                                            TextEditingController(
                                                      text:
                                                          newBookingBookingsRecord
                                                              .emailaddress,
                                                    ),
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      'emailAddressController',
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
                                                                color: Color(
                                                                    0xFFFDFDFD),
                                                                fontSize: 14,
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
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF586B06),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF586B06),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0x2BFFFFFF),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Field is required';
                                                      }

                                                      return null;
                                                    },
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
                                            maxHeight: 70,
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
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: TextFormField(
                                                    controller:
                                                        phoneNumberController ??=
                                                            TextEditingController(
                                                      text:
                                                          newBookingBookingsRecord
                                                              .phonenumber,
                                                    ),
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      'phoneNumberController',
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
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
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
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF586B06),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF586B06),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0x2BFFFFFF),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Field is required';
                                                      }
                                                      if (val.length < 6) {
                                                        return 'Requires at least 6 characters.';
                                                      }

                                                      return null;
                                                    },
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
                                            maxHeight: 70,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                2, 0, 0, 0),
                                                    child: Text(
                                                      'Sex',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Color(
                                                                0xFF586B06),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200,
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    children: [
                                                      if (!(newBookingBookingsRecord
                                                              .userPatient) ??
                                                          true)
                                                        FlutterFlowChoiceChips(
                                                          initiallySelected:
                                                              choiceChipsValue !=
                                                                      null
                                                                  ? [
                                                                      choiceChipsValue
                                                                    ]
                                                                  : [
                                                                      containerUsersRecord
                                                                          .sex
                                                                    ],
                                                          options: (functions
                                                                      .returnSexOptions() ??
                                                                  [])
                                                              .map((label) =>
                                                                  ChipData(
                                                                      label))
                                                              .toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  choiceChipsValue =
                                                                      val.first),
                                                          selectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                            iconSize: 18,
                                                            elevation: 4,
                                                          ),
                                                          unselectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                Color(
                                                                    0x1D6B6B6B),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                            iconSize: 18,
                                                            elevation: 0,
                                                          ),
                                                          chipSpacing: 10,
                                                          multiselect: false,
                                                          initialized:
                                                              choiceChipsValue !=
                                                                  null,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                        ),
                                                      if (newBookingBookingsRecord
                                                              .userPatient ??
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 5, 0),
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
                                                                          7),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (newBookingBookingsRecord
                                                                              .userPatient ??
                                                                          true)
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.18,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.04,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x2BFFFFFF),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                9,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              newBookingBookingsRecord.sex,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    fontWeight: FontWeight.normal,
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
                                            maxHeight: 70,
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
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: Text(
                                                    'Date of Birth',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
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
                                                                  0, 5, 5, 5),
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
                                                            0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x2CFFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF586B06),
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      6, 0, 0),
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
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (!(newBookingBookingsRecord
                                                          .userPatient) ??
                                                      true)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -0.1),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await DatePicker
                                                              .showDatePicker(
                                                            context,
                                                            showTitleActions:
                                                                true,
                                                            onConfirm: (date) {
                                                              setState(() =>
                                                                  datePicked2 =
                                                                      date);
                                                            },
                                                            currentTime:
                                                                getCurrentTimestamp,
                                                            minTime: DateTime(
                                                                0, 0, 0),
                                                          );

                                                          setState(() =>
                                                              FFAppState().dob =
                                                                  datePicked2);
                                                          setState(() =>
                                                              FFAppState()
                                                                      .dobEntered =
                                                                  true);
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
                                                              .tertiaryColor,
                                                          size: 12,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 30,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius: 16,
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
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                  controller: diagnosisController ??=
                                      TextEditingController(
                                    text: newBookingBookingsRecord.diagnosis,
                                  ),
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'diagnosisController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Clinical Diagnosis',
                                    labelStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'what symptioms are presenting?',
                                    hintStyle: GoogleFonts.getFont(
                                      'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            15, 15, 0, 5),
                                    suffixIcon: diagnosisController
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () => setState(
                                              () =>
                                                  diagnosisController?.clear(),
                                            ),
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF889238),
                                              size: 15,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 99,
                                  keyboardType: TextInputType.multiline,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Field is required';
                                    }
                                    if (val.length < 10) {
                                      return 'Requires at least 10 characters.';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              constraints: BoxConstraints(
                                maxHeight: 70,
                              ),
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: TextFormField(
                                        controller: refDoctorController ??=
                                            TextEditingController(
                                          text:
                                              '${newBookingBookingsRecord.docNames}',
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Doctor\'s Name and Address',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFF586B06),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText:
                                              'Enter your doctor\'s name and address...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF586B06),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF586B06),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x2BFFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 24, 0, 24),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.multiline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Requested Tests',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF586B06),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Builder(
                                            builder: (context) {
                                              final testsList =
                                                  newBookingBookingsRecord
                                                          .testsIncluded
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: testsList.length,
                                                itemBuilder:
                                                    (context, testsListIndex) {
                                                  final testsListItem =
                                                      testsList[testsListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 5, 10, 0),
                                                    child: StreamBuilder<
                                                        TestsRecord>(
                                                      stream: TestsRecord
                                                          .getDocument(
                                                              testsListItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        final bookingTestItemTestsRecord =
                                                            snapshot.data;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'Details',
                                                              queryParams: {
                                                                'testId': serializeParam(
                                                                    testsListItem,
                                                                    ParamType
                                                                        .DocumentReference),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.03,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.4,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            bookingTestItemTestsRecord.name,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  fontWeight: FontWeight.w500,
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            'Ksh',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          bookingTestItemTestsRecord
                                                                              .price
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            final bookingsUpdateData =
                                                                                {
                                                                              ...createBookingsRecordData(
                                                                                totalPrice: functions.removeFromCart(newBookingBookingsRecord.totalPrice, bookingTestItemTestsRecord.price),
                                                                                paymentBalance: functions.returnBookingBalance(bookingTestItemTestsRecord.price.toDouble(), newBookingBookingsRecord.paymentBalance),
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
                                                                          child:
                                                                              Icon(
                                                                            Icons.highlight_off,
                                                                            color:
                                                                                Color(0xFFEB2424),
                                                                            size:
                                                                                18,
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                final bookingsUpdateData =
                                                    createBookingsRecordData(
                                                  diagnosis: diagnosisController
                                                          ?.text ??
                                                      '',
                                                  scheduledDate: datePicked1,
                                                  docNameAddress:
                                                      refDoctorController
                                                              ?.text ??
                                                          '',
                                                );
                                                await newBookingBookingsRecord
                                                    .reference
                                                    .update(bookingsUpdateData);
                                                setState(() => FFAppState()
                                                    .allCategories = true);
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          TestListBookingSheetWidget(
                                                        bookingRef:
                                                            newBookingBookingsRecord
                                                                .reference,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              text: 'Add Test',
                                              icon: Icon(
                                                Icons.playlist_add,
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 30,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: 25,
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
                            Divider(
                              thickness: 1,
                              indent: 35,
                              endIndent: 35,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Total Price',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF586B06),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 100,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 3, 6, 3),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  newBookingBookingsRecord
                                                      .totalPrice,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                  currency: 'Ksh ',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.05),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 24, 0, 10),
                                child: FutureBuilder<List<UsersRecord>>(
                                  future: queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) => usersRecord
                                        .where('role', isEqualTo: 'front'),
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
                                    List<UsersRecord> buttonUsersRecordList =
                                        snapshot.data;
                                    return InkWell(
                                      onLongPress: () async {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.bookingValidator(
                                                  firstNameController?.text ??
                                                      '',
                                                  lastNameController?.text ??
                                                      '',
                                                  emailAddressController
                                                          ?.text ??
                                                      '',
                                                  phoneNumberController?.text ??
                                                      '',
                                                  choiceChipsValue,
                                                  newBookingBookingsRecord
                                                      .testsIncluded
                                                      .toList()),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          if (formKey.currentState == null ||
                                              !formKey.currentState
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
                                                            'Confirm Submission'),
                                                        content: Text(
                                                            'Are you sure you would like to submit this booking?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;

                                          final bookingsUpdateData =
                                              createBookingsRecordData(
                                            scheduledDate: datePicked1,
                                            diagnosis:
                                                diagnosisController?.text ?? '',
                                            firstname:
                                                firstNameController?.text ?? '',
                                            lastname:
                                                lastNameController?.text ?? '',
                                            phonenumber:
                                                phoneNumberController?.text ??
                                                    '',
                                            sex: choiceChipsValue,
                                            emailaddress:
                                                emailAddressController?.text ??
                                                    '',
                                            docNameAddress:
                                                refDoctorController?.text ?? '',
                                            isSubmitted: true,
                                            dOB: functions.returnDOB(
                                                newBookingBookingsRecord,
                                                FFAppState().dob,
                                                FFAppState().dobEntered,
                                                FFAppState().isPatient),
                                            paymentBalance:
                                                newBookingBookingsRecord
                                                    .totalPrice
                                                    .toDouble(),
                                          );
                                          await widget.bookingRef
                                              .update(bookingsUpdateData);
                                          setState(() =>
                                              FFAppState().isSubmitted = true);
                                          if (FFAppState().isSubmitted) {
                                            final notificationsCreateData = {
                                              ...createNotificationsRecordData(
                                                userRole: 'front',
                                                message:
                                                    'A new booking has been made.',
                                                createdDate:
                                                    getCurrentTimestamp,
                                                isBooking: true,
                                                isTest: false,
                                              ),
                                              'users_receiving':
                                                  buttonUsersRecordList
                                                      .map((e) => e.reference)
                                                      .toList(),
                                            };
                                            await NotificationsRecord.collection
                                                .doc()
                                                .set(notificationsCreateData);
                                          } else {
                                            return;
                                          }

                                          final usersUpdateData = {
                                            ...createUsersRecordData(
                                              hasCurrentBooking: false,
                                            ),
                                            'current_booking':
                                                FieldValue.delete(),
                                          };
                                          await currentUserReference
                                              .update(usersUpdateData);
                                          triggerPushNotification(
                                            notificationTitle:
                                                'New Booking Created',
                                            notificationText:
                                                'User created a new booking.',
                                            userRefs: buttonUsersRecordList
                                                .map((e) => e.reference)
                                                .toList(),
                                            initialPageName:
                                                'BookingConfirmation',
                                            parameterData: {
                                              'bookingRef': widget.bookingRef,
                                            },
                                          );
                                          context.goNamed('MyBookings');
                                        },
                                        text: 'Submit',
                                        options: FFButtonOptions(
                                          width: 280,
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 2,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 25,
                                        ),
                                      ),
                                    ).animated([
                                      animationsMap[
                                          'buttonOnActionTriggerAnimation']
                                    ]);
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
    );
  }
}
