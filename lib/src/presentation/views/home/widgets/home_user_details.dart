import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/loading_indicator.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/small_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeUserDetails extends ViewModelWidget<HomeViewModel> {
  const HomeUserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final user = viewModel.currentUser;
    return Column(
      children: [
        if (viewModel.isLoading) ...[
          const LoadingIndicator(),
        ] else ...[
          if (viewModel.currentUser == null) ...[
            const Text('Error Loading Details 😥'),
          ] else ...[
            Text('First name: ${user?.firstName}'),
            const SmallSpace(),
            Text('Last name: ${user?.lastName}'),
            const SmallSpace(),
            Text('Email: ${user?.email}'),
            const SmallSpace(),
            Text('Username: ${user?.username}'),
            const SmallSpace(),
            Text('Company: ${user?.company}'),
            const SmallSpace(),
            Text('Gender: ${user?.gender}'),
          ]
        ],
      ],
    );
  }
}
