import 'package:flutter/material.dart';
import 'package:state_hero/core/res/app_constants.dart';
import 'package:state_hero/core/res/colors.dart';
import 'package:state_hero/core/res/routes.dart';
import 'package:state_hero/core/res/sizes.dart';
import 'features/general/presentation/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: const EdgeInsets.all(16.0),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
