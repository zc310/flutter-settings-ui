import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NavigationRouteStyle {
  cupertino,
  material,
}

class Navigation {
  static Future<T?> navigateTo<T>({
    required BuildContext context,
    required Widget screen,
    required NavigationRouteStyle style,
    bool fullscreenDialog = false,
  }) async {
    final Route<T> route;

    switch (style) {
      case NavigationRouteStyle.cupertino:
        route = CupertinoPageRoute<T>(
          builder: (_) => screen,
          fullscreenDialog: fullscreenDialog,
        );
        break;
      case NavigationRouteStyle.material:
        route = MaterialPageRoute<T>(
          builder: (_) => screen,
          fullscreenDialog: fullscreenDialog,
        );
        break;
    }

    return await Navigator.push<T>(context, route);
  }
}