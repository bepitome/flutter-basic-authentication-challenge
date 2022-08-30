import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/teammates/teammates_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TeammateDataTable extends ViewModelWidget<TeammatesViewModel> {
  final User teammate;

  const TeammateDataTable({
    super.key,
    required this.teammate,
  });

  @override
  Widget build(BuildContext context, TeammatesViewModel viewModel) {
    return DataTable(
      border: TableBorder.all(width: 1.0),
      headingRowColor: MaterialStateProperty.all(
        Colors.black12,
      ),
      columns: const [
        DataColumn(label: Text('Data')),
        DataColumn(label: Text('Value'))
      ],
      rows: [
        DataRow(
          cells: [
            const DataCell(Text('First Name')),
            DataCell(Text(teammate.firstName)),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(Text('Last Name')),
            DataCell(Text(teammate.lastName)),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(Text('Email')),
            DataCell(Text(teammate.email)),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(Text('Username')),
            DataCell(Text(teammate.username)),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(Text('Company')),
            DataCell(Text(teammate.company)),
          ],
        ),
        DataRow(
          cells: [
            const DataCell(Text('Gender')),
            DataCell(Text(teammate.gender)),
          ],
        )
      ],
    );
  }
}
