import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_flow_bloc/bloc/auth_bloc.dart';
import 'package:login_flow_bloc/presentation/resources/route_manager.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Screen'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(const LogOutEvent());
              Navigator.of(context).pushReplacementNamed(Routes.authScreen);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
