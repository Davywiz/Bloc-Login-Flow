import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:login_flow_bloc/app/extensions.dart';
import 'package:login_flow_bloc/bloc/auth/auth_bloc.dart';
import 'package:login_flow_bloc/presentation/resources/strings_manager.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'dazzy@gmail.com'.ifDebugging,
    );

    final passwordController = useTextEditingController(
      text: 'drinkwater'.ifDebugging,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.login,
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration:  InputDecoration(
                hintText: AppStrings.enterEmail.tr(),
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: passwordController,
              decoration:  InputDecoration(
                hintText: AppStrings.enterPassword.tr(),
              ),
              keyboardAppearance: Brightness.dark,
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AuthBloc>().add(
                      LoginEvent(
                        email: email,
                        password: password,
                      ),
                    );
              },
              child: const Text(
                AppStrings.login,
              ).tr(),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const GoToRegistrationEvent(),
                    );
              },
              child: const Text(
                AppStrings.notRegistered,
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
