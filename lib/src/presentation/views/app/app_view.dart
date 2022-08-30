import 'package:basic_authentication_flutter_challenge/src/domain/view/view.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/loading_indicator.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/app/app_viewmodel.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/home_view.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/sign_in_view.dart';
import 'package:basic_authentication_flutter_challenge/src/services/app_router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AppView extends View {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      viewModelBuilder: () => AppViewModel(),
      builder: (context, viewModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.routerKey,
          home: viewModel.isLoading
              ? const LoadingIndicator()
              : viewModel.isAuthenticated
                  ? const HomeView()
                  : const SignInView(),
        );
      },
    );
  }
}
