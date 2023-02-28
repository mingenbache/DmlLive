import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/package_test_list/package_test_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_new_test_package_model.dart';
export 'add_new_test_package_model.dart';

class AddNewTestPackageWidget extends StatefulWidget {
  const AddNewTestPackageWidget({
    Key? key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _AddNewTestPackageWidgetState createState() =>
      _AddNewTestPackageWidgetState();
}

class _AddNewTestPackageWidgetState extends State<AddNewTestPackageWidget>
    with TickerProviderStateMixin {
  late AddNewTestPackageModel _model;

  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 82.0),
          end: Offset(0.0, 0.0),
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
    _model = createModel(context, () => AddNewTestPackageModel());

    _model.testPackageNameController ??= TextEditingController();
    _model.packageDescriptionController ??= TextEditingController();
    _model.testDurationTextController ??= TextEditingController(
        text: functions
            .doubletoInt(_model.testDurationSliderValue, 60.0)
            .toString());
    _model.resultsDurationTextController ??= TextEditingController(
        text: functions
            .doubletoInt(_model.durationResultsSliderValue, 2.0)
            .toString());
    _model.testPriceController ??= TextEditingController();
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

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: FutureBuilder<List<StaffRecord>>(
        future: queryStaffRecordOnce(
          queryBuilder: (staffRecord) =>
              staffRecord.where('UserRef', isEqualTo: currentUserReference),
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
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50.0,
                ),
              ),
            );
          }
          List<StaffRecord> columnStaffRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final columnStaffRecord = columnStaffRecordList.isNotEmpty
              ? columnStaffRecordList.first
              : null;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.9,
                    constraints: BoxConstraints(
                      maxHeight: 730.0,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).tertiaryColor,
                          Color(0xFF77A54A)
                        ],
                        stops: [0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -1.0),
                        end: AlignmentDirectional(-1.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
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
                                'NEW PACKAGE',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF586B06),
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
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      size: 30.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 3.0, 3.0, 3.0),
                                    child: TextFormField(
                                      controller:
                                          _model.testPackageNameController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.testPackageNameController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Test Package Name',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Color(0xFF586B06),
                                            ),
                                        hintText: 'Enter Name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Color(0xFF586B06),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF586B06),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x65FFFFFF),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15.0, 15.0, 15.0, 15.0),
                                        suffixIcon: _model
                                                .testPackageNameController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .testPackageNameController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            lineHeight: 1.4,
                                          ),
                                      validator: _model
                                          .testPackageNameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 50.0),
                                    child: PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 20.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Icon(
                                                            Icons
                                                                .category_outlined,
                                                            color: Colors.white,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Package Category',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Color(
                                                                    0xFF586B06),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                CategoriesRecord>>(
                                                          stream:
                                                              queryCategoriesRecord(
                                                            queryBuilder: (categoriesRecord) =>
                                                                categoriesRecord
                                                                    .where(
                                                                        'ispackage_Category',
                                                                        isEqualTo:
                                                                            true)
                                                                    .orderBy(
                                                                        'name'),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CategoriesRecord>
                                                                packageCategoryDropDownCategoriesRecordList =
                                                                snapshot.data!;
                                                            final packageCategoryDropDownCategoriesRecord =
                                                                packageCategoryDropDownCategoriesRecordList
                                                                        .isNotEmpty
                                                                    ? packageCategoryDropDownCategoriesRecordList
                                                                        .first
                                                                    : null;
                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              options:
                                                                  packageCategoryDropDownCategoriesRecord!
                                                                      .categories!
                                                                      .toList()
                                                                      .toList(),
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      _model.packageCategoryDropDownValue =
                                                                          val),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.4,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                              fillColor:
                                                                  Colors.white,
                                                              elevation: 2.0,
                                                              borderColor: Color(
                                                                  0xFF586B06),
                                                              borderWidth: 2.0,
                                                              borderRadius:
                                                                  10.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          8.0,
                                                                          4.0),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .packageDescriptionController,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.packageDescriptionController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () => setState(() {}),
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Package Description',
                                                      labelStyle:
                                                          GoogleFonts.getFont(
                                                        'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                      hintText: '\n',
                                                      hintStyle:
                                                          GoogleFonts.getFont(
                                                        'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
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
                                                            BorderRadius
                                                                .circular(12.0),
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
                                                                .circular(12.0),
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
                                                                .circular(12.0),
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
                                                                .circular(12.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFFEEEEEE),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      suffixIcon: _model
                                                              .packageDescriptionController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .packageDescriptionController
                                                                    ?.clear();
                                                                setState(() {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: Color(
                                                                    0xFF889238),
                                                                size: 15.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 99,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    validator: _model
                                                        .packageDescriptionControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF77A54A),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.64, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  -0.64, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SwitchListTile(
                                                          value: _model
                                                                  .atHomeToggleValue ??=
                                                              false,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                    .atHomeToggleValue =
                                                                newValue!);
                                                          },
                                                          title: Text(
                                                            'Test @ Home ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                          ),
                                                          subtitle: Text(
                                                            'Can the tests be done at home?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          ),
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryColor,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryColor,
                                                          dense: false,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Icon(
                                                          Icons.timer,
                                                          color: Colors.white,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Tests Duration:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Color(
                                                                    0xFF586B06),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          'in minutes',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.15,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xC1EEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFF586B06),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .testDurationTextController,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.testDurationTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          40),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '[Some hint text...]',
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFF586B06),
                                                                      fontSize:
                                                                          18.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .testDurationTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 150.0,
                                                          child:
                                                              Slider.adaptive(
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                            inactiveColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            min: 15.0,
                                                            max: 180.0,
                                                            value: _model
                                                                    .testDurationSliderValue ??=
                                                                60.0,
                                                            divisions: 17,
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() =>
                                                                  _model.testDurationSliderValue =
                                                                      newValue);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Icon(
                                                          Icons.timer,
                                                          color: Colors.white,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Results Duration:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: Color(
                                                                    0xFF586B06),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          'in hours',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.15,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xC1EEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFF586B06),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .resultsDurationTextController,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.resultsDurationTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '[Some hint text...]',
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Color(
                                                                          0xFF586B06),
                                                                      fontSize:
                                                                          18.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .resultsDurationTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 135.0,
                                                          child:
                                                              Slider.adaptive(
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                            inactiveColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            min: 1.0,
                                                            max: 120.0,
                                                            value: _model
                                                                    .durationResultsSliderValue ??=
                                                                4.0,
                                                            divisions: 119,
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() =>
                                                                  _model.durationResultsSliderValue =
                                                                      newValue);
                                                            },
                                                          ),
                                                        ),
                                                      ],
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
                                                  maxWidth: 300.0,
                                                ),
                                                decoration: BoxDecoration(),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        decoration:
                                                            BoxDecoration(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 20.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Icon(
                                                            Icons
                                                                .payments_outlined,
                                                            color: Colors.white,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Price',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color: Color(
                                                                  0xFF586B06),
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 120.0,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .testPriceController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              GoogleFonts
                                                                  .getFont(
                                                            'Roboto',
                                                            color: Color(
                                                                0xFF586B06),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                          hintText: 'Kshs...',
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
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
                                                                        12.0),
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
                                                                        12.0),
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
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Color(0xC1EEEEEE),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                        ),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                          color:
                                                              Color(0xFF586B06),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .testPriceControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .testPackSubmit =
                                                              true;
                                                        });
                                                      },
                                                      text: 'Continue',
                                                      options: FFButtonOptions(
                                                        width: 110.0,
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
                                                                .secondaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tests',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            Color(0xFF586B06),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
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
                                                              FFAppState()
                                                                  .testPackTests
                                                                  .toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
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
                                                                    final testPackTestItemTestsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Material(
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
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.03,
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      testPackTestItemTestsRecord.name!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Open Sans',
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
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
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    testPackTestItemTestsRecord.price!.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Open Sans',
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      if (FFAppState().testPackTests.contains(testsListItem)) {
                                                                                        FFAppState().update(() {
                                                                                          FFAppState().removeFromTestPackTests(testsListItem);
                                                                                        });
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
                                                                                        return;
                                                                                      } else {
                                                                                        return;
                                                                                      }
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.highlight_off,
                                                                                      color: Color(0xFFEB2424),
                                                                                      size: 18.0,
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .allCategories =
                                                                  true;
                                                            });
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      PackageTestListWidget(),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          text: 'Add Test',
                                                          icon: Icon(
                                                            Icons.playlist_add,
                                                            size: 15.0,
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
                                                                .secondaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(initialPage: 0),
                                        count: 2,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
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
                                          dotColor: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          activeDotColor: Colors.white,
                                          paintStyle: PaintingStyle.fill,
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
              ),
              if (FFAppState().testPackSubmit)
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.05),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final testPackagesCreateData = {
                                    ...createTestPackagesRecordData(
                                      price: int.tryParse(
                                          _model.testPriceController.text),
                                      packageName:
                                          _model.testPackageNameController.text,
                                      description: _model
                                          .packageDescriptionController.text,
                                      duration: double.tryParse(_model
                                          .testDurationTextController.text),
                                      durationResults: double.tryParse(_model
                                          .resultsDurationTextController.text),
                                      category:
                                          _model.packageCategoryDropDownValue,
                                      atHome: _model.atHomeToggleValue,
                                      createDate: getCurrentTimestamp,
                                    ),
                                    'TestsIncluded': FFAppState().testPackTests,
                                  };
                                  var testPackagesRecordReference =
                                      TestPackagesRecord.collection.doc();
                                  await testPackagesRecordReference
                                      .set(testPackagesCreateData);
                                  _model.newTestPackId =
                                      TestPackagesRecord.getDocumentFromData(
                                          testPackagesCreateData,
                                          testPackagesRecordReference);
                                  Navigator.pop(context);

                                  setState(() {});
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  width: 340.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation']!),
                            ),
                          ),
                        ],
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
