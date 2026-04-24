import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/utils/validators.dart';
import 'package:vocado/core/widgets/buttons/custom_button.dart';
import 'package:vocado/core/widgets/fields/custom_field.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    final emailController = useTextEditingController(
      text: "ahho0od.66@gmail.com",
    );
    final passwordController = useTextEditingController(text: "1234567890");
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                context.hideLoading();
                switch (state) {
                  // Loading state
                  case AuthLoadingState _:
                    context.showLoading();

                  // Success state
                  case AuthSuccessState _:
                    context.go(Routes.taskCreator);

                  // Error state
                  case AuthErrorState _:
                    context.showSnackBar(state.message, isError: true);
                }
              },
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    // App title
                    Text.rich(
                      textAlign: .center,

                      TextSpan(
                        text: "VocaDo\n",
                        style: theme.textTheme.displayLarge,

                        children: <TextSpan>[
                          TextSpan(
                            text: "Your Task Manager",
                            style: theme.textTheme.bodySmall!.merge(
                              TextStyle(
                                fontFamily: "Hurricane",
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(15),

                    // Email field
                    CustomTextField(
                      title: "Email",
                      controller: emailController,
                      hintText: "Email",
                      validator: Validators.validateEmail,
                    ),
                    Gap(20),

                    // Password field
                    CustomTextField(
                      title: "Password",
                      controller: passwordController,
                      hintText: "Password",
                      validator: Validators.validatePassword,
                    ),
                    Gap(20),

                    // Login button
                    CustomButton(
                      title: "Sign in",
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        cubit.getAuthMethod(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
