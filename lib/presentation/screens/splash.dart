import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow_bloc/bloc/auth/auth_bloc.dart';
import 'package:login_flow_bloc/presentation/resources/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthBloc _appPreferences;

  _startDelay(context) {
    Future.delayed(const Duration(seconds: 2), () => _goNext(context));
  }

  _goNext(context) async {
    final bool isUserLoggedIn = await _appPreferences.getUserLoggedIn();
    if (isUserLoggedIn) {
      // navigate to main screen
      Navigator.pushReplacementNamed(context, Routes.blogRoutes);
    } else {
      //navigate to route screen
      Navigator.pushReplacementNamed(context, Routes.authScreen);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appPreferences = BlocProvider.of<AuthBloc>(context);
    _startDelay(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
