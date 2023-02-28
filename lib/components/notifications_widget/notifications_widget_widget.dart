import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_actions_widget/admin_actions_widget_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/notification_list_item/notification_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_widget_model.dart';
export 'notifications_widget_model.dart';

class NotificationsWidgetWidget extends StatefulWidget {
  const NotificationsWidgetWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetWidgetState createState() =>
      _NotificationsWidgetWidgetState();
}

class _NotificationsWidgetWidgetState extends State<NotificationsWidgetWidget> {
  late NotificationsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        constraints: BoxConstraints(
          maxWidth: 380.0,
        ),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 130.0,
              constraints: BoxConstraints(
                maxWidth: 380.0,
              ),
              decoration: BoxDecoration(),
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.of(context).secondaryColor,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      labelStyle: FlutterFlowTheme.of(context).bodyText1,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: 'Notifications',
                        ),
                        Tab(
                          text: 'Messages',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          StreamBuilder<List<NotificationsRecord>>(
                            stream: queryNotificationsRecord(
                              queryBuilder: (notificationsRecord) =>
                                  notificationsRecord
                                      .where('users_receiving',
                                          arrayContains: currentUserReference)
                                      .orderBy('created_date',
                                          descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<NotificationsRecord>
                                  containerNotificationsRecordList =
                                  snapshot.data!;
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 100.0,
                                constraints: BoxConstraints(
                                  maxWidth: 380.0,
                                  maxHeight: 130.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final filterAdminNotifications =
                                                functions
                                                    .filterNotifications(
                                                        containerNotificationsRecordList
                                                            .toList(),
                                                        currentUserReference)
                                                    .toList();
                                            if (filterAdminNotifications
                                                .isEmpty) {
                                              return Center(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: EmptyListWidget(),
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  filterAdminNotifications
                                                      .length,
                                              itemBuilder: (context,
                                                  filterAdminNotificationsIndex) {
                                                final filterAdminNotificationsItem =
                                                    filterAdminNotifications[
                                                        filterAdminNotificationsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child:
                                                      NotificationListItemWidget(
                                                    key: Key(
                                                        'Keyrz0_${filterAdminNotificationsIndex}_of_${filterAdminNotifications.length}'),
                                                    notificationRef:
                                                        filterAdminNotificationsItem,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 100.0,
                            constraints: BoxConstraints(
                              maxWidth: 360.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<ChatsRecord>>(
                                stream: queryChatsRecord(
                                  queryBuilder: (chatsRecord) => chatsRecord
                                      .where('users',
                                          arrayContains: currentUserReference)
                                      .orderBy('last_message_time',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ChatsRecord> columnChatsRecordList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnChatsRecordList.length,
                                          (columnIndex) {
                                        final columnChatsRecord =
                                            columnChatsRecordList[columnIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Chat',
                                                      queryParams: {
                                                        'chatRef':
                                                            serializeParam(
                                                          columnChatsRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 380.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: StreamBuilder<UsersRecord>(
                                                                                    stream: UsersRecord.getDocument(columnChatsRecord.lastMessageSentBy!),
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
                                                                                      final textUsersRecord = snapshot.data!;
                                                                                      return Text(
                                                                                        '${textUsersRecord.firstName} ${textUsersRecord.lastName}',
                                                                                        textAlign: TextAlign.center,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                              fontFamily: 'Open Sans',
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.7, 0.0),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat('d/M H:mm', columnChatsRecord.lastMessageTime!),
                                                                              textAlign: TextAlign.end,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF57636C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 10.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.72,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 290.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 4.0, 0.0),
                                                                              child: Text(
                                                                                columnChatsRecord.lastMessage!,
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_right,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.adminActionsWidgetModel,
                      updateCallback: () => setState(() {}),
                      child: AdminActionsWidgetWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
