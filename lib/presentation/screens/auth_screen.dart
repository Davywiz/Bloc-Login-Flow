import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow_bloc/bloc/auth/auth_bloc.dart';
import 'package:login_flow_bloc/presentation/resources/route_manager.dart';
import 'package:login_flow_bloc/presentation/resources/strings_manager.dart';
import 'package:login_flow_bloc/presentation/screens/loginScreen.dart';
import 'package:login_flow_bloc/presentation/screens/registerScreen.dart';
import 'package:login_flow_bloc/presentation/widgets/dialog/show_authError.dart';
import 'package:login_flow_bloc/presentation/widgets/loading/loading_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.isLoading) {
        LoadingScreen.instance().show(
          context: context,
          text: AppStrings.loading.tr(),
        );
      } else {
        LoadingScreen.instance().hide();
      }
      final authError = state.authError;
      if (authError != null) {
        showAuthError(authError: authError.tr(), context: context);
      }
      if (state is AuthSuccessState && state.isLogin == false) {
        print('REGISTERED USER');
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
               SnackBar(content: const Text(AppStrings.registrationSuccess).tr()));
      }
      if (state is AuthSuccessState && state.isLogin == true) {
        print('Logging in');
        Navigator.of(context).pushReplacementNamed(Routes.blogRoutes);
      }
    }, builder: (context, state) {
      if (state is AuthLogin) {
        return const LoginView();
      } else if (state is AuthSignUp) {
        return const RegisterView();
      } else {
        return Container();
      }
    });
  }
}
