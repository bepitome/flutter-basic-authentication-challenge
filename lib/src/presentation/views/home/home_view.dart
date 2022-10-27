import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/large_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/small_space.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/view_scaffold.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/home_viewmodel.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/widgets/home_logout_button.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/widgets/home_teammates_button.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/widgets/home_title.dart';
import 'package:basic_authentication_flutter_challenge/src/presentation/views/home/widgets/home_user_details.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return ViewScaffold(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HomeTitle(),
                  LargeSpace(),
                  HomeUserDetails(),
                  LargeSpace(),
                  HomeTeammatesButton(),
                  SmallSpace(),
                  HomeLogoutButton(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
