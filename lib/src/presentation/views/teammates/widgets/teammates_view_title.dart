import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/teammates_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TeammatesViewTitle extends ViewModelWidget<TeammatesViewModel> {
  const TeammatesViewTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, TeammatesViewModel viewModel) {
    return const Text(
      'Employees Who Work In My Company',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
