import '/components/user_list_chat/user_list_chat_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_actions_widget_model.dart';
export 'chat_actions_widget_model.dart';

class ChatActionsWidgetWidget extends StatefulWidget {
  const ChatActionsWidgetWidget({Key? key}) : super(key: key);

  @override
  _ChatActionsWidgetWidgetState createState() =>
      _ChatActionsWidgetWidgetState();
}

class _ChatActionsWidgetWidgetState extends State<ChatActionsWidgetWidget> {
  late ChatActionsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatActionsWidgetModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Color(0x00000000),
              context: context,
              builder: (bottomSheetContext) {
                return Padding(
                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                  child: UserListChatWidget(),
                );
              },
            ).then((value) => setState(() {}));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(
              maxWidth: 330.0,
              maxHeight: 80.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF58585C),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 22.0, 22.0, 22.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message_sharp,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'New Message',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 16.0,
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
