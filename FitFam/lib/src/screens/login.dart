import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              SvgPicture.asset(
                GlobalVariables.logoImage,
                width: 80.0,
                height: 80.0,
              ),
              const SizedBox(
                height: 40.0,
              ),
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
                  : const SizedBox(
                      height: 10.0,
                    ),
              CustomButton(
                onPressed: () {
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
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.5),
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      // signInWithGoogle().then((value) {
                      //   if (errorMessage == null || errorMessage!.isEmpty) {
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //         builder: ((context) => HomeScreen()),
                      //       ),
                      //     );
                      //   }
                      // });
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          left: 10.0,
                          top: 0.0,
                          bottom: 0.0,
                          child: SvgPicture.asset(
                            GlobalVariables.googleIcon,
                            width: GlobalVariables.iconSize,
                            height: GlobalVariables.iconSize,
                          ),
                        ),
                        Positioned(
                          child: Text(
                            isLogin
                                ? 'Sign in with Google'
                                : 'Sign up with Google',
                            style: GlobalVariables.textStyle2.copyWith(
                              color: GlobalVariables.fontColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  isLogin
                      ? 'Create an account'
                      : 'Already have an account?',
                  style: GlobalVariables.textStyle2.copyWith(
                    color: GlobalVariables.textFieldColor2,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
