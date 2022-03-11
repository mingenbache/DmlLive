import '../components/user_list_chat_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatActionsWidgetWidget extends StatefulWidget {
  const ChatActionsWidgetWidget({Key key}) : super(key: key);

  @override
  _ChatActionsWidgetWidgetState createState() =>
      _ChatActionsWidgetWidgetState();
}

class _ChatActionsWidgetWidgetState extends State<ChatActionsWidgetWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'New Message',
                    icon: Icon(
                      Icons.message_sharp,
                      size: 20,
                    ),
                    options: FFButtonOptions(
                      width: 160,
                      height: 40,
                      color: Color(0x00B3B2B2),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Color(0xFFBACA68),
                                fontWeight: FontWeight.normal,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: 30,
                    ),
                  ).animated([animationsMap['buttonOnActionTriggerAnimation']]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
