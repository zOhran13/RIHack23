import 'package:fitfam/src/common_widgets/custom_navigationbar.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_text_field.dart';
import '../utils/global_variables.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {}

  Future<void> createUserWithEmailAndPassword() async {}

  Future<void> signInWithGoogle() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.appBarBoxColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogin ? 'Sign in' : 'Sign up',
                style: GlobalVariables.textStyle1
                    .copyWith(color: GlobalVariables.fontColor, fontSize: 22.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                label: 'Email',
                controller: emailController,
                textFieldType: TextFieldType.email,
              ),
              CustomTextField(
                label: 'Password',
                controller: passwordController,
                textFieldType: TextFieldType.password,
              ),
              isLogin
                  ? const SizedBox.shrink()
                  : CustomTextField(
                      label: 'Confirm password',
                      controller: confirmPasswordController,
                      textFieldType: TextFieldType.password,
                    ),
              errorMessage != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        errorMessage!,
                        textAlign: TextAlign.center,
                        style: GlobalVariables.textStyle2.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) => const CustomNavigationBar()),
                    ),
                  );
                  // isLogin
                  //     ? signInWithEmailAndPassword()
                  //     : createUserWithEmailAndPassword().then((value) {
                  //         if (errorMessage == null || errorMessage!.isEmpty) {
                  //           Navigator.of(context).pushReplacement(
                  //             MaterialPageRoute(
                  //               builder: ((context) => HomeScreen()),
                  //             ),
                  //           );
                  //         }
                  //       });
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                    errorMessage = '';
                  });
                },
                child: Text(
                  isLogin ? 'Create an account' : 'Already have an account?',
                  style: GlobalVariables.textStyle2.copyWith(
                    color: GlobalVariables.textFieldColor2,
                    decoration: TextDecoration.underline,
                    decorationColor: GlobalVariables.textFieldColor2,
                  ),
                ),
              ),
              isLogin
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          errorMessage = '';
                        });
                      },
                      child: Text(
                        'Forgotten password?',
                        style: GlobalVariables.textStyle2.copyWith(
                            color: GlobalVariables.textFieldColor2,
                            decoration: TextDecoration.underline,
                            decorationColor: GlobalVariables.textFieldColor2),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
