import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInFormUsername extends ViewModelWidget<SignInViewModel> {
  const SignInFormUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SignInViewModel viewModel) {
    return TextFormField(
      controller: viewModel.usernameController,
      validator: viewModel.usernameValidator,
      decoration: const InputDecoration(
        hintText: 'Username',
      ),
    );
  }
}
