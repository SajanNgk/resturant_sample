import 'package:flutter/material.dart';

/// A central place to manage global configuration settings
class AppConfig {
  // App Information
  static const String appName = 'Restronaut';
  static const String appTagline = 'Your one stop shop for all things tech';
  static const String poweredBy = 'Harambe Gople Studio';
  static const String appVersion = '1.0.0';

  // API URLs
  static const String baseUrl = 'https://admin.hyperce.io/shop-api/';
  static const String imagesUrl = 'https://admin.hyperce.io/images/';
  static const String videosUrl = 'https://admin.hyperce.io/videos/';

  // UI Customization
  static const String fontFamily = 'Montserrat';
  static const bool showDebugBanner = false;
  static const Color primaryColor = Color(0xFF357D8A);

  // Other Settings
  static const bool enableNotifications = true;
}
