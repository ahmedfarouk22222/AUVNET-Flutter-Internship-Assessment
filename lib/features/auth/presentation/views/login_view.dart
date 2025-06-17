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
// باقي الـ imports

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading) {
              // ممكن تستخدم مؤشر تحميل هنا
            } else if (state.isSuccess) {
              // مثال على الانتقال:
              GoRouter.of(context).go(AppRouter.kHomeView);
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AuthViewImage(),
                CustomeTextField(
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xffB4B4B4),
                  ),
                  hint: 'Email',
                  onChanged: (value) => emailController.text = value,
                ),
                const SizedBox(height: 18),
                CustomeTextField(
                  icon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xffB4B4B4),
                  ),
                  obsecure: true,
                  hint: 'Password',
                  onChanged: (value) => passwordController.text = value,
                ),
                const SizedBox(height: 25),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        title: 'Log in',
                        ontap: () {
                          context.read<AuthBloc>().add(
                            LoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                      ),
                const SizedBox(height: 10),
                CustomTextButton(
                  onpressed: () {
                    GoRouter.of(context).push(AppRouter.kRegesterView);
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
