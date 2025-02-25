import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

/// Entry point of the application.
/// Initializes the GetX application with theme and routing configuration.
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.INPUT,
      getPages: AppPages.routes,
    ),
  );
}