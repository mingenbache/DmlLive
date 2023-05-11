import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'special_test_list_item_model.dart';
export 'special_test_list_item_model.dart';

class SpecialTestListItemWidget extends StatefulWidget {
  const SpecialTestListItemWidget({
    Key? key,
    this.index,
    this.bookingRef,
    this.specialTestDataType,
  }) : super(key: key);

  final int? index;
  final DocumentReference? bookingRef;
  final SpecialTestTypeStruct? specialTestDataType;

  @override
  _SpecialTestListItemWidgetState createState() =>
      _SpecialTestListItemWidgetState();
}

class _SpecialTestListItemWidgetState extends State<SpecialTestListItemWidget> {
  late SpecialTestListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialTestListItemModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 40),
          curve: Curves.linear,
          height: 30.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    widget.specialTestDataType!.name!,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final bookingsUpdateData = {
                      'specialTests': FieldValue.arrayRemove([
                        getSpecialTestTypeFirestoreData(
                          createSpecialTestTypeStruct(delete: true),
                          true,
                        )
                      ]),
                    };
                    await widget.bookingRef!.update(bookingsUpdateData);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Test Removed',
                          style: TextStyle(),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0x00000000),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.highlight_off,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
