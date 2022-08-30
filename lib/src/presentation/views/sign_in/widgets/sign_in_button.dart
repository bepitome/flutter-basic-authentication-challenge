import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/primary_button.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInButton extends ViewModelWidget<SignInViewModel> {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SignInViewModel viewModel) {
    return PrimaryButton(
      label: 'Sign In',
      onPressed: viewModel.login,
      isLoading: viewModel.isLoading,
    );
  }
}
