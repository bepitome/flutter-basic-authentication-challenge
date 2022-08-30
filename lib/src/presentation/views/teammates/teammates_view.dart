import 'package:basic_authentication_flutter_challenge/src/domain/view/view.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/loading_indicator.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/small_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/view_scaffold.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/teammates_viewmodel.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/widgets/teammates_list.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/widgets/teammates_view_title.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TeammatesView extends View {
  const TeammatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewScaffold(
      child: ViewModelBuilder<TeammatesViewModel>.reactive(
        viewModelBuilder: () => TeammatesViewModel(),
        builder: (context, viewModel, child) {
          return Column(
            children: [
              const TeammatesViewTitle(),
              const SmallSpace(),
              Expanded(
                child: viewModel.isLoading
                    ? const LoadingIndicator()
                    : const TeammatesList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
