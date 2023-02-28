import '/backend/backend.dart';
import '/components/test_details_popup/test_details_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package_test_list_item_model.dart';
export 'package_test_list_item_model.dart';

class PackageTestListItemWidget extends StatefulWidget {
  const PackageTestListItemWidget({
    Key? key,
    this.testRef,
    this.isAdmin,
  }) : super(key: key);

  final DocumentReference? testRef;
  final bool? isAdmin;

  @override
  _PackageTestListItemWidgetState createState() =>
      _PackageTestListItemWidgetState();
}

class _PackageTestListItemWidgetState extends State<PackageTestListItemWidget> {
  late PackageTestListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackageTestListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
      child: StreamBuilder<TestsRecord>(
        stream: TestsRecord.getDocument(widget.testRef!),
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
          final containerTestsRecord = snapshot.data!;
          return InkWell(
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: TestDetailsPopupWidget(
                      test: containerTestsRecord,
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30.0,
              constraints: BoxConstraints(
                maxWidth: 300.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(16.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: Color(0x31000000),
                                spreadRadius: 1.0,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      functions.upperCase(containerTestsRecord.name),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
