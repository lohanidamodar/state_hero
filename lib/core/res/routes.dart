import 'package:flutter/material.dart';
import 'package:state_hero/features/general/presentation/pages/home.dart';
import 'package:state_hero/features/quiz/presentation/pages/categories.dart';
import 'package:state_hero/features/quiz/presentation/pages/quiz_page.dart';
import 'package:state_hero/features/quiz/presentation/pages/quiz_summary.dart';

class AppRoutes {
  static const String home = "home";
  static const String categories = "categories";
  static const String quiz = "quiz";
  static const String quizSummary = "quiz_summary";

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case quizSummary:
        return _buildRoute(settings, QuizSummaryPage(vm: settings.arguments));
      case quiz:
        return _buildRoute(
            settings,
            QuizPage(
              vm: settings.arguments,
            ));
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
