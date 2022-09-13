import '../components/user_list_chat_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatActionsWidgetWidget extends StatefulWidget {
  const ChatActionsWidgetWidget({Key? key}) : super(key: key);

  @override
  _ChatActionsWidgetWidgetState createState() =>
      _ChatActionsWidgetWidgetState();
}

class _ChatActionsWidgetWidgetState extends State<ChatActionsWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: UserListChatWidget(),
                );
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxWidth: 330,
              maxHeight: 80,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF58585C),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 22),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message_sharp,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: Text(
                      'New Message',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
