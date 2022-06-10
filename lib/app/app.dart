import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow_bloc/app/di.dart';
import 'package:login_flow_bloc/bloc/auth_bloc.dart';
import 'package:login_flow_bloc/presentation/resources/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<AuthBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        initialRoute: Routes.splashScreen,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
