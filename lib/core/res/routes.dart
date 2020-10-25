import 'package:flutter/material.dart';
import 'package:state_hero/features/general/presentation/pages/home.dart';
import 'package:state_hero/features/quiz/presentation/pages/categories.dart';

class AppRoutes {
  static const String home = "home";
  static const String categories = "categories";

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categories:
        return _buildRoute(settings, CategoriesPage());
      case "/":
      case home:
        return _buildRoute(settings, HomePage());
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
