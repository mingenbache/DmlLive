import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSpecialTestWidget extends StatefulWidget {
  const AddSpecialTestWidget({
    Key? key,
    this.userRef,
    this.scheduledDate,
  }) : super(key: key);

  final DocumentReference? userRef;
  final DateTime? scheduledDate;

  @override
  _AddSpecialTestWidgetState createState() => _AddSpecialTestWidgetState();
}

class _AddSpecialTestWidgetState extends State<AddSpecialTestWidget>
    with TickerProviderStateMixin {
  String? technologistValue;
  String? testCategoryValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  bool? atHomeToggleValue;
  TextEditingController? testDescriptionController;
  double? testDurationSliderValue;
  double? resultsDurationSliderValue;
  TextEditingController? testPriceController;
  TestsRecord? newTestId;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    testDescriptionController = TextEditingController();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    testPriceController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    testDescriptionController?.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    testPriceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: StreamBuilder<List<StaffRecord>>(
        stream: queryStaffRecord(
          queryBuilder: (staffRecord) =>
              staffRecord.where('UserRef', isEqualTo: currentUserReference),
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
          List<StaffRecord> columnStaffRecordList = snapshot.data!;
          final columnStaffRecord = columnStaffRecordList.isNotEmpty
              ? columnStaffRecordList.first
              : null;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.9,
                    constraints: BoxConstraints(
                      maxHeight: 829,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 2,
                                sigmaY: 2,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.9,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0x7F6CD7B7),
                                FlutterFlowTheme.of(context).secondaryColor
                              ],
                              stops: [0, 0.45],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ADD SPECIAL\nTEST',
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          context.pop();
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            buttonSize: 48,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 10, 16, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3, 3, 3, 3),
                                            child: TextFormField(
                                              controller: textController1,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'textController1',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Test Name',
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                hintText: 'Enter Test Name',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            15, 15, 15, 15),
                                                suffixIcon: textController1!
                                                        .text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          textController1
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 5, 16, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3, 3, 3, 3),
                                            child: TextFormField(
                                              controller: textController2,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'textController2',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Vendor Name',
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                hintText: 'Enter Vendor Name',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            15, 15, 15, 15),
                                                suffixIcon: textController2!
                                                        .text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          textController2
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 5, 16, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3, 3, 3, 3),
                                            child: TextFormField(
                                              controller: textController3,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'textController3',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Vendor Contacts',
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                hintText:
                                                    'Please provide Vendor Contact Details',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            15, 15, 15, 15),
                                                suffixIcon: textController3!
                                                        .text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          textController3
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        StreamBuilder<List<CategoriesRecord>>(
                                          stream: queryCategoriesRecord(
                                            queryBuilder: (categoriesRecord) =>
                                                categoriesRecord
                                                    .orderBy('name'),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CategoriesRecord>
                                                testCategoryCategoriesRecordList =
                                                snapshot.data!;
                                            final testCategoryCategoriesRecord =
                                                testCategoryCategoriesRecordList
                                                        .isNotEmpty
                                                    ? testCategoryCategoriesRecordList
                                                        .first
                                                    : null;
                                            return FlutterFlowDropDown(
                                              initialOption:
                                                  testCategoryValue ??=
                                                      'Uncategorized',
                                              options:
                                                  testCategoryCategoriesRecord!
                                                      .categories!
                                                      .toList()
                                                      .toList(),
                                              onChanged: (val) => setState(() =>
                                                  testCategoryValue = val),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: 40,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                              hintText: 'Choose Category',
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 15,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2,
                                              borderColor: Color(0x00000000),
                                              borderWidth: 0,
                                              borderRadius: 10,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(8, 4, 8, 4),
                                              hidesUnderline: true,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 20,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.category_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      Text(
                                        'Test Category',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: SwitchListTile(
                                              value: atHomeToggleValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    atHomeToggleValue =
                                                        newValue!);
                                              },
                                              title: Text(
                                                'Test @ Home ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'Can the test be done at home?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                        ),
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 20),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: TextFormField(
                                          controller: testDescriptionController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'testDescriptionController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Test Description',
                                            hintText:
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius lorem non eros sodales porta. Maecenas quis nulla lacinia, sollicitudin augue eget, iaculis tortor. \n\n',
                                            hintStyle: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 2, 0, 5),
                                            suffixIcon:
                                                testDescriptionController!
                                                        .text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          testDescriptionController
                                                              ?.clear();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF889238),
                                                          size: 15,
                                                        ),
                                                      )
                                                    : null,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 99,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 100,
                                    constraints: BoxConstraints(
                                      maxWidth: 340,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 10),
                                            child: StreamBuilder<
                                                List<StaffRecord>>(
                                              stream: queryStaffRecord(
                                                queryBuilder: (staffRecord) =>
                                                    staffRecord.where('role',
                                                        isEqualTo:
                                                            'technologist'),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<StaffRecord>
                                                    technologistStaffRecordList =
                                                    snapshot.data!;
                                                return FlutterFlowDropDown(
                                                  initialOption:
                                                      technologistValue ??=
                                                          'No Technologist Assigned',
                                                  options:
                                                      technologistStaffRecordList
                                                          .map((e) =>
                                                              e.displayName!)
                                                          .toList()
                                                          .toList(),
                                                  onChanged: (val) => setState(
                                                      () => technologistValue =
                                                          val),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  height: 60,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText:
                                                      'Choose Technologist',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 15,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2,
                                                  borderColor:
                                                      Color(0x00FFFFFF),
                                                  borderWidth: 2,
                                                  borderRadius: 8,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(20, 20, 12, 20),
                                                  hidesUnderline: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: Container(
                                                    width: 20,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.timer,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Test Duration:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 150,
                                                child: Slider.adaptive(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  inactiveColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  min: 15,
                                                  max: 180,
                                                  value:
                                                      testDurationSliderValue ??=
                                                          functions
                                                              .intToDouble(60),
                                                  label: testDurationSliderValue
                                                      .toString(),
                                                  divisions: 33,
                                                  onChanged: (newValue) {
                                                    setState(() =>
                                                        testDurationSliderValue =
                                                            newValue);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'in minutes',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    fontSize: 14,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                constraints: BoxConstraints(
                                                  maxWidth: 100,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0x99FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    testDurationSliderValue
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                            maxChars: 3),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
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
                                  Divider(
                                    thickness: 1,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 2, 0),
                                                child: Container(
                                                  width: 20,
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    Icons.timer,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Results Duration:',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              width: 150,
                                              child: Slider.adaptive(
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                inactiveColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                min: 1,
                                                max: 180,
                                                value:
                                                    resultsDurationSliderValue ??=
                                                        functions
                                                            .intToDouble(3),
                                                label:
                                                    resultsDurationSliderValue
                                                        .toString(),
                                                divisions: 179,
                                                onChanged: (newValue) {
                                                  setState(() =>
                                                      resultsDurationSliderValue =
                                                          newValue);
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'in Hours',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              constraints: BoxConstraints(
                                                maxWidth: 100,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0x99FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  resultsDurationSliderValue
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                          maxChars: 3),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    constraints: BoxConstraints(
                                      maxWidth: 300,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: Container(
                                                    width: 20,
                                                    decoration: BoxDecoration(),
                                                    child: Icon(
                                                      Icons.payments_outlined,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Price',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.04,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: TextFormField(
                                                    controller:
                                                        testPriceController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: 'Kshs...',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0.05),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final testsCreateData = createTestsRecordData(
                              price: int.parse(testPriceController!.text),
                              name: textController1!.text,
                              homeTest: atHomeToggleValue,
                              description: testDescriptionController!.text,
                              duration: testDurationSliderValue,
                              durationResults: resultsDurationSliderValue,
                              category: testCategoryValue,
                              isAvailable: true,
                            );
                            var testsRecordReference =
                                TestsRecord.collection.doc();
                            await testsRecordReference.set(testsCreateData);
                            newTestId = TestsRecord.getDocumentFromData(
                                testsCreateData, testsRecordReference);

                            context.pushNamed(
                              'Details',
                              queryParams: {
                                'testId': serializeParam(
                                  newTestId!.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'New Test Added',
                                  style: TextStyle(),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x00000000),
                              ),
                            );

                            setState(() {});
                          },
                          text: 'Add Test',
                          options: FFButtonOptions(
                            width: 340,
                            height: 60,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
