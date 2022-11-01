import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.procedureString);
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
      child: Container(
        height: 35,
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
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: TextFormField(
                controller: textController,
                onChanged: (_) => EasyDebounce.debounce(
                  'textController',
                  Duration(milliseconds: 400),
                  () => setState(() {}),
                ),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter step details',
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
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(2, 3, 2, 0),
                  suffixIcon: textController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            textController?.clear();
                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16,
                    ),
                maxLines: null,
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
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
