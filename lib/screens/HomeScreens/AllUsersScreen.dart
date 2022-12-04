import 'package:basic_authentication_flutter_challenge/model/Auth.dart';
import 'package:basic_authentication_flutter_challenge/services/userServices.dart';
import 'package:basic_authentication_flutter_challenge/widgets/MyListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/colors.dart';
import '../../model/UserModal.dart';

final allUsersFutureProvider = FutureProvider<List<User>>(
  (ref) async {
    return await ref.watch(userServicesProvider).getUsersList(
          ref.watch(authProvider).accessToken,
        );
  },
);

class AllUsersScreen extends ConsumerWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(allUsersFutureProvider);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      backgroundColor: kMainColor,
      body: users.when(
        data: (data) {
          final filteredData = data
              .where((user) =>
                  user.company == ref.watch(signedInUserStateProvider).company)
              .toList();
          return ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              return MyListTile(
                title:
                    ("${filteredData[index].firstName} ${filteredData[index].lastName}"),
                subtitle: (filteredData[index].email),
              );
            },
          );
        },
        error: (error, stackTrace) => const Text("Error"),
        loading: () => const Center(
            child: CircularProgressIndicator(
          color: kWhiteColor,
        )),
      ),
    );
  }
}
