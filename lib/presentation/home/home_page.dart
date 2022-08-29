import 'package:basic_auth_challenge/core/di/app_injection.dart';
import 'package:basic_auth_challenge/presentation/home/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(getUsersUseCase: injector())..getUsers(),
      child: const HomeScreen(),
    );
  }
}
