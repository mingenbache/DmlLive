import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTestWidget extends StatefulWidget {
  const EditTestWidget({
    Key? key,
    this.userRef,
    this.testRef,
  }) : super(key: key);

  final DocumentReference? userRef;
  final DocumentReference? testRef;

  @override
  _EditTestWidgetState createState() => _EditTestWidgetState();
}

class _EditTestWidgetState extends State<EditTestWidget> {
  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? testDescriptionController;
  bool? atHomeToggleValue;
  double? testDurationSliderValue;
  TextEditingController? resultsDurationTextController;
  double? durationResultsSliderValue;
  TextEditingController? testPriceController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    resultsDurationTextController = TextEditingController(
        text: formatNumber(
      durationResultsSliderValue,
      formatType: FormatType.custom,
      format: '###',
      locale: '',
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    resultsDurationTextController?.dispose();
    testDescriptionController?.dispose();
    textController1?.dispose();
    testPriceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: StreamBuilder<TestsRecord>(
        stream: TestsRecord.getDocument(widget.testRef!),
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
          final columnTestsRecord = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.9,
                  constraints: BoxConstraints(
                    maxHeight: 730,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.9,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'EDIT TEST',
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF586B06),
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
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.77,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 20),
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
                                                          textController1 ??=
                                                              TextEditingController(
                                                        text: columnTestsRecord
                                                            .name,
                                                      ),
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        'textController1',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Test Name',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF586B06),
                                                                ),
                                                        hintText:
                                                            'Enter Test Name',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF586B06),
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
                                                                  .circular(12),
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
                                                                  .circular(12),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x65FFFFFF),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15,
                                                                    15, 15, 15),
                                                        suffixIcon:
                                                            textController1!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      textController1
                                                                          ?.clear();
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: Color(
                                                                          0xFF757575),
                                                                      size: 22,
                                                                    ),
                                                                  )
                                                                : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 1.4,
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 20),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 20,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Icon(
                                                        Icons.category_outlined,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Test Category',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Color(
                                                                0xFF586B06),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    StreamBuilder<
                                                        List<CategoriesRecord>>(
                                                      stream:
                                                          queryCategoriesRecord(
                                                        queryBuilder:
                                                            (categoriesRecord) =>
                                                                categoriesRecord
                                                                    .orderBy(
                                                                        'name'),
                                                        singleRecord: true,
                                                      ),
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
                                                        List<CategoriesRecord>
                                                            dropDownCategoriesRecordList =
                                                            snapshot.data!;
                                                        final dropDownCategoriesRecord =
                                                            dropDownCategoriesRecordList
                                                                    .isNotEmpty
                                                                ? dropDownCategoriesRecordList
                                                                    .first
                                                                : null;
                                                        return FlutterFlowDropDown(
                                                          initialOption:
                                                              dropDownValue ??=
                                                                  columnTestsRecord
                                                                      .category,
                                                          options:
                                                              dropDownCategoriesRecord!
                                                                  .categories!
                                                                  .toList()
                                                                  .toList(),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  dropDownValue =
                                                                      val),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          height: 40,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                          fillColor:
                                                              Colors.white,
                                                          elevation: 2,
                                                          borderColor:
                                                              Color(0xFF586B06),
                                                          borderWidth: 2,
                                                          borderRadius: 10,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 8, 4),
                                                          hidesUnderline: true,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 20),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 10, 10, 10),
                                                child: TextFormField(
                                                  controller:
                                                      testDescriptionController ??=
                                                          TextEditingController(
                                                    text: columnTestsRecord
                                                        .description,
                                                  ),
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'testDescriptionController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Test Description',
                                                    hintText:
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius lorem non eros sodales porta. Maecenas quis nulla lacinia, sollicitudin augue eget, iaculis tortor. \n\n',
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
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 5),
                                                    suffixIcon:
                                                        testDescriptionController!
                                                                .text.isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  testDescriptionController
                                                                      ?.clear();
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF889238),
                                                                  size: 15,
                                                                ),
                                                              )
                                                            : null,
                                                  ),
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 99,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.85,
                                                  height: 100,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 380,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFF77A54A),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor
                                                      ],
                                                      stops: [0, 1],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.64, -1),
                                                      end: AlignmentDirectional(
                                                          -0.64, 1),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: SwitchListTile(
                                                      value:
                                                          atHomeToggleValue ??=
                                                              columnTestsRecord
                                                                  .homeTest!,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() =>
                                                            atHomeToggleValue =
                                                                newValue!);
                                                      },
                                                      title: Text(
                                                        'Test @ Home ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                      ),
                                                      subtitle: Text(
                                                        'Can the test be done at home?',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      activeTrackColor:
                                                          Colors.white,
                                                      dense: false,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 2, 0),
                                                          child: Container(
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Icon(
                                                              Icons.timer,
                                                              color:
                                                                  Colors.white,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Test Duration:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF586B06),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      'in minutes',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 12,
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
                                                                  10, 0, 0, 0),
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
                                                          color:
                                                              Color(0xC1EEEEEE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF586B06),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          columnTestsRecord
                                                              .duration!
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                  maxChars: 3),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                      height: 100,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: 150,
                                                        child: Slider.adaptive(
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryColor,
                                                          inactiveColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryColor,
                                                          min: 15,
                                                          max: 180,
                                                          value: testDurationSliderValue ??=
                                                              columnTestsRecord
                                                                  .duration!,
                                                          label:
                                                              testDurationSliderValue
                                                                  .toString(),
                                                          divisions: 33,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() =>
                                                                testDurationSliderValue =
                                                                    newValue);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 15, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Results Duration:',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Color(
                                                                0xFF586B06),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Text(
                                                      'in hours',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 12,
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
                                                                  5, 0, 0, 0),
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
                                                          color:
                                                              Color(0xC1EEEEEE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF586B06),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(6,
                                                                      0, 0, 0),
                                                          child: TextFormField(
                                                            controller:
                                                                resultsDurationTextController,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'resultsDurationTextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                              () => setState(
                                                                  () {}),
                                                            ),
                                                            obscureText: false,
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
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          15),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF586B06),
                                                                  fontSize: 18,
                                                                ),
                                                            maxLines: null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: 135,
                                                        child: Slider.adaptive(
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryColor,
                                                          inactiveColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryColor,
                                                          min: 1,
                                                          max: 120,
                                                          value: durationResultsSliderValue ??=
                                                              columnTestsRecord
                                                                  .durationResults!,
                                                          label:
                                                              durationResultsSliderValue
                                                                  .toString(),
                                                          divisions: 119,
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() =>
                                                                durationResultsSliderValue =
                                                                    newValue);
                                                          },
                                                        ),
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
                                              maxWidth: 300,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 15, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 2, 0),
                                                          child: Container(
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Icon(
                                                              Icons
                                                                  .payments_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 20,
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
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF586B06),
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
                                                        width: 100,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x97EEEEEE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: TextFormField(
                                                            controller:
                                                                testPriceController ??=
                                                                    TextEditingController(
                                                              text: columnTestsRecord
                                                                  .price
                                                                  ?.toString(),
                                                            ),
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Kshs...',
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusedErrorBorder:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Roboto',
                                                              color: Color(
                                                                  0xFF586B06),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: (val) {
                                                              if (val == null ||
                                                                  val.isEmpty) {
                                                                return 'incorrect price entered';
                                                              }

                                                              if (val.length <
                                                                  2) {
                                                                return 'incorrect price entered';
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                ),
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
                        Align(
                          alignment: AlignmentDirectional(0, 0.05),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final testsUpdateData = createTestsRecordData(
                                price:
                                    int.parse(testPriceController?.text ?? ''),
                                name: textController1?.text ?? '',
                                homeTest: atHomeToggleValue,
                                description:
                                    testDescriptionController?.text ?? '',
                                duration: testDurationSliderValue,
                                durationResults: durationResultsSliderValue,
                                category: dropDownValue,
                                updateDate: getCurrentTimestamp,
                                updateRole: valueOrDefault(
                                    currentUserDocument?.role, ''),
                              );
                              await widget.testRef!.update(testsUpdateData);

                              context.pushNamed(
                                'Details',
                                queryParams: {
                                  'testId': serializeParam(
                                    widget.testRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Test changes submitted!',
                                    style: TextStyle(),
                                  ),
                                  duration: Duration(milliseconds: 2500),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            },
                            text: 'Submit',
                            options: FFButtonOptions(
                              width: 240,
                              height: 60,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
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
