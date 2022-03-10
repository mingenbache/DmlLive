import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../login/login_widget.dart';
import '../../details/details_widget.dart';
import '../../new_test/new_test_widget.dart';
import '../../signup/signup_widget.dart';
import '../../new_booking/new_booking_widget.dart';
import '../../account/account_widget.dart';
import '../../messages/messages_widget.dart';
import '../../settings/settings_widget.dart';
import '../../scheduled_tests/scheduled_tests_widget.dart';
import '../../user_list/user_list_widget.dart';
import '../../home_admin/home_admin_widget.dart';
import '../../booking_confirmation/booking_confirmation_widget.dart';
import '../../all_tests/all_tests_widget.dart';
import '../../booking_invoicing/booking_invoicing_widget.dart';
import '../../modify_test/modify_test_widget.dart';
import '../../booking_updates/booking_updates_widget.dart';
import '../../invoice/invoice_widget.dart';
import '../../add_payment/add_payment_widget.dart';
import '../../test_report/test_report_widget.dart';
import '../../report_list/report_list_widget.dart';
import '../../test_deck/test_deck_widget.dart';
import '../../invoice_list/invoice_list_widget.dart';
import '../../edit_user/edit_user_widget.dart';
import '../../tested_tests/tested_tests_widget.dart';
import '../../payments_list/payments_list_widget.dart';
import '../../bookings_schedule/bookings_schedule_widget.dart';
import '../../my_bookings/my_bookings_widget.dart';
import '../../my_invoice_list/my_invoice_list_widget.dart';
import '../../my_report_list/my_report_list_widget.dart';
import '../../test_queue/test_queue_widget.dart';
import '../../tested_tests_copy/tested_tests_copy_widget.dart';
import '../../chat/chat_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
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
            child: SpinKitDoubleBounce(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 50,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Login': (data) async => LoginWidget(),
  'Details': (data) async => DetailsWidget(
        testId: getParameter(data, 'testId'),
      ),
  'NewTest': (data) async => NewTestWidget(),
  'Signup': (data) async => SignupWidget(),
  'NewBooking': (data) async => NewBookingWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'Account': (data) async => AccountWidget(),
  'Messages': (data) async => MessagesWidget(),
  'Settings': (data) async => SettingsWidget(),
  'ScheduledTests': (data) async => ScheduledTestsWidget(),
  'UserList': (data) async => UserListWidget(
        staffFilter: getParameter(data, 'staffFilter'),
        userNameQUery: getParameter(data, 'userNameQUery'),
      ),
  'HomeAdmin': (data) async => HomeAdminWidget(),
  'BookingConfirmation': (data) async => BookingConfirmationWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'AllTests': (data) async => AllTestsWidget(),
  'BookingInvoicing': (data) async => BookingInvoicingWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'ModifyTest': (data) async => ModifyTestWidget(
        testId: getParameter(data, 'testId'),
      ),
  'BookingUpdates': (data) async => BookingUpdatesWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'Invoice': (data) async => InvoiceWidget(
        invoiceRef: getParameter(data, 'invoiceRef'),
      ),
  'AddPayment': (data) async => AddPaymentWidget(
        invoiceRef: getParameter(data, 'invoiceRef'),
      ),
  'TestReport': (data) async => TestReportWidget(
        bookingRef: getParameter(data, 'bookingRef'),
      ),
  'ReportList': (data) async => ReportListWidget(),
  'TestDeck': (data) async => TestDeckWidget(
        testedTestRef: getParameter(data, 'testedTestRef'),
      ),
  'InvoiceList': (data) async => InvoiceListWidget(),
  'editUser': (data) async => EditUserWidget(),
  'TestedTests': (data) async => TestedTestsWidget(),
  'PaymentsList': (data) async => PaymentsListWidget(),
  'BookingsSchedule': (data) async => BookingsScheduleWidget(),
  'MyBookings': (data) async => MyBookingsWidget(),
  'myInvoiceList': (data) async => MyInvoiceListWidget(),
  'myReportList': (data) async => MyReportListWidget(),
  'TestQueue': (data) async => TestQueueWidget(),
  'TestedTestsCopy': (data) async => TestedTestsCopyWidget(),
  'Chat': (data) async => ChatWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
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
