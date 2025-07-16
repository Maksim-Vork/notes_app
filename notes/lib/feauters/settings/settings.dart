import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_bloc.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_event.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutAuthEvent());
                },
                child: Text('Выйти с акаунта')),
          )
        ],
      ),
    );
  }
}
