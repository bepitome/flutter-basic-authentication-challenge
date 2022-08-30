import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/primary_button.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeTeammatesButton extends ViewModelWidget<HomeViewModel> {
  const HomeTeammatesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return PrimaryButton(
      label: 'Who Works In My Company?',
      onPressed: viewModel.onTeammatesButtonPressed,
    );
  }
}
