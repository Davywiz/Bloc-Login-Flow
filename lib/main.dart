import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow_bloc/app/app.dart';
import 'package:login_flow_bloc/app/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:login_flow_bloc/presentation/resources/language_manager.dart';
import 'package:login_flow_bloc/utils/bloc_observer.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  BlocOverrides.runZoned(
    () {
      runApp(
        EasyLocalization(
          supportedLocales: const [
            ENGLISH_LOCALE,
            FRENCH_LOCALE,
            SPANISH_LOCALE,
          ],
          path: ASSETS_PATH_LOCALIZATION,
          child: Phoenix(
            child: const MyApp(),
          ),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
