import 'package:basic_authentication_flutter_challenge/src/data/constants/ui_constants.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/large_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/small_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/teammates_viewmodel.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/widgets/teammate_data_table.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TeammatesList extends ViewModelWidget<TeammatesViewModel> {
  const TeammatesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, TeammatesViewModel viewModel) {
    return ListView(
      padding: const EdgeInsets.only(top: kMdSpace),
      shrinkWrap: true,
      children: [
        if (viewModel.teammates == null) ...{
          const Text('Error while loading employees :(')
        } else
          for (int i = 0; i < viewModel.teammates!.length; i++) ...[
            Text(
              '#${i + 1}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SmallSpace(),
            TeammateDataTable(
              teammate: viewModel.teammates![i],
            ),
            const LargeSpace(),
          ],
      ],
    );
  }
}
