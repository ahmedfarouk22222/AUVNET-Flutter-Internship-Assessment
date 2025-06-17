

import 'package:ecommerce/core/constans/app_colors.dart';
import 'package:ecommerce/core/routes/router.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce/features/auth/presentation/widgets/auth_view_image.dart';
import 'package:ecommerce/features/auth/presentation/widgets/custom_button.dart';
import 'package:ecommerce/features/auth/presentation/widgets/custom_textButton.dart';
import 'package:ecommerce/features/auth/presentation/widgets/custome_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isSuccess) {
              // Navigate to home or login
              GoRouter.of(context).go(AppRouter.kHomeView);
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AuthViewImage(),
                CustomeTextField(
                  icon: const Icon(Icons.email),
                  hint: 'Email',
                  onChanged: (value) => emailController.text = value,
                ),
                const SizedBox(height: 18),
                CustomeTextField(
                  icon: const Icon(Icons.lock),
                  hint: 'Password',
                  onChanged: (value) => passwordController.text = value,
                ),
                const SizedBox(height: 18),
                CustomeTextField(
                  icon: const Icon(Icons.lock),
                  hint: 'Confirm Password',
                  onChanged: (value) => confirmPasswordController.text = value,
                ),
                const SizedBox(height: 25),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        title: 'Sign up',
                        ontap: () {
                          if (passwordController.text != confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Passwords do not match')),
                            );
                            return;
                          }

                          context.read<AuthBloc>().add(
                                RegisterEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                      ),
                const SizedBox(height: 10),
                CustomTextButton(
                  onpressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
