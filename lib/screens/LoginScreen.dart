import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:basic_authentication_flutter_challenge/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../model/Auth.dart';
import '../services/authServices.dart';
import '../widgets/MyTextField.dart';
import 'HomeScreen.dart';


final mySnackBar = SnackBar(
    
              
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              
              content: AwesomeSnackbarContent(
                title: 'On Snap!',
                message:
                    'something went wrong, please check your username and password!',
                contentType: ContentType.failure,
                
              ),
            );

final usernameControllerProvider = Provider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

final passwordControllerProvider = Provider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

final authServicesFutureProvider = FutureProvider.autoDispose<Auth>(
  (ref) async {
    return await ref.watch(authServicesProvider).getAuth(
          ref.watch(usernameControllerProvider).text.trim(),
          ref.watch(passwordControllerProvider).text.trim(),
        );
  },
);

final isLoadingStateProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  Future<void> login(context, ref) async {
    try {
      ref.read(isLoadingStateProvider.notifier).state = true;
      Auth auth = await ref.watch(authServicesFutureProvider.future);
      ref.read(authProvider.notifier).state = auth;
      ref.read(isLoadingStateProvider.notifier).state = false;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
      ref.read(isLoadingStateProvider.notifier).state = false;

      ScaffoldMessenger.of(ref.context).showSnackBar(
        mySnackBar
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_CgL682.json',
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        MyTextField(
                          controller: ref.watch(usernameControllerProvider),
                          hintText: 'Enter your username',
                          icon: const Icon(Icons.person),
                        ),
                        MyTextField(
                          controller: ref.watch(passwordControllerProvider),
                          hintText: 'Enter your password',
                          icon: const Icon(Icons.lock),
                          isObscure: true,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: ref.watch(isLoadingStateProvider)
                            ? null
                            : () async {
                                await login(context, ref);
                              },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: kMainColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          child: Center(
                            child: ref.watch(isLoadingStateProvider)
                                ? const Hero(
                                  tag : 'mahmoud' , 
                                  child:  CircularProgressIndicator(
                                      color: kWhiteColor,
                                    ),
                                )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
