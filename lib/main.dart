import 'package:ecommerce_task/features/page/product_screen.dart';
import 'package:flutter/material.dart';

import 'core/config/app_theme_manager.dart';
import 'core/config/page_route_name.dart';
import 'core/config/routes.dart';


GlobalKey<NavigatorState> navigateKey=GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeManager.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const ProductView(),
      initialRoute: PageRouteName.home,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: navigateKey,
    );
  }
}

