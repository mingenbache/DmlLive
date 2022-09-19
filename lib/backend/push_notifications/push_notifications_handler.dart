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
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
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
            width: 50,
            height: 50,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 50,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Home': (data) async => HomeWidget(),
  'Details': (data) async => DetailsWidget(
        testId: getParameter(data, 'testId'),
      ),
  'NewTest': (data) async => NewTestWidget(),
  'UserList': (data) async => UserListWidget(
        staffFilter: getParameter(data, 'staffFilter'),
        userNameQUery: getParameter(data, 'userNameQUery'),
      ),
  'AllTests': (data) async => AllTestsWidget(),
  'ModifyTest': (data) async => ModifyTestWidget(
        testId: getParameter(data, 'testId'),
      ),
  'BookingUpdates': (data) async => BookingUpdatesWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'Invoice': (data) async => InvoiceWidget(
        invoiceRef: getParameter(data, 'invoiceRef'),
      ),
  'LabReport': (data) async => LabReportWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'AddPayment': (data) async => AddPaymentWidget(
        invoiceRef: getParameter(data, 'invoiceRef'),
      ),
  'ReportList': (data) async => ReportListWidget(),
  'TestDeck': (data) async => TestDeckWidget(
        testedTestRef: getParameter(data, 'testedTestRef'),
      ),
  'InvoiceList': (data) async => InvoiceListWidget(),
  'editUser': (data) async => EditUserWidget(),
  'TestedTests': (data) async => TestedTestsWidget(),
  'Login': (data) async => LoginWidget(),
  'MyBookings': (data) async => MyBookingsWidget(),
  'Signup': (data) async => SignupWidget(),
  'myInvoiceList': (data) async => MyInvoiceListWidget(),
  'myReportList': (data) async => MyReportListWidget(),
  'Settings': (data) async => SettingsWidget(),
  'TestQueue': (data) async => TestQueueWidget(),
  'TestedTestsCopy': (data) async => TestedTestsCopyWidget(),
  'Chat': (data) async => ChatWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'TechnologistTestDeck': (data) async => TechnologistTestDeckWidget(
        bookedTest: await getDocumentParameter(
            data, 'bookedTest', BookedTestsRecord.serializer),
      ),
  'BookingReport': (data) async => BookingReportWidget(
        reportRef: getParameter(data, 'reportRef'),
      ),
  'myPayments': (data) async => MyPaymentsWidget(),
  'NewBooking': (data) async => NewBookingWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'myAccount': (data) async => MyAccountWidget(),
  'HomeAdmin': (data) async => HomeAdminWidget(),
  'PaymentsList': (data) async => PaymentsListWidget(),
  'ScheduledTests': (data) async => ScheduledTestsWidget(),
  'BookingsSchedule': (data) async => BookingsScheduleWidget(),
  'BookingConfirmation': (data) async => BookingConfirmationWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'Messages': (data) async => MessagesWidget(),
  'HomeCopy': (data) async => HomeCopyWidget(),
  'HomeAdminCopy': (data) async => HomeAdminCopyWidget(),
  'BookingInvoicing': (data) async => BookingInvoicingWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
