import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/details_tabbed_body/details_tabbed_body_widget.dart';
import '/components/top_actions/top_actions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_tests_model.dart';
export 'all_tests_model.dart';

class AllTestsWidget extends StatefulWidget {
  const AllTestsWidget({Key? key}) : super(key: key);

  @override
  _AllTestsWidgetState createState() => _AllTestsWidgetState();
}

class _AllTestsWidgetState extends State<AllTestsWidget> {
  late AllTestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllTestsModel());

    _model.textController ??= TextEditingController();
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
        final allTestsUsersRecord = snapshot.data!;
        return Title(
            title: 'AllTests',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              floatingActionButton: Visibility(
                visible: allTestsUsersRecord.role == 'admin',
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    context.pushNamed('NewTest');
                  },
                  backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                  icon: FaIcon(
                    FontAwesomeIcons.flask,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    size: 20.0,
                  ),
                  elevation: 8.0,
                  label: Text(
                    'ADD NEW TEST',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: StreamBuilder<BookingsRecord>(
                    stream: BookingsRecord.getDocument(
                        allTestsUsersRecord.currentBooking!),
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
                      final columnBookingsRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.topActionsModel,
                            updateCallback: () => setState(() {}),
                            child: TopActionsWidget(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(),
                              child: Text(
                                'TEST CATALOG',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF586B06),
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0x91FFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 100),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Search tests here...',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x004B39EF),
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
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF586B06),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          textAlign: TextAlign.start,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 4.0, 0.0),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() => _model
                                              .algoliaSearchResults = null);
                                          await TestsRecord.search(
                                            term: _model.textController.text,
                                          )
                                              .then((r) => _model
                                                  .algoliaSearchResults = r)
                                              .onError((_, __) => _model
                                                  .algoliaSearchResults = [])
                                              .whenComplete(
                                                  () => setState(() {}));
                                        },
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Color(0xFF586B06),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      constraints: BoxConstraints(
                                        maxWidth: 80.0,
                                        maxHeight: 60.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 5.0, 8.0, 5.0),
                                        child: Text(
                                          'All',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    constraints: BoxConstraints(
                                      maxHeight: 60.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child:
                                          StreamBuilder<List<CategoriesRecord>>(
                                        stream: queryCategoriesRecord(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<CategoriesRecord>
                                              listViewCategoriesRecordList =
                                              snapshot.data!;
                                          final listViewCategoriesRecord =
                                              listViewCategoriesRecordList
                                                      .isNotEmpty
                                                  ? listViewCategoriesRecordList
                                                      .first
                                                  : null;
                                          return Builder(
                                            builder: (context) {
                                              final categories =
                                                  listViewCategoriesRecord!
                                                      .categories!
                                                      .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: categories.length,
                                                itemBuilder:
                                                    (context, categoriesIndex) {
                                                  final categoriesItem =
                                                      categories[
                                                          categoriesIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x35EEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    10.0,
                                                                    5.0),
                                                        child: Text(
                                                          categoriesItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontSize: 16.0,
                                                              ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          StreamBuilder<List<TestsRecord>>(
                            stream: queryTestsRecord(
                              queryBuilder: (testsRecord) => testsRecord
                                  .where('is_available', isEqualTo: true)
                                  .where('Keywords',
                                      arrayContains:
                                          _model.textController.text),
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
                              List<TestsRecord> testListWidgetTestsRecordList =
                                  snapshot.data!;
                              return Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(49.0),
                                    topRight: Radius.circular(49.0),
                                  ),
                                ),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      currentUserReference!),
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
                                    final listViewUsersRecord = snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final testsListFullPage =
                                            testListWidgetTestsRecordList
                                                .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: testsListFullPage.length,
                                          itemBuilder: (context,
                                              testsListFullPageIndex) {
                                            final testsListFullPageItem =
                                                testsListFullPage[
                                                    testsListFullPageIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 5.0, 5.0, 15.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 120.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    -0.4, 0.44999999999999996),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.35, -0.5),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1.0,
                                                            height: 120.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.95,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                DetailsTabbedBodyWidget(
                                                                              test: testsListFullPageItem,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.9,
                                                                      height:
                                                                          120.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFECECEC),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                20.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            spreadRadius:
                                                                                1.0,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 310.0,
                                                                                  height: 30.0,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 310.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      testsListFullPageItem.name!,
                                                                                      style: FlutterFlowTheme.of(context).subtitle1,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Container(
                                                                                width: 318.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 140.0,
                                                                                        height: MediaQuery.of(context).size.height * 0.03,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 5.0, 0.0),
                                                                                          child: Text(
                                                                                            testsListFullPageItem.category!,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Roboto',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.timer,
                                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            Text(
                                                                                              'Results in ${testsListFullPageItem.durationResults?.toString()} Hrs',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Roboto',
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
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
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFC8C8C8),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.15,
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    if (testsListFullPageItem.homeTest ?? true)
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                        child: Icon(
                                                                                                          Icons.check_circle,
                                                                                                          color: Color(0xFF586B06),
                                                                                                          size: 16.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    Text(
                                                                                                      'Home',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                    if (!testsListFullPageItem.homeTest!)
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                        child: Icon(
                                                                                                          Icons.not_interested,
                                                                                                          color: Color(0xFFD61B1B),
                                                                                                          size: 16.0,
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 1.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.25,
                                                                                                height: MediaQuery.of(context).size.height * 0.035,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                      child: Text(
                                                                                                        formatNumber(
                                                                                                          testsListFullPageItem.price!,
                                                                                                          formatType: FormatType.decimal,
                                                                                                          decimalType: DecimalType.periodDecimal,
                                                                                                          currency: 'Ksh ',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              color: Color(0xFF586B06),
                                                                                                              fontWeight: FontWeight.w500,
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if (columnBookingsRecord
                                                                        .testsIncluded!
                                                                        .toList()
                                                                        .contains(
                                                                            testsListFullPageItem.reference))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.13,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                listViewUsersRecord.role == 'client',
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                if (!columnBookingsRecord.testsIncluded!.toList().contains(testsListFullPageItem.reference)) {
                                                                                  final bookingsUpdateData = {
                                                                                    ...createBookingsRecordData(
                                                                                      totalPrice: functions.removeFromCart(columnBookingsRecord.totalPrice, testsListFullPageItem.price),
                                                                                    ),
                                                                                    'tests_included': FieldValue.arrayRemove([
                                                                                      testsListFullPageItem.reference
                                                                                    ]),
                                                                                    'total_tests': FieldValue.delete(),
                                                                                  };
                                                                                  await columnBookingsRecord.reference.update(bookingsUpdateData);
                                                                                }
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Test Removed.${columnBookingsRecord.totalTests?.toString()} Tests in Total.',
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: Color(0x00000000),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.remove_circle_sharp,
                                                                                color: Color(0xFFFF0000),
                                                                                size: 44.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (!columnBookingsRecord
                                                                        .testsIncluded!
                                                                        .toList()
                                                                        .contains(
                                                                            testsListFullPageItem.reference))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.13,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                listViewUsersRecord.role == 'client',
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                if (!columnBookingsRecord.testsIncluded!.toList().contains(testsListFullPageItem.reference)) {
                                                                                  final bookingsUpdateData = {
                                                                                    ...createBookingsRecordData(
                                                                                      totalPrice: functions.addCartTotal(columnBookingsRecord.totalPrice, testsListFullPageItem.price),
                                                                                    ),
                                                                                    'tests_included': FieldValue.arrayUnion([
                                                                                      testsListFullPageItem.reference
                                                                                    ]),
                                                                                    'total_tests': FieldValue.increment(1),
                                                                                  };
                                                                                  await columnBookingsRecord.reference.update(bookingsUpdateData);
                                                                                }
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Test Added.${columnBookingsRecord.totalTests?.toString()} Tests in Total.',
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: Color(0x00000000),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.add_circle_sharp,
                                                                                color: Color(0xFF586B06),
                                                                                size: 44.0,
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
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
