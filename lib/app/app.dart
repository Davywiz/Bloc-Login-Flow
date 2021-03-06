import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:login_flow_bloc/app/app_prefs.dart';
import 'package:login_flow_bloc/app/di.dart';
import 'package:login_flow_bloc/bloc/auth/auth_bloc.dart';
import 'package:login_flow_bloc/bloc/language/language_cubit.dart';
import 'package:login_flow_bloc/presentation/resources/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => instance<LanguageCubit>()..getLocal(),
      ),
      BlocProvider(
        create: (context) => instance<AuthBloc>(),
      ),
    ], child: const NewHome());
  }
}

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LanguageCubit, LanguageState>(
      listener: (context, state) async {
        await context.setLocale(state.language);
      },
      listenWhen: (previous, next) => next.setLocale == true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
