import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/new_booking_sheet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TopActionsWidget extends StatefulWidget {
  const TopActionsWidget({Key key}) : super(key: key);

  @override
  _TopActionsWidgetState createState() => _TopActionsWidgetState();
}

class _TopActionsWidgetState extends State<TopActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitRipple(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final containerUsersRecord = snapshot.data;
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
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
                      width: 50,
                      height: 50,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<BookingsRecord> rowActionsBookingsRecordList =
                    snapshot.data;
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
                      alignment: AlignmentDirectional(0, 0),
                      child: InkWell(
                        onTap: () async {
                          context.pop();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Text(
                                  'BACK',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 20,
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
                      decoration: BoxDecoration(
                        color: Color(0x00F5F5F5),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  if (!(containerUsersRecord
                                      .hasCurrentBooking)) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: NewBookingSheetWidget(),
                                        );
                                      },
                                    );
                                  }
                                  setState(() =>
                                      FFAppState().lastBookingPage = false);
                                  if (containerUsersRecord.hasCurrentBooking) {
                                    context.pushNamed(
                                      'NewBooking',
                                      queryParams: {
                                        'bookingRef': serializeParam(
                                            currentUserDocument?.currentBooking,
                                            ParamType.DocumentReference),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.shoppingBasket,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 1, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed('Account');
                                },
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                  size: 26,
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
        );
      },
    );
  }
}
