
import 'package:ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce/features/auth/presentation/views/register_view.dart';
import 'package:ecommerce/features/home/presentation/views/home_view.dart';
import 'package:ecommerce/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ecommerce/features/splash/presentations/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/LoginView';
  static const kRegesterView = '/RegisterView';
  static const kOnBoardingView = '/OnboardingView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splashview()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(path: kRegesterView, builder: (context, state) => RegisterView()),

      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
