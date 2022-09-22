import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/package_details_popup_widget.dart';
import '../components/test_details_popup_widget.dart';
import '../components/user_activity_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationListItemWidget extends StatefulWidget {
  const NotificationListItemWidget({
    Key? key,
    this.notificationRef,
  }) : super(key: key);

  final NotificationsRecord? notificationRef;

  @override
  _NotificationListItemWidgetState createState() =>
      _NotificationListItemWidgetState();
}

class _NotificationListItemWidgetState
    extends State<NotificationListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: StreamBuilder<NotificationsRecord>(
        stream:
            NotificationsRecord.getDocument(widget.notificationRef!.reference),
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
          final stackNotificationsRecord = snapshot.data!;
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 30,
            child: Stack(
              children: [
                if (stackNotificationsRecord.type == 'newbooking')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'BookingConfirmation',
                        queryParams: {
                          'bookingRef': serializeParam(
                              stackNotificationsRecord.bookingRef,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'confirmedbooking')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'BookingUpdates',
                        queryParams: {
                          'bookingRef': serializeParam(
                              stackNotificationsRecord.bookingRef,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'newuser')
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: UserActivityWidget(
                              userRef: stackNotificationsRecord.userRef,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'newtest')
                  StreamBuilder<TestsRecord>(
                    stream: TestsRecord.getDocument(
                        stackNotificationsRecord.testref!),
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
                      final containernewTestTestsRecord = snapshot.data!;
                      return InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: TestDetailsPopupWidget(
                                  test: containernewTestTestsRecord,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 30,
                          constraints: BoxConstraints(
                            maxWidth: 380,
                            maxHeight: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 280,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 5, 5),
                                              child: Text(
                                                widget
                                                    .notificationRef!.message!,
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 2, 0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 35,
                                          icon: Icon(
                                            Icons.highlight_off_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 17,
                                          ),
                                          onPressed: () async {
                                            final notificationsUpdateData = {
                                              'usersSeen':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            };
                                            await widget
                                                .notificationRef!.reference
                                                .update(
                                                    notificationsUpdateData);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (stackNotificationsRecord.type == 'newtestpackage')
                  StreamBuilder<TestPackagesRecord>(
                    stream: TestPackagesRecord.getDocument(
                        stackNotificationsRecord.testpackageref!),
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
                      final containernewTestPackageTestPackagesRecord =
                          snapshot.data!;
                      return InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: PackageDetailsPopupWidget(
                                  package:
                                      containernewTestPackageTestPackagesRecord,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 30,
                          constraints: BoxConstraints(
                            maxWidth: 380,
                            maxHeight: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 280,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 5, 5),
                                              child: Text(
                                                widget
                                                    .notificationRef!.message!,
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 0, 2, 0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 35,
                                          icon: Icon(
                                            Icons.highlight_off_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 17,
                                          ),
                                          onPressed: () async {
                                            final notificationsUpdateData = {
                                              'usersSeen':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            };
                                            await widget
                                                .notificationRef!.reference
                                                .update(
                                                    notificationsUpdateData);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (stackNotificationsRecord.type == 'samplecollected')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'TestDeck',
                        queryParams: {
                          'testedTestRef': serializeParam(
                              stackNotificationsRecord.testedtestref,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'resultsubmitted')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'TestDeck',
                        queryParams: {
                          'testedTestRef': serializeParam(
                              stackNotificationsRecord.testedtestref,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'testflagged')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'TestDeck',
                        queryParams: {
                          'testedTestRef': serializeParam(
                              stackNotificationsRecord.testedtestref,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'testverified')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'TestDeck',
                        queryParams: {
                          'testedTestRef': serializeParam(
                              stackNotificationsRecord.testedtestref,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (stackNotificationsRecord.type == 'newreport')
                  InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'BookingReport',
                        queryParams: {
                          'reportRef': serializeParam(
                              stackNotificationsRecord.reportref,
                              ParamType.DocumentReference),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 30,
                      constraints: BoxConstraints(
                        maxWidth: 380,
                        maxHeight: 30,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 280,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: Text(
                                            widget.notificationRef!.message!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 2, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                      icon: Icon(
                                        Icons.highlight_off_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 17,
                                      ),
                                      onPressed: () async {
                                        final notificationsUpdateData = {
                                          'usersSeen': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        };
                                        await widget.notificationRef!.reference
                                            .update(notificationsUpdateData);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
