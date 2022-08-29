import 'package:basic_auth_challenge/core/di/app_injection.dart';
import 'package:basic_auth_challenge/core/theme/app_theme.dart';
import 'package:basic_auth_challenge/presentation/auth/auth_cubit.dart';
import 'package:basic_auth_challenge/presentation/login/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'presentation/splash/splash_screen.dart';

class AuthApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;

  const AuthApp({Key? key, required this.navigator}) : super(key: key);

  @override
  State<AuthApp> createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  // stores:--------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(isLoginUseCase: injector()),
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          navigatorKey: widget.navigator,
          debugShowCheckedModeBanner: false,
          title: "Auth Sample",
          theme: AppTheme().lightTheme,
          home: const SplashScreen(),
        ),
      ),
    );
  }

}
