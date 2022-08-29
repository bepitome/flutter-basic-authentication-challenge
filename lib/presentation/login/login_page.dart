import 'package:basic_auth_challenge/core/di/app_injection.dart';
import 'package:basic_auth_challenge/presentation/login/bloc/login_cubit.dart';
import 'package:basic_auth_challenge/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(loginUseCase: injector()),
      child: const LoginScreen(),
    );
  }
}
