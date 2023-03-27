import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/new_booking_sheet/new_booking_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_actions_model.dart';
export 'top_actions_model.dart';

class TopActionsWidget extends StatefulWidget {
  const TopActionsWidget({Key? key}) : super(key: key);

  @override
  _TopActionsWidgetState createState() => _TopActionsWidgetState();
}

class _TopActionsWidgetState extends State<TopActionsWidget> {
  late TopActionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopActionsModel());

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final containerUsersRecord = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: StreamBuilder<List<BookingsRecord>>(
                stream: queryBookingsRecord(
                  queryBuilder: (bookingsRecord) => bookingsRecord
                      .where('user', isEqualTo: containerUsersRecord.reference)
                      .where('is_submitted', isNotEqualTo: true),
                  singleRecord: true,
                ),
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
                  List<BookingsRecord> rowActionsBookingsRecordList =
                      snapshot.data!;
                  final rowActionsBookingsRecord =
                      rowActionsBookingsRecordList.isNotEmpty
                          ? rowActionsBookingsRecordList.first
                          : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            Navigator.pop(context);

                            context.goNamed('checkup');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Text(
                                    'BACK',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        constraints: BoxConstraints(
                          maxHeight: 40.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 5.0, 15.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    if (!containerUsersRecord
                                        .hasCurrentBooking!) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: NewBookingSheetWidget(),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    } else {
                                      context.pushNamed(
                                        'NewBooking',
                                        queryParams: {
                                          'bookingRef': serializeParam(
                                            rowActionsBookingsRecord!.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    FFAppState().update(() {
                                      FFAppState().lastBookingPage = false;
                                    });
                                    if (containerUsersRecord
                                        .hasCurrentBooking!) {
                                      context.pushNamed(
                                        'NewBooking',
                                        queryParams: {
                                          'bookingRef': serializeParam(
                                            currentUserDocument!.currentBooking,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.shoppingBasket,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 1.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed('myAccount');
                                  },
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 26.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
