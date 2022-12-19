import '../components/test_list_catalog_widget.dart';
import '../components/user_list2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminActionsWidgetWidget extends StatefulWidget {
  const AdminActionsWidgetWidget({Key? key}) : super(key: key);

  @override
  _AdminActionsWidgetWidgetState createState() =>
      _AdminActionsWidgetWidgetState();
}

class _AdminActionsWidgetWidgetState extends State<AdminActionsWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        child: Container(
          height: 100,
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
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
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                        setState(() {
                          FFAppState().userListQuery = '';
                        });
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
                        ).then((value) => setState(() {}));
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
                          alignment:
                              AlignmentDirectional(0, 0.30000000000000004),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                                            .primaryText,
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
                            color: FlutterFlowTheme.of(context).primaryText,
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          alignment:
                              AlignmentDirectional(0, 0.30000000000000004),
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
                            color: FlutterFlowTheme.of(context).secondaryText,
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          alignment:
                              AlignmentDirectional(0, 0.30000000000000004),
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
                        setState(() {
                          FFAppState().allCategories = true;
                          FFAppState().allPackageCategories = true;
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
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 40,
                            ),
                            Text(
                              'Catalog',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
      ),
    );
  }
}
