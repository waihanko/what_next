import 'package:higher_lower/app/constant/routing/app_route.dart';
import 'package:higher_lower/app/core/binding/initial_binding.dart';
import 'package:higher_lower/app/features/auth/signin_screen.dart';
import 'package:higher_lower/app/features/auth/state/forgot_password.dart';
import 'package:higher_lower/app/features/auth/state/signup_screen.dart';
import 'package:higher_lower/app/features/change_language/binding/change_language_binding.dart';
import 'package:higher_lower/app/features/change_language/screen/change_language_screen.dart';
import 'package:higher_lower/app/features/home/binding/home_binding.dart';
import 'package:higher_lower/app/features/home/screens/home_screen.dart';
import 'package:higher_lower/app/features/profile/binding/profile_binding.dart';
import 'package:higher_lower/app/features/profile/screens/profile_screen.dart';
import 'package:higher_lower/app/features/sample_feature/binding/sample_binding.dart';
import 'package:higher_lower/app/features/sample_feature/screens/game_play_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signInScreen;

  static final pages = [
    GetPage(
      name: initial,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeBinding(), InitialBinding()],
    ),
    GetPage(
      name: Routes.gamePlayScreen,
      page: () => GamePlayScreen(),
      bindings: [GamePlayBinding(), ],
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      bindings: [ProfileBinding()],
    ),
    GetPage(
      name: Routes.changeLanguageScreen,
      page: () => ChangeLanguageScreen(),
      bindings: [ChangeLanguageBinding()],
    ),
  ];
}
