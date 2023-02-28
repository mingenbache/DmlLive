import '/components/test_list_catalog/test_list_catalog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_actions_widget_model.dart';
export 'client_actions_widget_model.dart';

class ClientActionsWidgetWidget extends StatefulWidget {
  const ClientActionsWidgetWidget({Key? key}) : super(key: key);

  @override
  _ClientActionsWidgetWidgetState createState() =>
      _ClientActionsWidgetWidgetState();
}

class _ClientActionsWidgetWidgetState extends State<ClientActionsWidgetWidget> {
  late ClientActionsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientActionsWidgetModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 100.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).tertiaryColor,
              FlutterFlowTheme.of(context).primaryColor
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                child: InkWell(
                  onTap: () async {
                    FFAppState().update(() {
                      FFAppState().userListQuery = '';
                    });

                    context.pushNamed('UserList');
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 40.0,
                          ),
                          Text(
                            'Users',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed('BookingsSchedule');
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xFF88993A),
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 0.0, 2.0, 0.0),
                            child: Text(
                              'Bookings',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed('PaymentsList');
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xA958595B),
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.payments_outlined,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          Text(
                            'Payments',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 3.0, 3.0),
                child: InkWell(
                  onTap: () async {
                    FFAppState().update(() {
                      FFAppState().allCategories = true;
                    });
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: TestListCatalogWidget(),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.30000000000000004),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.flask,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 40.0,
                        ),
                        Text(
                          'Catalog',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF586B06),
                                  ),
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
  }
}
