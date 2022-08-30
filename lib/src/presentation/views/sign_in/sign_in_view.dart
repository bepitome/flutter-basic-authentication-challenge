import 'package:basic_authentication_flutter_challenge/src/domain/view/view.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/large_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/medium_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/view_scaffold.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/sign_in_viewmodel.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/widgets/sign_in_button.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/widgets/sign_in_form_password.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/widgets/sign_in_form_username.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/sign_in/widgets/sign_in_title.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInView extends View {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, viewModel, child) {
        return ViewScaffold(
          child: Form(
            key: viewModel.formKey,
            child: ListView(
              children: const [
                LargeSpace(),
                SignInTitle(),
                LargeSpace(),
                SignInFormUsername(),
                MediumSpace(),
                SignInFormPassword(),
                LargeSpace(),
                SignInButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
