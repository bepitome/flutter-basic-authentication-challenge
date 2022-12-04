import 'package:basic_authentication_flutter_challenge/screens/LoginScreen.dart';
import 'package:basic_authentication_flutter_challenge/widgets/MyListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/colors.dart';
import '../../model/Auth.dart';
import '../../model/UserModal.dart';
import '../../services/authServices.dart';
import '../../services/userServices.dart';

final userFutureProvider = FutureProvider<User>((ref) async {
  final user = await ref
      .watch(userServicesProvider)
      .getUser(ref.watch(authProvider).id, ref.watch(authProvider).accessToken);

  return user;
});

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userFutureProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: kMainColor,
        body: SafeArea(
          child: Center(
            child: profile.when(
              data: (data)  {
                ref.read(signedInUserStateProvider.notifier).state = data; 
                return Column(
                  children: [
                    MyListTile(
                      title: ('Id'),
                      subtitle: ("${data.id}"),
                    ),
                    MyListTile(
                      title: ('Full Name'),
                      subtitle: ("${data.firstName} ${data.lastName}"),
                    ),
                    MyListTile(
                      title: ('Email'),
                      subtitle: (data.email),
                    ),
                    MyListTile(
                      title: ('Username'),
                      subtitle: (data.username),
                    ),
                    MyListTile(
                      title: ('Company'),
                      subtitle: (data.company),
                    ),
                    MyListTile(
                      title: ('Gender'),
                      subtitle: (data.gender),
                    ),
                  ],
                );
              },
              error: (error, stackTree) => const Text('Error'),
              loading: () => const Hero(
                tag: 'mahmoud',
                child: CircularProgressIndicator(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ));
  }
}
