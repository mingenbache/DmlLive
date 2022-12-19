import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/top_actions_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModifyTestWidget extends StatefulWidget {
  const ModifyTestWidget({
    Key? key,
    this.testId,
  }) : super(key: key);

  final DocumentReference? testId;

  @override
  _ModifyTestWidgetState createState() => _ModifyTestWidgetState();
}

class _ModifyTestWidgetState extends State<ModifyTestWidget> {
  String? dropDownValue;
  TextEditingController? testDescriptionController;
  TextEditingController? testNameController;
  bool? switchListTileValue;
  bool? atHomeToggleValue;
  TextEditingController? testDurationTextController;
  double? testDurationSliderValue;
  TextEditingController? resultsDurationTextController;
  double? durationResultsSliderValue;
  TextEditingController? testPriceController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    resultsDurationTextController?.dispose();
    testDescriptionController?.dispose();
    testNameController?.dispose();
    testDurationTextController?.dispose();
    testPriceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<TestsRecord>(
      stream: TestsRecord.getDocument(widget.testId!),
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
        final modifyTestTestsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: SafeArea(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TopActionsWidget(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'EDIT TEST DETAILS',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF586B06),
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SwitchListTile(
                                value: switchListTileValue ??=
                                    modifyTestTestsRecord.isAvailable!,
                                onChanged: (newValue) async {
                                  setState(
                                      () => switchListTileValue = newValue!);
                                },
                                title: Text(
                                  'Active',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                subtitle: Text(
                                  'Can the test be booked?',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                      ),
                                ),
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 6, 3, 0),
                                child: TextFormField(
                                  controller: testNameController ??=
                                      TextEditingController(
                                    text: modifyTestTestsRecord.name,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Test Name',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Enter test name here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF586B06),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF586B06),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF586B06),
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
                                    fillColor: Color(0x2BFFFFFF),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 0, 15),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: testDescriptionController ??=
                              TextEditingController(
                            text: modifyTestTestsRecord.description,
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            'testDescriptionController',
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
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF586B06),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF586B06),
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
                            fillColor: Color(0x65FFFFFF),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                            suffixIcon:
                                testDescriptionController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          testDescriptionController?.clear();
                                          setState(() {});
                                        },
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
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 99,
                          keyboardType: TextInputType.multiline,
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
                                List<CategoriesRecord>
                                    dropDownCategoriesRecordList =
                                    snapshot.data!;
                                final dropDownCategoriesRecord =
                                    dropDownCategoriesRecordList.isNotEmpty
                                        ? dropDownCategoriesRecordList.first
                                        : null;
                                return FlutterFlowDropDown<String>(
                                  initialOption: dropDownValue ??=
                                      modifyTestTestsRecord.category,
                                  options: dropDownCategoriesRecord!.categories!
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => dropDownValue = val),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 40,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                      ),
                                  fillColor: Colors.white,
                                  elevation: 2,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 10,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 8, 4),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: SwitchListTile(
                              value: atHomeToggleValue ??=
                                  modifyTestTestsRecord.homeTest!,
                              onChanged: (newValue) async {
                                setState(() => atHomeToggleValue = newValue!);
                              },
                              title: Text(
                                'Test @ Home ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                              ),
                              subtitle: Text(
                                'Can the test be done at home?',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              tileColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              activeColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              activeTrackColor: Color(0x68BACA68),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 35,
                      endIndent: 35,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
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
                                          .tertiaryColor,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Color(0x2FEEEEEE),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Color(0xFF586B06),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: TextFormField(
                                      controller: testDurationTextController ??=
                                          TextEditingController(
                                        text: modifyTestTestsRecord.duration
                                            ?.toString(),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '[Some hint text...]',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
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
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 15),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 18,
                                          ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Slider(
                                  activeColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  min: 5,
                                  max: 180,
                                  value: testDurationSliderValue ??= 5,
                                  label: testDurationSliderValue.toString(),
                                  divisions: 18,
                                  onChanged: (newValue) {
                                    setState(() =>
                                        testDurationSliderValue = newValue);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
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
                                          .tertiaryColor,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Color(0x2FEEEEEE),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Color(0xFF586B06),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 0, 0, 0),
                                    child: TextFormField(
                                      controller:
                                          resultsDurationTextController ??=
                                              TextEditingController(
                                        text: modifyTestTestsRecord
                                            .durationResults
                                            ?.toString(),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '[Some hint text...]',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
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
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 15),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 18,
                                          ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Slider(
                                  activeColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  min: 1,
                                  max: 120,
                                  value: durationResultsSliderValue ??=
                                      testDurationSliderValue!,
                                  label: durationResultsSliderValue.toString(),
                                  divisions: 119,
                                  onChanged: (newValue) {
                                    setState(() =>
                                        durationResultsSliderValue = newValue);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 35,
                      endIndent: 35,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 100,
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                color: Color(0x5DEEEEEE),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0xFF586B06),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: TextFormField(
                                  controller: testPriceController ??=
                                      TextEditingController(
                                    text:
                                        modifyTestTestsRecord.price?.toString(),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Kshs...',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.end,
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
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
                    Align(
                      alignment: AlignmentDirectional(0, 0.05),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final testsUpdateData = createTestsRecordData(
                              price:
                                  int.tryParse(testPriceController?.text ?? ''),
                              name: testNameController?.text ?? '',
                              homeTest: atHomeToggleValue,
                              description:
                                  testDescriptionController?.text ?? '',
                              duration: double.tryParse(
                                  testDurationTextController?.text ?? ''),
                              durationResults: double.tryParse(
                                  resultsDurationTextController?.text ?? ''),
                            );
                            await modifyTestTestsRecord.reference
                                .update(testsUpdateData);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Test Updated',
                                  style: TextStyle(),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x00000000),
                              ),
                            );

                            context.pushNamed(
                              'Details',
                              queryParams: {
                                'testId': serializeParam(
                                  modifyTestTestsRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            setState(() {});
                          },
                          text: 'Update Test',
                          options: FFButtonOptions(
                            width: 240,
                            height: 60,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
