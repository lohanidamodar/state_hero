import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = "home";

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
      default:
        return _buildRoute(
          settings,
          Scaffold(
            body: Center(
              child: Text("Page for route ${settings.name} is not found"),
            ),
          ),
        );
    }
  }

  static Route _buildRoute(RouteSettings settings, Widget builder,
      [bool fullScreenDialog = false]) {
    return MaterialPageRoute(
      fullscreenDialog: fullScreenDialog,
      settings: settings,
      builder: (_) => builder,
    );
  }
}  
  