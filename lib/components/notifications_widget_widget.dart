import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_actions_widget_widget.dart';
import '../components/notification_list_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsWidgetWidget extends StatefulWidget {
  const NotificationsWidgetWidget({Key key}) : super(key: key);

  @override
  _NotificationsWidgetWidgetState createState() =>
      _NotificationsWidgetWidgetState();
}

class _NotificationsWidgetWidgetState extends State<NotificationsWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<NotificationsRecord>>(
                stream: queryNotificationsRecord(
                  queryBuilder: (notificationsRecord) =>
                      notificationsRecord.where('users_receiving',
                          arrayContains: currentUserReference),
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
                  List<NotificationsRecord> containerNotificationsRecordList =
                      snapshot.data;
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
                    constraints: BoxConstraints(
                      maxWidth: 380,
                    ),
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final filterAdminNotifications = functions
                                      .filterNotifications(
                                          containerNotificationsRecordList
                                              .toList(),
                                          currentUserReference)
                                      ?.toList() ??
                                  [];
                              if (filterAdminNotifications.isEmpty) {
                                return Image.network(
                                  '',
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: filterAdminNotifications.length,
                                itemBuilder:
                                    (context, filterAdminNotificationsIndex) {
                                  final filterAdminNotificationsItem =
                                      filterAdminNotifications[
                                          filterAdminNotificationsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: NotificationListItemWidget(
                                      notificationRef:
                                          filterAdminNotificationsItem,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminActionsWidgetWidget(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
