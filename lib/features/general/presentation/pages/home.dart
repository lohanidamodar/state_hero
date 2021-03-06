import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:state_hero/core/res/app_constants.dart';
import 'package:state_hero/core/res/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Text(
                AppConstants.appName.toUpperCase(),
                style: context.textTheme.headline3.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text("Play Now"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: context.primaryColor,
                  elevation: 0,
                  padding: const EdgeInsets.all(24.0)
                ),
                onPressed: () => Navigator.pushNamed(context, AppRoutes.categories),
              )
            ],
          ),
        ),
      ),
    );
  }
}
