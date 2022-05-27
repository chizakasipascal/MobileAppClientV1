import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/views/screens/espaceClient/espaceClient.dart';
import 'package:mobileappclientv1/src/views/screens/screens.dart';

import '../views/screens/serviceClient/notification/notification.dart';

class Routes {
  Routes._();
  static const String initial = 'initial';
  static const String login = 'login';
  static String register = 'login';
  static const String page = 'page';
  static const String espaceClient = 'espaceClient';
  static const String notificationscreen = 'notification';
  static final routes = <String, WidgetBuilder>{
    page: (context) => const PageNav(),
    login: (context) => LoginScreen(),
    register: (context) => Register(),
    espaceClient: (context) => EspaceClient(),
    notificationscreen: (context) => const NotificationScreen(),
  };
}
