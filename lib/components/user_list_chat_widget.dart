import '../backend/backend.dart';
import '../components/client_user_card_widget.dart';
import '../components/staff_user_chat_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class UserListChatWidget extends StatefulWidget {
  const UserListChatWidget({Key key}) : super(key: key);

  @override
  _UserListChatWidgetState createState() => _UserListChatWidgetState();
}

class _UserListChatWidgetState extends State<UserListChatWidget> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.83,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 2,
                      ),
                      child: Image.asset(
                        'assets/images/aditya-vyas-7qUWVveyiYI-unsplash_reduced.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.89,
                  decoration: BoxDecoration(
                    color: Color(0x66586B06),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 34, 0, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          constraints: BoxConstraints(
                            maxWidth: 370,
                          ),
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CHAT USERS',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                              ),
                              InkWell(
                                onTap: () async {
                                  context.pop();
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                      setState(() =>
                                          FFAppState().categorypicked = 'All');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          constraints: BoxConstraints(
                            maxWidth: 320,
                          ),
                          decoration: BoxDecoration(),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0x91FFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: Color(0xFF586B06),
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'textController',
                                          Duration(milliseconds: 500),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Search user here...',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFF586B06),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFF586B06),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x004B39EF),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x004B39EF),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: textController
                                                  .text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () => setState(
                                                    () =>
                                                        textController?.clear(),
                                                  ),
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 18,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF586B06),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.83,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0x00FFFFFF),
                                FlutterFlowTheme.of(context).tertiaryColor,
                                FlutterFlowTheme.of(context).alternate
                              ],
                              stops: [0, 0.2, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: DefaultTabController(
                                    length: 2,
                                    initialIndex: 0,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          labelColor: Colors.white,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiaryColor,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2,
                                          indicatorColor: Colors.white,
                                          tabs: [
                                            Tab(
                                              text: 'Clients',
                                            ),
                                            Tab(
                                              text: 'Staff',
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        clientUserContainerUsersRecordList =
                                                        snapshot.data;
                                                    return Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.83,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 330,
                                                        maxHeight: 500,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  46),
                                                          topRight:
                                                              Radius.circular(
                                                                  46),
                                                        ),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final clients = functions
                                                                  .returnUserList(
                                                                      textController
                                                                          .text,
                                                                      clientUserContainerUsersRecordList
                                                                          .toList())
                                                                  ?.toList() ??
                                                              [];
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                clients.length,
                                                            itemBuilder: (context,
                                                                clientsIndex) {
                                                              final clientsItem =
                                                                  clients[
                                                                      clientsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'Chat',
                                                                        queryParams:
                                                                            {
                                                                          'chatUser': serializeParam(
                                                                              clientsItem,
                                                                              ParamType.Document),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'chatUser':
                                                                              clientsItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        ClientUserCardWidget(
                                                                      userRecord:
                                                                          clientsItem,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              StreamBuilder<List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where(
                                                          'isStaff',
                                                          isEqualTo: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      staffUserContainerUsersRecordList =
                                                      snapshot.data;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    constraints: BoxConstraints(
                                                      maxHeight: 560,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final staff = functions
                                                                .returnUserList(
                                                                    textController
                                                                        .text,
                                                                    staffUserContainerUsersRecordList
                                                                        .toList())
                                                                ?.toList() ??
                                                            [];
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              staff.length,
                                                          itemBuilder: (context,
                                                              staffIndex) {
                                                            final staffItem =
                                                                staff[
                                                                    staffIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          15),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'Chat',
                                                                        queryParams:
                                                                            {
                                                                          'chatUser': serializeParam(
                                                                              staffItem,
                                                                              ParamType.Document),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'chatUser':
                                                                              staffItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        StaffUserChatCardWidget(
                                                                      userRecord:
                                                                          staffItem,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.85,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
