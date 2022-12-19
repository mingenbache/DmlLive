import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpecialTestListItemWidget extends StatefulWidget {
  const SpecialTestListItemWidget({
    Key? key,
    this.index,
    this.name,
    this.bookingRef,
  }) : super(key: key);

  final int? index;
  final String? name;
  final DocumentReference? bookingRef;

  @override
  _SpecialTestListItemWidgetState createState() =>
      _SpecialTestListItemWidgetState();
}

class _SpecialTestListItemWidgetState extends State<SpecialTestListItemWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 40),
          curve: Curves.linear,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 6, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    widget.name!,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final bookingsUpdateData = {
                      'specialTests': FieldValue.arrayRemove([widget.name]),
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
                    size: 18,
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
