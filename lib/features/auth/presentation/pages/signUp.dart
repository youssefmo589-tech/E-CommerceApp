import 'package:ecommerce/Widgets/ButtonWidget.dart';
import 'package:ecommerce/Widgets/TextFieldWidget.dart';
import 'package:ecommerce/core/Services/BotToastservice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/AppRoutes/AppRoutesName/AppRouteName.dart';
import '../../../../core/Theme/AppColors/AppColors.dart';
import '../../../../core/gen/assets.gen.dart';
import '../Models/UserModel.dart';
import '../manager/AuthBloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool ishiddenpassword = false;

  bool ishiddenconfirmpassword = false;

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocListener(
      listener: (context, state) {
        if (state is LoadingState) {
          EasyLoading.show();
        }
        if (state is ErrorState) {
          EasyLoading.dismiss();
          AppSnackBar.error("something went wrong or this account is exist");
        }
        if (state is SuccessState) {
          EasyLoading.dismiss();
          AppSnackBar.success("account created successfully");
          Navigator.pushNamed(context, AppRouteName.login);
        }
      },
      child: SingleChildScrollView(
        child: Scaffold(
          body: Column(
            spacing: 16,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.darkpurple, AppColors.lightpurple],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Create your Account",
                    style: theme.titleLarge?.copyWith(
                      color: AppColors.whiteapp,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              Column(
                spacing: 16,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          hinttext: "enter your name",
                          prefixIcon: Icon(
                            Icons.person,
                            size: 24,
                            color: AppColors.lightgrey,
                          ),
                          controller: nameController,
                        ),
                        TextFieldWidget(
                          hinttext: "enter your email",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 24,
                            color: AppColors.lightgrey,
                          ),
                          controller: emailController,
                          validator: (value) {
                            RegExp reg = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (value == null || value.isEmpty) {
                              return "please enter your email";
                            } else if (!reg.hasMatch(value)) {
                              return "please enter valid email";
                            }
                            return null;
                          },
                        ),
                        TextFieldWidget(
                          hinttext: "enter your password",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 24,
                            color: AppColors.lightgrey,
                          ),
                          controller: passwordController,
                          obsecuretext: ishiddenpassword,
                          suffixIcon: ishiddenpassword
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  size: 24,
                                  color: AppColors.lightgrey,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  size: 24,
                                  color: AppColors.lightgrey,
                                ),

                          validator: (value) {
                            RegExp reg = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                            );
                            if (value == null || value.isEmpty) {
                              return "please enter your password";
                            } else if (!reg.hasMatch(value)) {
                              return "please enter valid password";
                            } else if (value.length < 8) {
                              return "password must be at least 8 characters";
                            }
                            return null;
                          },
                        ),

                        TextFieldWidget(
                          hinttext: "confirm your password",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 24,
                            color: AppColors.lightgrey,
                          ),
                          controller: confirmpasswordController,
                          obsecuretext: ishiddenconfirmpassword,
                          suffixIcon: ishiddenconfirmpassword
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  size: 24,
                                  color: AppColors.lightgrey,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  size: 24,
                                  color: AppColors.lightgrey,
                                ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter your password";
                            } else if (value != passwordController.text) {
                              return "password does not match";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserModel(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        context.read<AuthBloc>().add(SignUpEvent(user: user));
                      }
                    },
                    child: ButtonWidget(title: "Sign Up"),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: theme.titleLarge?.copyWith(
                              fontSize: 16,
                              color: AppColors.darkgrey,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouteName.login,
                                );
                              },
                            text: "Login",
                            style: theme.titleLarge?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.darkpurple,
                              fontSize: 18,
                              color: AppColors.darkpurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        side: BorderSide(
                          color: AppColors.darkpurple,
                          width: 1.5,
                        ),
                      ),
                      onPressed: () async {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Assets.images.google.image(),
                            ),

                            SizedBox(width: 16),

                            Text(
                              "signUp with google",
                              style: theme.titleMedium?.copyWith(
                                fontSize: 17,
                                color: AppColors.darkpurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
