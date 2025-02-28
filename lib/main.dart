/// NIC Decoder Application
/// 
/// A Flutter application that decodes Sri Lankan National Identity Card numbers
/// and extracts information such as birth date, gender, and voting eligibility.
library nic_decoder;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

/// The main entry point for the application.
/// 
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