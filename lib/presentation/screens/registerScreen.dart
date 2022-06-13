import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:login_flow_bloc/app/extensions.dart';
import 'package:login_flow_bloc/bloc/auth/auth_bloc.dart';
import 'package:login_flow_bloc/presentation/resources/strings_manager.dart';
import 'package:login_flow_bloc/presentation/widgets/bottomsheet/languages.dart';

class RegisterView extends HookWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'dazzy@gmail.com'.ifDebugging,
    );

    final passwordController = useTextEditingController(
      text: 'drinkwater'.ifDebugging,
    );

    final nameController = useTextEditingController(
      text: 'Ronald'.ifDebugging,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.register,
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: AppStrings.enterEmail.tr(),
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: AppStrings.enterName.tr(),
              ),
              keyboardType: TextInputType.name,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: AppStrings.enterPassword.tr(),
              ),
              keyboardAppearance: Brightness.dark,
              obscureText: true,
            ),
            TextButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                final name = nameController.text;
                context.read<AuthBloc>().add(
                      SignUpEvent(
                        email: email,
                        name: name,
                        password: password,
                      ),
                    );
              },
              child: const Text(
                AppStrings.register,
              ).tr(),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const GoToLoginEvent(),
                    );
              },
              child: const Text(
                AppStrings.alreadyRegistered,
              ).tr(),
            ),
            TextButton(
              onPressed: () => changeLanguage(context),
              child: const Text(AppStrings.changeLanguage).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
