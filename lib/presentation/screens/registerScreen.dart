import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:login_flow_bloc/app/extensions.dart';
import 'package:login_flow_bloc/bloc/auth_bloc.dart';

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
          'Register',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email here...',
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name here...',
              ),
              keyboardType: TextInputType.name,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password here...',
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
                'Register',
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const GoToLoginEvent(),
                    );
              },
              child: const Text(
                'Already registered? Log in here!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
