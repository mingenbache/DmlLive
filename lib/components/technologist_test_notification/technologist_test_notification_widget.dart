import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'technologist_test_notification_model.dart';
export 'technologist_test_notification_model.dart';

class TechnologistTestNotificationWidget extends StatefulWidget {
  const TechnologistTestNotificationWidget({
    Key? key,
    this.bookedTestRef,
  }) : super(key: key);

  final DocumentReference? bookedTestRef;

  @override
  _TechnologistTestNotificationWidgetState createState() =>
      _TechnologistTestNotificationWidgetState();
}

class _TechnologistTestNotificationWidgetState
    extends State<TechnologistTestNotificationWidget> {
  late TechnologistTestNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TechnologistTestNotificationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: double.infinity,
        height: 170.0,
        decoration: BoxDecoration(
          color: Color(0xFF4B39EF),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/images/bgFeatured@2x.jpg',
            ).image,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Burger Plate for two',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: AutoSizeText(
                    'A delicious and filling combo with two burger plates for an amazing price.',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xB4FFFFFF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Add to Cart',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF4B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$20.00',
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          '+ taxes & fees',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xB3FFFFFF),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
