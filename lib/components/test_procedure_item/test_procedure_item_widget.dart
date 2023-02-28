import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_procedure_item_model.dart';
export 'test_procedure_item_model.dart';

class TestProcedureItemWidget extends StatefulWidget {
  const TestProcedureItemWidget({
    Key? key,
    this.index,
    this.procedureString,
    this.testRef,
  }) : super(key: key);

  final int? index;
  final String? procedureString;
  final TestsRecord? testRef;

  @override
  _TestProcedureItemWidgetState createState() =>
      _TestProcedureItemWidgetState();
}

class _TestProcedureItemWidgetState extends State<TestProcedureItemWidget> {
  late TestProcedureItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestProcedureItemModel());

    _model.textController ??=
        TextEditingController(text: widget.procedureString);
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
      child: Container(
        height: 35.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: TextFormField(
                controller: _model.textController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 400),
                  () => setState(() {}),
                ),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter step details',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
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
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(2.0, 3.0, 2.0, 0.0),
                  suffixIcon: _model.textController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.textController?.clear();
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
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                    ),
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            InkWell(
              onTap: () async {
                final testsUpdateData = {
                  'procedure': FieldValue.arrayRemove([widget.procedureString]),
                };
                await widget.testRef!.reference.update(testsUpdateData);
              },
              child: Icon(
                Icons.delete_forever,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
