import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reportwizardspecial_test_model.dart';
export 'reportwizardspecial_test_model.dart';

class ReportwizardspecialTestWidget extends StatefulWidget {
  const ReportwizardspecialTestWidget({
    Key? key,
    this.specialTestRef,
    bool? isIncluded,
    this.specialTest,
  })  : this.isIncluded = isIncluded ?? false,
        super(key: key);

  final DocumentReference? specialTestRef;
  final bool isIncluded;
  final SpecialTestsRecord? specialTest;

  @override
  _ReportwizardspecialTestWidgetState createState() =>
      _ReportwizardspecialTestWidgetState();
}

class _ReportwizardspecialTestWidgetState
    extends State<ReportwizardspecialTestWidget> {
  late ReportwizardspecialTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportwizardspecialTestModel());

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

    return StreamBuilder<SpecialTestsRecord>(
      stream: SpecialTestsRecord.getDocument(widget.specialTestRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final specialTestContainerSpecialTestsRecord = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxWidth: 300.0,
          ),
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      height: 30.0,
                      constraints: BoxConstraints(
                        maxWidth: 300.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFDFDFD),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Switch(
                              value: _model.switchValue ??= widget.isIncluded,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue = newValue!);
                              },
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (!widget.specialTest!.isVerified)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 30.0,
                      constraints: BoxConstraints(
                        maxWidth: 300.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFD1515),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(16.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.specialTest!.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Color(0x31000000),
                                        spreadRadius: 1.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 4.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 2.0, 2.0, 2.0),
                                                  child: Icon(
                                                    Icons.check_circle_outlined,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.specialTest!
                                                                  .isVerified ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                    ),
                                                    size: 20.0,
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
            ],
          ),
        );
      },
    );
  }
}
