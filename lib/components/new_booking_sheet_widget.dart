import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../new_booking/new_booking_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBookingSheetWidget extends StatefulWidget {
  const NewBookingSheetWidget({Key key}) : super(key: key);

  @override
  _NewBookingSheetWidgetState createState() => _NewBookingSheetWidgetState();
}

class _NewBookingSheetWidgetState extends State<NewBookingSheetWidget>
    with TickerProviderStateMixin {
  BookingsRecord newbookingRef;
  PageController pageViewController;
  bool isPatientValue;
  TextEditingController docNameAddressController;
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      curve: Curves.linear,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 71),
        scale: 1,
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
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    docNameAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.45,
                  constraints: BoxConstraints(
                    maxWidth: 340,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).tertiaryColor,
                        Color(0xFF77A54A)
                      ],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 34, 21, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'NEW BOOKING',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF586B06),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
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
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          constraints: BoxConstraints(
                            maxHeight: 300,
                          ),
                          decoration: BoxDecoration(),
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        decoration: BoxDecoration(
                                          color: Color(0x34FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Text(
                                            'You have no Current Bookings. Would you like to start a new Booking?',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await pageViewController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text: 'Yes, Continue',
                                        options: FFButtonOptions(
                                          width: 140,
                                          height: 30,
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 1,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          height: 100,
                                          constraints: BoxConstraints(
                                            maxWidth: 248,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Are you the Patient?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 240,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      'Check the box if you are booking for yourself',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF586B06),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 50,
                                                      maxHeight: 50,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Theme(
                                                      data: ThemeData(
                                                        unselectedWidgetColor:
                                                            Color(0xFF707070),
                                                      ),
                                                      child: CheckboxListTile(
                                                        value:
                                                            isPatientValue ??=
                                                                FFAppState()
                                                                    .isPatient,
                                                        onChanged: (newValue) =>
                                                            setState(() =>
                                                                isPatientValue =
                                                                    newValue),
                                                        tileColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        activeColor:
                                                            Colors.white,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            setState(() => FFAppState()
                                                .lastBookingPage = true);
                                            setState(() => FFAppState()
                                                .isPatient = isPatientValue);
                                            await pageViewController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: 'Next',
                                          options: FFButtonOptions(
                                            width: 90,
                                            height: 30,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 150,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Text(
                                              'Do you have a referring Physician?',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3, 0, 3, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            constraints: BoxConstraints(
                                              maxWidth: 310,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 2, 0),
                                              child: TextFormField(
                                                controller:
                                                    docNameAddressController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'If Yes, Please enter their name and contact details here',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF586B06),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF586B06),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0x4FFFFFFF),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
                                                        ),
                                                maxLines: 3,
                                              ),
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
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: (FFAppState().lastBookingPage) == true,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;

                                    final bookingsCreateData =
                                        createBookingsRecordData(
                                      user: currentUserReference,
                                      createdDate: getCurrentTimestamp,
                                      isSubmitted: false,
                                      totalPrice: 0,
                                      totalTests: 0,
                                      docNameAddress:
                                          docNameAddressController.text,
                                      userPatient: isPatientValue,
                                      scheduledDate: functions.getNextWeekday(),
                                      bookingConfirmed: false,
                                      confirmationBegan: false,
                                      completed: false,
                                      testVerified: false,
                                      isInvoiced: false,
                                      paidFull: false,
                                      resultPublished: false,
                                    );
                                    var bookingsRecordReference =
                                        BookingsRecord.collection.doc();
                                    await bookingsRecordReference
                                        .set(bookingsCreateData);
                                    newbookingRef =
                                        BookingsRecord.getDocumentFromData(
                                            bookingsCreateData,
                                            bookingsRecordReference);
                                    _shouldSetState = true;
                                    setState(() => FFAppState().isPatient =
                                        isPatientValue);
                                    if (isPatientValue) {
                                      final bookingsUpdateData =
                                          createBookingsRecordData(
                                        firstname:
                                            currentUserDocument?.firstName,
                                        lastname: currentUserDocument?.lastName,
                                        emailaddress: currentUserEmail,
                                        sex: currentUserDocument?.sex,
                                        phonenumber: currentPhoneNumber,
                                        dOB: currentUserDocument?.dOB,
                                      );
                                      await newbookingRef.reference
                                          .update(bookingsUpdateData);
                                    }

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      currentBooking: newbookingRef.reference,
                                      hasCurrentBooking: true,
                                    );
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    if (isPatientValue) {
                                      setState(() =>
                                          FFAppState().dobEntered = false);
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'New Booking Created Successfully!',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    setState(() => FFAppState().dob =
                                        functions.returnDOBLoader(
                                            newbookingRef, isPatientValue));
                                    setState(() => FFAppState().selectedDate =
                                        functions.getNextWeekday());
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewBookingWidget(
                                          bookingRef: newbookingRef.reference,
                                        ),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'Continue',
                                  options: FFButtonOptions(
                                    width: 240,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
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
                                ),
                              ],
                            ),
                            Text(
                              'Tap above to complete request',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ).animated(
                            [animationsMap['columnOnPageLoadAnimation']]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
