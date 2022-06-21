import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/packageadd_test_item_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageTestListWidget extends StatefulWidget {
  const PackageTestListWidget({Key key}) : super(key: key);

  @override
  _PackageTestListWidgetState createState() => _PackageTestListWidgetState();
}

class _PackageTestListWidgetState extends State<PackageTestListWidget>
    with TickerProviderStateMixin {
  TextEditingController textController;
  final animationsMap = {
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
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
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Image.asset(
                  'assets/images/cdc-XLhDvfz0sUM-unsplash-reducedBW.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x552F2F2F),
                      FlutterFlowTheme.of(context).tertiaryColor
                    ],
                    stops: [0, 0.4],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        constraints: BoxConstraints(
                          maxWidth: 330,
                        ),
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ADD TESTS',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                            ),
                            InkWell(
                              onTap: () async {
                                context.pop();
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
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
                                    setState(() =>
                                        FFAppState().categorypicked = 'All');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        constraints: BoxConstraints(
                          maxWidth: 320,
                        ),
                        decoration: BoxDecoration(),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0x91FFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 0),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Search tests here...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF586B06),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x004B39EF),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x004B39EF),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        suffixIcon: textController
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () => setState(
                                                  () => textController?.clear(),
                                                ),
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF586B06),
                                                  size: 18,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  if (!(functions.isCategorySelected(
                                          FFAppState().categorypicked)) ??
                                      true)
                                    InkWell(
                                      onTap: () async {
                                        setState(() => FFAppState()
                                            .categorypicked = 'All');
                                        setState(() =>
                                            FFAppState().allCategories = true);
                                      },
                                      child: Container(
                                        width: 40,
                                        constraints: BoxConstraints(
                                          maxWidth: 80,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0x35EEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 5, 10, 5),
                                          child: Text(
                                            'All',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().allCategories ?? true)
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        width: 40,
                                        constraints: BoxConstraints(
                                          maxWidth: 80,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 5, 10, 5),
                                          child: Text(
                                            'All',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.83,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                constraints: BoxConstraints(
                                  maxHeight: 60,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: StreamBuilder<List<CategoriesRecord>>(
                                    stream: queryCategoriesRecord(
                                      queryBuilder: (categoriesRecord) =>
                                          categoriesRecord.where(
                                              'istest_Category',
                                              isEqualTo: true),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<CategoriesRecord>
                                          listViewCategoriesRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final listViewCategoriesRecord =
                                          listViewCategoriesRecordList
                                                  .isNotEmpty
                                              ? listViewCategoriesRecordList
                                                  .first
                                              : null;
                                      return Builder(
                                        builder: (context) {
                                          final packageCategories =
                                              listViewCategoriesRecord
                                                      .categories
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: packageCategories.length,
                                            itemBuilder: (context,
                                                packageCategoriesIndex) {
                                              final packageCategoriesItem =
                                                  packageCategories[
                                                      packageCategoriesIndex];
                                              return Stack(
                                                children: [
                                                  if (functions.isThisCategorySelected(
                                                          FFAppState()
                                                              .categorypicked,
                                                          packageCategoriesItem
                                                              .name,
                                                          FFAppState()
                                                              .allCategories) ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      5, 10, 3),
                                                          child: Text(
                                                            packageCategoriesItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  fontSize: 16,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() => FFAppState()
                                                                .categorypicked =
                                                            packageCategoriesItem
                                                                .name);
                                                        setState(() => FFAppState()
                                                                .allCategories =
                                                            false);
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x4EEEEEEE),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        5,
                                                                        10,
                                                                        3),
                                                            child: Text(
                                                              packageCategoriesItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
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
                      StreamBuilder<List<TestsRecord>>(
                        stream: queryTestsRecord(
                          queryBuilder: (testsRecord) => testsRecord
                              .where('is_available', isEqualTo: true),
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<TestsRecord> testListWidgetTestsRecordList =
                              snapshot.data;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.55,
                            decoration: BoxDecoration(
                              color: Color(0x30FFFFFF),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(49),
                                topRight: Radius.circular(49),
                              ),
                            ),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StreamBuilder<UsersRecord>(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewUsersRecord = snapshot.data;
                                      return Builder(
                                        builder: (context) {
                                          final testsListFullPage = functions
                                                  .filterTestsByCategory(
                                                      FFAppState()
                                                          .allCategories,
                                                      FFAppState()
                                                          .categorypicked,
                                                      functions
                                                          .returnSearchTests(
                                                              textController
                                                                  .text,
                                                              testListWidgetTestsRecordList
                                                                  .toList())
                                                          .toList())
                                                  ?.toList() ??
                                              [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: testsListFullPage.length,
                                            itemBuilder: (context,
                                                testsListFullPageIndex) {
                                              final testsListFullPageItem =
                                                  testsListFullPage[
                                                      testsListFullPageIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 15, 10),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 350,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child:
                                                        PackageaddTestItemWidget(
                                                      index:
                                                          testsListFullPageIndex,
                                                      listSize:
                                                          testListWidgetTestsRecordList
                                                              .length,
                                                      test:
                                                          testsListFullPageItem,
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
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'NEXT',
                      options: FFButtonOptions(
                        width: 240,
                        height: 70,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 25,
                      ),
                    ).animated(
                        [animationsMap['buttonOnActionTriggerAnimation']]),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Tap above to complete request',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}
