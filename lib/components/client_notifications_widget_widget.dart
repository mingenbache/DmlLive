import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/dashboard_menu_widget_light_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/notification_list_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientNotificationsWidgetWidget extends StatefulWidget {
  const ClientNotificationsWidgetWidget({Key? key}) : super(key: key);

  @override
  _ClientNotificationsWidgetWidgetState createState() =>
      _ClientNotificationsWidgetWidgetState();
}

class _ClientNotificationsWidgetWidgetState
    extends State<ClientNotificationsWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              maxWidth: 430,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<NotificationsRecord>>(
                stream: queryNotificationsRecord(
                  queryBuilder: (notificationsRecord) => notificationsRecord
                      .where('users_receiving',
                          arrayContains: currentUserReference)
                      .orderBy('created_date', descending: true),
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
                      snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
                    constraints: BoxConstraints(
                      maxWidth: 380,
                    ),
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final unseenNotifications = functions
                                  .filterNotifications(
                                      containerNotificationsRecordList.toList(),
                                      currentUserReference)
                                  .toList();
                              if (unseenNotifications.isEmpty) {
                                return Center(
                                  child: EmptyListWidget(),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: unseenNotifications.length,
                                itemBuilder:
                                    (context, unseenNotificationsIndex) {
                                  final unseenNotificationsItem =
                                      unseenNotifications[
                                          unseenNotificationsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: NotificationListItemWidget(
                                      notificationRef: unseenNotificationsItem,
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
                  DashboardMenuWidgetLightWidget(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
