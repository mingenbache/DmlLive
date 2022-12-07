import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TestListLightWidget extends StatefulWidget {
  const TestListLightWidget({Key? key}) : super(key: key);

  @override
  _TestListLightWidgetState createState() => _TestListLightWidgetState();
}

class _TestListLightWidgetState extends State<TestListLightWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TestsRecord>>(
      stream: queryTestsRecord(),
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
        List<TestsRecord> testListWidgetTestsRecordList = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(49),
              topRight: Radius.circular(49),
            ),
          ),
          child: Builder(
            builder: (context) {
              final testsListFullPage = testListWidgetTestsRecordList.toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: testsListFullPage.length,
                itemBuilder: (context, testsListFullPageIndex) {
                  final testsListFullPageItem =
                      testsListFullPage[testsListFullPageIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('Details');
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        alignment:
                            AlignmentDirectional(-0.4, 0.44999999999999996),
                        child: Align(
                          alignment: AlignmentDirectional(-0.35, -0.5),
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
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
            },
          ),
        );
      },
    );
  }
}
