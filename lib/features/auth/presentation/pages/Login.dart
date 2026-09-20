import 'package:ecommerce/Widgets/ButtonWidget.dart';
import 'package:ecommerce/Widgets/TextFieldWidget.dart';
import 'package:ecommerce/core/Services/BotToastservice.dart';
import 'package:ecommerce/features/auth/presentation/manager/AuthBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/Theme/AppColors/AppColors.dart';
import '../../../../core/gen/assets.gen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ishidden = false;

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingState) {
          EasyLoading.show();
        }
        if (state is SuccessState) {
          EasyLoading.dismiss();
          AppSnackBar.success("Login successes");
        }
        if (state is ErrorState) {
          EasyLoading.dismiss();
          AppSnackBar.error("Login failed");
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
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
                    "E-CommerceApp Login",
                    style: theme.titleLarge?.copyWith(
                      color: AppColors.whiteapp,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to your account",
                      style: theme.titleLarge?.copyWith(
                        color: AppColors.blackapp,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),

                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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

                          SizedBox(height: 16),

                          TextFieldWidget(
                            hinttext: "enter your password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 24,
                              color: AppColors.lightgrey,
                            ),
                            controller: passwordController,
                            suffixIcon: ishidden
                                ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  ishidden = !ishidden;
                                });
                              },
                              child: Icon(
                                Icons.visibility_off_outlined,
                                size: 24,
                                color: AppColors.lightgrey,
                              ),
                            )
                                : GestureDetector(
                              onTap: () {
                                setState(() {
                                  ishidden = !ishidden;
                                });
                              },
                              child: Icon(
                                Icons.visibility_outlined,
                                size: 24,
                                color: AppColors.lightgrey,
                              ),
                            ),
                            obsecuretext: ishidden,
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
                        ],
                      ),
                    ),

                    SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password",
                        style: theme.titleLarge?.copyWith(
                          fontSize: 14,
                          color: AppColors.darkpurple,
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(SignInEvent(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },

                        child: ButtonWidget(title: "Login")),

                    SizedBox(height: 40),

                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: theme.titleLarge?.copyWith(
                                fontSize: 16,
                                color: AppColors.darkgrey,
                              ),
                            ),
                            TextSpan(
                              text: "Signup",
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

                    SizedBox(height: 40),

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
                        onPressed: () async {

                        },
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
                                "login with google",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
