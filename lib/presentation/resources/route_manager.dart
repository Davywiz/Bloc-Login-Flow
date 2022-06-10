import 'package:flutter/material.dart';
import 'package:login_flow_bloc/presentation/screens/auth_screen.dart';
import 'package:login_flow_bloc/presentation/screens/blog_screen.dart';
import 'package:login_flow_bloc/presentation/screens/splash.dart';

class Routes {
  static const String splashScreen = "/";
  static const String authScreen = "/auth";
  static const String blogRoutes = "/blog";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.blogRoutes:
        return MaterialPageRoute(builder: (_) => BlogScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}
