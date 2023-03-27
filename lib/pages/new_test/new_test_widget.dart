import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_test_model.dart';
export 'new_test_model.dart';

class NewTestWidget extends StatefulWidget {
  const NewTestWidget({Key? key}) : super(key: key);

  @override
  _NewTestWidgetState createState() => _NewTestWidgetState();
}

class _NewTestWidgetState extends State<NewTestWidget> {
  late NewTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewTestModel());

    _model.testNameController ??= TextEditingController();
    _model.testDescriptionController ??= TextEditingController();
    _model.testDurationTextController ??= TextEditingController(
        text: functions
            .doubletoInt(_model.testDurationSliderValue, 60.0)
            .toString());
    _model.resultsDurationTextController ??= TextEditingController(
        text: functions
            .doubletoInt(_model.durationResultsSliderValue, 2.0)
            .toString());
    _model.testPriceController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final newTestUsersRecord = snapshot.data!;
        return Title(
            title: 'NewTest',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              body: SafeArea(
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
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
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              'NEW TEST',
                              textAlign: TextAlign.start,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF586B06),
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 6.0, 3.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.testNameController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Test Name',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF586B06),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'Enter test name here...',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x66FFFFFF),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 8.0, 0.0, 15.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF586B06),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      validator: _model
                                          .testNameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.testDescriptionController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.testDescriptionController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Test Description',
                                  hintText:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius lorem non eros sodales porta. Maecenas quis nulla lacinia, sollicitudin augue eget, iaculis tortor. Donec vehicula felis eu erat congue molestie. Pellentesque finibus arcu sed felis maximus, nec sollicitudin nunc sollicitudin. Cras varius tellus id enim maximus auctor. Curabitur placerat libero eleifend ultrices pretium. Pellentesque vitae velit lorem. Duis porta nibh ut orci placerat, at convallis diam pellentesque. Maecenas bibendum ultricies dolor, a ultrices libero. Aenean tincidunt purus at ipsum consequat, non sodales neque condimentum. Duis aliquet tellus a maximus congue. Nam sollicitudin sit amet erat nec lacinia. Aliquam lobortis sem in ornare laoreet. Pellentesque in pretium purus. Fusce mi urna, facilisis nec elit vulputate, efficitur semper nisl. Vivamus a congue risus, a volutpat velit.\n\n',
                                  hintStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 0.0, 5.0),
                                  suffixIcon: _model.testDescriptionController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.testDescriptionController
                                                ?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF889238),
                                            size: 15.0,
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
                                validator: _model
                                    .testDescriptionControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Test Category',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Color(0xFF586B06),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<CategoriesRecord>>(
                                  stream: queryCategoriesRecord(
                                    queryBuilder: (categoriesRecord) =>
                                        categoriesRecord.orderBy('name'),
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
                                                .primaryColor,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<CategoriesRecord>
                                        dropDownCategoriesRecordList =
                                        snapshot.data!;
                                    final dropDownCategoriesRecord =
                                        dropDownCategoriesRecordList.isNotEmpty
                                            ? dropDownCategoriesRecordList.first
                                            : null;
                                    return FlutterFlowDropDown<String>(
                                      controller: _model.dropDownController ??=
                                          FormFieldController<String>(null),
                                      options: dropDownCategoriesRecord!
                                          .categories!
                                          .toList()
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                          ),
                                      fillColor: Color(0x5CFFFFFF),
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      borderWidth: 2.0,
                                      borderRadius: 10.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 4.0),
                                      isSearchable: false,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: SwitchListTile(
                                    value: _model.atHomeToggleValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.atHomeToggleValue = newValue!);
                                    },
                                    title: Text(
                                      'Test @ Home ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                    ),
                                    subtitle: Text(
                                      'Can the test be done at home?',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          indent: 35.0,
                          endIndent: 35.0,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Test Duration:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Color(0xFF586B06),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    'in minutes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      decoration: BoxDecoration(
                                        color: Color(0x2FEEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFF586B06),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.testDurationTextController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '[Some hint text...]',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 15.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFF586B06),
                                                fontSize: 18.0,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .testDurationTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Slider(
                                      activeColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      min: 60.0,
                                      max: 180.0,
                                      value: _model.testDurationSliderValue ??=
                                          60.0,
                                      divisions: 12,
                                      onChanged: (newValue) {
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Results Duration:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Color(0xFF586B06),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    'in hours',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      decoration: BoxDecoration(
                                        color: Color(0x2FEEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFF586B06),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .resultsDurationTextController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '[Some hint text...]',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 15.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFF586B06),
                                                fontSize: 18.0,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .resultsDurationTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Slider(
                                      activeColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      min: 1.0,
                                      max: 120.0,
                                      value:
                                          _model.durationResultsSliderValue ??=
                                              _model.testDurationSliderValue!,
                                      label: _model.durationResultsSliderValue
                                          .toString(),
                                      divisions: 119,
                                      onChanged: (newValue) {
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
                        Divider(
                          thickness: 1.0,
                          indent: 35.0,
                          endIndent: 35.0,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Test Price',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
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
                                  width: 100.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Color(0x5DEEEEEE),
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.testPriceController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Kshs...',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Color(0xFF586B06),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .testPriceControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.05),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final testsCreateData = createTestsRecordData(
                                  price: int.tryParse(
                                      _model.testPriceController.text),
                                  name: _model.testNameController.text,
                                  homeTest: _model.atHomeToggleValue,
                                  description:
                                      _model.testDescriptionController.text,
                                  duration: double.tryParse(
                                      _model.testDurationTextController.text),
                                  durationResults: double.tryParse(_model
                                      .resultsDurationTextController.text),
                                  category: _model.dropDownValue,
                                  isAvailable: true,
                                );
                                var testsRecordReference =
                                    TestsRecord.collection.doc();
                                await testsRecordReference.set(testsCreateData);
                                _model.newTestId =
                                    TestsRecord.getDocumentFromData(
                                        testsCreateData, testsRecordReference);

                                context.pushNamed(
                                  'Details',
                                  queryParams: {
                                    'testId': serializeParam(
                                      _model.newTestId!.reference,
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
                                width: 340.0,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
