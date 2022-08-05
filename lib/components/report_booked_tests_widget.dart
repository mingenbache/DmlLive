import '../backend/backend.dart';
import '../components/view_test_result_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportBookedTestsWidget extends StatefulWidget {
  const ReportBookedTestsWidget({
    Key key,
    this.booking,
  }) : super(key: key);

  final BookingsRecord booking;

  @override
  _ReportBookedTestsWidgetState createState() =>
      _ReportBookedTestsWidgetState();
}

class _ReportBookedTestsWidgetState extends State<ReportBookedTestsWidget> {
  Map<DocumentReference, bool> checkboxListTileValueMap = {};
  List<DocumentReference> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      child: Builder(
        builder: (context) {
          final bookedTests = widget.booking.bookedTests.toList();
          return ListView.builder(
            padding: EdgeInsets.zero,
            primary: false,
            scrollDirection: Axis.vertical,
            itemCount: bookedTests.length,
            itemBuilder: (context, bookedTestsIndex) {
              final bookedTestsItem = bookedTests[bookedTestsIndex];
              return StreamBuilder<List<TestedTestsRecord>>(
                stream: queryTestedTestsRecord(
                  queryBuilder: (testedTestsRecord) => testedTestsRecord
                      .where('test_ref', isEqualTo: bookedTestsItem)
                      .where('booking_ref',
                          isEqualTo: widget.booking.reference),
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
                  List<TestedTestsRecord>
                      bookedTestContainerTestedTestsRecordList = snapshot.data;
                  final bookedTestContainerTestedTestsRecord =
                      bookedTestContainerTestedTestsRecordList.isNotEmpty
                          ? bookedTestContainerTestedTestsRecordList.first
                          : null;
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: BoxConstraints(
                      maxWidth: 300,
                    ),
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(16),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: 30,
                                constraints: BoxConstraints(
                                  maxWidth: 300,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFDFDFD),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0, -0.05),
                                        child: Theme(
                                          data: ThemeData(
                                            unselectedWidgetColor:
                                                Color(0xFF95A1AC),
                                          ),
                                          child: CheckboxListTile(
                                            value: checkboxListTileValueMap[
                                                bookedTestsItem] ??= true,
                                            onChanged: (newValue) => setState(
                                                () => checkboxListTileValueMap[
                                                        bookedTestsItem] =
                                                    newValue),
                                            title: Text(
                                              'Title',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                            subtitle: Text(
                                              'Subtitle',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                            tileColor: Color(0xFFF5F5F5),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (!functions.isTestnotVerifiedorFlagged(
                            bookedTestContainerTestedTestsRecord))
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(16),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 30,
                                constraints: BoxConstraints(
                                  maxWidth: 300,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFD1515),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (bookedTestContainerTestedTestsRecord.isVerified ??
                            true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                            child: InkWell(
                              onTap: () async {
                                if (bookedTestContainerTestedTestsRecord
                                    .resultPosted) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: ViewTestResultWidget(
                                          testedTestRef:
                                              bookedTestContainerTestedTestsRecord
                                                  .reference,
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return;
                                }
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFDFDFD),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(16),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        StreamBuilder<TestsRecord>(
                                          stream: TestsRecord.getDocument(
                                              bookedTestsItem),
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
                                            final textTestsRecord =
                                                snapshot.data;
                                            return Text(
                                              functions.upperCase(
                                                  textTestsRecord.name),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            );
                                          },
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 1,
                                                      color: Color(0x31000000),
                                                      spreadRadius: 1,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 5, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  color: Color(
                                                                      0x32FFFFFF),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  color: Color(
                                                                      0xFFF3F3F3),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .handHoldingMedical,
                                                                  color: Color(
                                                                      0x34FFFFFF),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            if (bookedTestContainerTestedTestsRecord !=
                                                                null)
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          2,
                                                                          2,
                                                                          2),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .handHoldingMedical,
                                                                    color: Color(
                                                                        0xFFF3F3F3),
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .flask,
                                                                  color: Color(
                                                                      0x33FFFFFF),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            if (functions
                                                                .testedTestSubmitted(
                                                                    bookedTestContainerTestedTestsRecord))
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          2,
                                                                          2,
                                                                          2),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .flask,
                                                                    color: Color(
                                                                        0xFFF3F3F3),
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child: Icon(
                                                                  Icons
                                                                      .check_circle_outlined,
                                                                  color: Color(
                                                                      0x34FFFFFF),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            if (functions
                                                                .testedTestVerified(
                                                                    bookedTestContainerTestedTestsRecord))
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2,
                                                                          2,
                                                                          2,
                                                                          2),
                                                                  child: Icon(
                                                                    Icons
                                                                        .check_circle_outlined,
                                                                    color: Color(
                                                                        0xFFF3F3F3),
                                                                    size: 20,
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
