import 'package:basic_auth_challenge/domain/entity/user.dart';
import 'package:basic_auth_challenge/presentation/auth/auth_cubit.dart';
import 'package:basic_auth_challenge/presentation/auth/auth_state.dart';
import 'package:basic_auth_challenge/presentation/home/bloc/home_cubit.dart';
import 'package:basic_auth_challenge/presentation/home/bloc/home_state.dart';
import 'package:basic_auth_challenge/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthorizedState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle(context)),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeErrorState) {
            return ErrorWidget("Failed to load data");
          } else if (state is HomeSuccessState) {
            return _body(state.data);
          } else {
            return const Center(child: Text("Failed to load data"));
          }
        }),
      ),
    );
  }

  Widget _body(List<User> data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[index].getName()),
              const SizedBox(
                height: 4,
              ),
              _dataItemWidget("Email", data[index].email),
              const SizedBox(
                height: 4,
              ),
              _dataItemWidget("Username", data[index].username),
              const SizedBox(
                height: 4,
              ),
              _dataItemWidget("Company", data[index].company),
              const SizedBox(
                height: 4,
              ),
              _dataItemWidget("Gender", data[index].gender),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        },
      ),
    );
  }

  Widget _dataItemWidget(String title, String value) {
    return Row(
      children: [
        Text(title),
        const SizedBox(
          width: 4,
        ),
        const Text(":"),
        const SizedBox(
          width: 4,
        ),
        Text(value),
      ],
    );
  }

  _getTitle(BuildContext context) {
    final state = context.read<AuthCubit>().state;
    if (state is AuthorizedState) {
      return "Hi ${state.userId}";
    } else {
      return "Auth Demo App";
    }
  }
}
