import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/views/screens/screens.dart';

import '../views/screens/serviceClient/notification/notification.dart';

class Routes {
  Routes._();
  static const String initial = 'initial';
  static const String login = 'login';
  static const String page = 'page';
  static const String espacerevendeur = 'espacerevendeur';
  static const String notificationscreen = 'notification';
  static final routes = <String, WidgetBuilder>{
    login: (context) => LoginScreen(),
    page: (context) => const PageNav(),
    espacerevendeur: (context) => EspaceRevendeur(),
    notificationscreen: (context) => const NotificationScreen(),
  };
}
