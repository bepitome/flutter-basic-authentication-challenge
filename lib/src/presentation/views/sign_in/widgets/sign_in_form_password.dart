import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInFormPassword extends ViewModelWidget<SignInViewModel> {
  const SignInFormPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SignInViewModel viewModel) {
    return TextFormField(
      controller: viewModel.passwordController,
      validator: viewModel.passwordValidator,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }
}
