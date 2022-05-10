import '../components/test_list_catalog_widget.dart';
import '../components/user_list2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminActionsWidgetWidget extends StatefulWidget {
  const AdminActionsWidgetWidget({Key key}) : super(key: key);

  @override
  _AdminActionsWidgetWidgetState createState() =>
      _AdminActionsWidgetWidgetState();
}

class _AdminActionsWidgetWidgetState extends State<AdminActionsWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).tertiaryColor,
              FlutterFlowTheme.of(context).primaryColor
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      setState(() => FFAppState().userListQuery = '');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: UserList2Widget(),
                          );
                        },
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_sharp,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 40,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                              child: Text(
                                'Users',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('BookingsSchedule');
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Color(0xFF88993A),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 40,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                              child: Text(
                                'Bookings',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('PaymentsList');
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Color(0xA958595B),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0.30000000000000004),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              'Payments',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                  child: InkWell(
                    onTap: () async {
                      setState(() => FFAppState().allCategories = true);
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
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0, 0.30000000000000004),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.flask,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 40,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
