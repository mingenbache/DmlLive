import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  DmlLiveFirebaseUser initialUser;
  DmlLiveFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(DmlLiveFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? CheckupWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? CheckupWidget() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'Details',
              path: 'details',
              builder: (context, params) => DetailsWidget(
                testId: params.getParam(
                    'testId', ParamType.DocumentReference, 'tests'),
              ),
            ),
            FFRoute(
              name: 'NewTest',
              path: 'newTest',
              builder: (context, params) => NewTestWidget(),
            ),
            FFRoute(
              name: 'UserList',
              path: 'userList',
              builder: (context, params) => UserListWidget(
                staffFilter: params.getParam('staffFilter', ParamType.bool),
                userNameQUery:
                    params.getParam('userNameQUery', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AllTests',
              path: 'allTests',
              builder: (context, params) => AllTestsWidget(),
            ),
            FFRoute(
              name: 'ModifyTest',
              path: 'modifyTest',
              builder: (context, params) => ModifyTestWidget(
                testId: params.getParam(
                    'testId', ParamType.DocumentReference, 'tests'),
              ),
            ),
            FFRoute(
              name: 'BookingUpdates',
              path: 'bookingUpdates',
              builder: (context, params) => BookingUpdatesWidget(
                bookingRef: params.getParam(
                    'bookingRef', ParamType.DocumentReference, 'bookings'),
              ),
            ),
            FFRoute(
              name: 'Invoice',
              path: 'invoice',
              builder: (context, params) => InvoiceWidget(
                invoiceRef: params.getParam(
                    'invoiceRef', ParamType.DocumentReference, 'Invoices'),
              ),
            ),
            FFRoute(
              name: 'LabReport',
              path: 'labReport',
              builder: (context, params) => LabReportWidget(
                bookingRef: params.getParam(
                    'bookingRef', ParamType.DocumentReference, 'bookings'),
              ),
            ),
            FFRoute(
              name: 'AddPayment',
              path: 'addPayment',
              builder: (context, params) => AddPaymentWidget(
                invoiceRef: params.getParam(
                    'invoiceRef', ParamType.DocumentReference, 'Invoices'),
              ),
            ),
            FFRoute(
              name: 'ReportList',
              path: 'reportList',
              builder: (context, params) => ReportListWidget(),
            ),
            FFRoute(
              name: 'TestDeck',
              path: 'testDeck',
              builder: (context, params) => TestDeckWidget(
                testedTestRef: params.getParam('testedTestRef',
                    ParamType.DocumentReference, 'tested_tests'),
              ),
            ),
            FFRoute(
              name: 'InvoiceList',
              path: 'invoiceList',
              builder: (context, params) => InvoiceListWidget(),
            ),
            FFRoute(
              name: 'editUser',
              path: 'editUser',
              builder: (context, params) => EditUserWidget(),
            ),
            FFRoute(
              name: 'TestedTests',
              path: 'testedTests',
              builder: (context, params) => TestedTestsWidget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'checkup',
              path: 'checkup',
              builder: (context, params) => CheckupWidget(),
            ),
            FFRoute(
              name: 'MyBookings',
              path: 'myBookings',
              builder: (context, params) => MyBookingsWidget(),
            ),
            FFRoute(
              name: 'Signup',
              path: 'signup',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'myInvoiceList',
              path: 'myInvoiceList',
              builder: (context, params) => MyInvoiceListWidget(),
            ),
            FFRoute(
              name: 'myReportList',
              path: 'myReportList',
              builder: (context, params) => MyReportListWidget(),
            ),
            FFRoute(
              name: 'Settings',
              path: 'settings',
              builder: (context, params) => SettingsWidget(),
            ),
            FFRoute(
              name: 'TestQueue',
              path: 'testQueue',
              builder: (context, params) => TestQueueWidget(),
            ),
            FFRoute(
              name: 'TestedTestsCopy',
              path: 'testedTestsCopy',
              builder: (context, params) => TestedTestsCopyWidget(),
            ),
            FFRoute(
              name: 'Chat',
              path: 'chat',
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, 'chats'),
              ),
            ),
            FFRoute(
              name: 'TechnologistTestDeck',
              path: 'technologistTestDeck',
              asyncParams: {
                'bookedTest':
                    getDoc('booked_tests', BookedTestsRecord.serializer),
              },
              builder: (context, params) => TechnologistTestDeckWidget(
                bookedTest: params.getParam('bookedTest', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'BookingInvoicing',
              path: 'bookingInvoicing',
              builder: (context, params) => BookingInvoicingWidget(
                bookingRef: params.getParam(
                    'bookingRef', ParamType.DocumentReference, 'bookings'),
              ),
            ),
            FFRoute(
              name: 'BookingReport',
              path: 'bookingReport',
              builder: (context, params) => BookingReportWidget(
                reportRef: params.getParam(
                    'reportRef', ParamType.DocumentReference, 'reports'),
              ),
            ),
            FFRoute(
              name: 'myPayments',
              path: 'myPayments',
              builder: (context, params) => MyPaymentsWidget(),
            ),
            FFRoute(
              name: 'NewBooking',
              path: 'newBooking',
              builder: (context, params) => NewBookingWidget(
                bookingRef: params.getParam(
                    'bookingRef', ParamType.DocumentReference, 'bookings'),
              ),
            ),
            FFRoute(
              name: 'myAccount',
              path: 'myAccount',
              builder: (context, params) => MyAccountWidget(),
            ),
            FFRoute(
              name: 'HomeAdmin',
              path: 'homeAdmin',
              builder: (context, params) => HomeAdminWidget(),
            ),
            FFRoute(
              name: 'PaymentsList',
              path: 'paymentsList',
              builder: (context, params) => PaymentsListWidget(),
            ),
            FFRoute(
              name: 'ScheduledTests',
              path: 'scheduledTests',
              builder: (context, params) => ScheduledTestsWidget(),
            ),
            FFRoute(
              name: 'BookingsSchedule',
              path: 'bookingsSchedule',
              builder: (context, params) => BookingsScheduleWidget(),
            ),
            FFRoute(
              name: 'BookingConfirmation',
              path: 'bookingConfirmation',
              builder: (context, params) => BookingConfirmationWidget(
                bookingRef: params.getParam(
                    'bookingRef', ParamType.DocumentReference, 'bookings'),
              ),
            ),
            FFRoute(
              name: 'Messages',
              path: 'messages',
              builder: (context, params) => MessagesWidget(),
            ),
            FFRoute(
              name: 'HomeCopy',
              path: 'homeCopy',
              builder: (context, params) => HomeCopyWidget(),
            ),
            FFRoute(
              name: 'HomeAdminCopy',
              path: 'homeAdminCopy',
              builder: (context, params) => HomeAdminCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
