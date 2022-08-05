import '../backend/backend.dart';
import '../components/client_user_cardx_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientUserContainer2Widget extends StatefulWidget {
  const ClientUserContainer2Widget({
    Key key,
    this.nameQuery,
  }) : super(key: key);

  final String nameQuery;

  @override
  _ClientUserContainer2WidgetState createState() =>
      _ClientUserContainer2WidgetState();
}

class _ClientUserContainer2WidgetState
    extends State<ClientUserContainer2Widget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(),
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
        List<UsersRecord> clientUserContainerUsersRecordList = snapshot.data;
        return Container(
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.height * 1,
          constraints: BoxConstraints(
            maxWidth: 330,
            maxHeight: 560,
          ),
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              final clients = functions
                  .returnUserList(
                      widget.nameQuery,
                      functions
                          .filterClients(
                              clientUserContainerUsersRecordList.toList())
                          .toList())
                  .toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: clients.length,
                itemBuilder: (context, clientsIndex) {
                  final clientsItem = clients[clientsIndex];
                  return ClientUserCardxWidget(
                    userRecord: clientsItem,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
