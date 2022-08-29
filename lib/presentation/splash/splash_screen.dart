import 'package:basic_auth_challenge/presentation/auth/auth_cubit.dart';
import 'package:basic_auth_challenge/presentation/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {},
      child: _body(),
    );
  }

  Widget _body() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.fill),
      ),
    );
  }
}
