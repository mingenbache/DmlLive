import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home': ParameterData.none(),
  'Details': (data) async => ParameterData(
        allParams: {
          'testId': getParameter<DocumentReference>(data, 'testId'),
        },
      ),
  'NewTest': ParameterData.none(),
  'UserList': (data) async => ParameterData(
        allParams: {
          'staffFilter': getParameter<bool>(data, 'staffFilter'),
          'userNameQUery': getParameter<String>(data, 'userNameQUery'),
        },
      ),
  'ModifyTest': (data) async => ParameterData(
        allParams: {
          'testId': getParameter<DocumentReference>(data, 'testId'),
        },
      ),
  'BookingUpdates': (data) async => ParameterData(
        allParams: {
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
  'Invoice': (data) async => ParameterData(
        allParams: {
          'invoiceRef': getParameter<DocumentReference>(data, 'invoiceRef'),
        },
      ),
  'LabReport': (data) async => ParameterData(
        allParams: {
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
  'AddPayment': (data) async => ParameterData(
        allParams: {
          'invoiceRef': getParameter<DocumentReference>(data, 'invoiceRef'),
        },
      ),
  'ReportList': ParameterData.none(),
  'TestDeck': (data) async => ParameterData(
        allParams: {
          'testedTestRef':
              getParameter<DocumentReference>(data, 'testedTestRef'),
        },
      ),
  'InvoiceList': ParameterData.none(),
  'editUser': ParameterData.none(),
  'TestedTests': ParameterData.none(),
  'Login': ParameterData.none(),
  'checkup': ParameterData.none(),
  'MyBookings': ParameterData.none(),
  'Signup': ParameterData.none(),
  'myInvoiceList': ParameterData.none(),
  'myReportList': ParameterData.none(),
  'Settings': ParameterData.none(),
  'TestQueue': ParameterData.none(),
  'TestConsole': ParameterData.none(),
  'Chat': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'TechnologistTestDeck': (data) async => ParameterData(
        allParams: {
          'bookedTest': await getDocumentParameter<BookedTestsRecord>(
              data, 'bookedTest', BookedTestsRecord.fromSnapshot),
        },
      ),
  'BookingReport': (data) async => ParameterData(
        allParams: {
          'reportRef': getParameter<DocumentReference>(data, 'reportRef'),
        },
      ),
  'myPayments': ParameterData.none(),
  'NewBooking': (data) async => ParameterData(
        allParams: {
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
  'myAccount': ParameterData.none(),
  'HomeAdmin': ParameterData.none(),
  'PaymentsList': ParameterData.none(),
  'ScheduledTests': ParameterData.none(),
  'BookingsSchedule': ParameterData.none(),
  'BookingConfirmation': (data) async => ParameterData(
        allParams: {
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
  'Messages': ParameterData.none(),
  'HomeCopy': ParameterData.none(),
  'BookingInvoicing': (data) async => ParameterData(
        allParams: {
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
