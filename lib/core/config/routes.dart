import 'package:flutter/material.dart';
import '../../features/page/product_screen.dart';

class Routes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings ){
    switch (settings.name) {

      case "/product":
        return MaterialPageRoute(builder: (context) => const ProductView(),settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const ProductView(),settings: settings);
  }

  }
}

