import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/constant/resources/app_colors.dart';
import 'package:higher_lower/app/constant/routing/app_route.dart';
import 'package:higher_lower/app/core/utils/supabase_helpers.dart';
import 'package:higher_lower/app/features/auth/state/auth_state.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:supabase/supabase.dart' as supabase;
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends AuthState<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final RoundedLoadingButtonController _signInEmailController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _magicLinkController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _githubSignInController =
      RoundedLoadingButtonController();

  String _email = '';
  String _password = '';

  @override
  void onErrorAuthenticating(String message) {
    showMessage(message);
    _githubSignInController.reset();
  }

  Future _onSignInPress(BuildContext context) async {
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      final response = await Supabase.instance.client.auth
          .signIn(email: _email, password: _password);
      if (response.error != null) {
        showMessage(response.error!.message);
        _signInEmailController.reset();
      } else {
        Get.offAndToNamed(Routes.homeScreen);
      }
    } else {
      _signInEmailController.reset();
    }
  }

  Future _onMagicLinkPress(BuildContext context) async {
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      final response = await Supabase.instance.client.auth.signIn(
        email: _email,
        options: supabase.AuthOptions(
          redirectTo: authRedirectUri,
        ),
      );
      if (response.error != null) {
        showMessage(response.error!.message);
        _magicLinkController.reset();
      } else {
        showMessage('Check your email for the login link!');
      }
    } else {
      _magicLinkController.reset();
    }
  }

  void onTapBtnGoogleSignin() async {
    await Supabase.instance.client.auth
        .signInWithProvider(
      Provider.google,
      options: AuthOptions(redirectTo: authRedirectUri),
    )
        .then((response) {
          print("Google Login $response");
      if (response) {
        Get.offAndToNamed(Routes.homeScreen);
      } else {
        showMessage("Error Auth");
        _signInEmailController.reset();
      }
    });
  }

  void onTapBtnFacebookSignin() async {
    await Supabase.instance.client.auth.signInWithProvider(
      Provider.facebook,
      options: AuthOptions(redirectTo: authRedirectUri),
    );
  }

  void showMessage(String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 25.0),
              TextFormField(
                onSaved: (value) => _email = value ?? '',
                validator: (val) => validateEmail(val),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                ),
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                onSaved: (value) => _password = value ?? '',
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 15.0),
              RoundedLoadingButton(
                color: Colors.green,
                controller: _signInEmailController,
                onPressed: () {
                  _onSignInPress(context);
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15.0),
              RoundedLoadingButton(
                color: Colors.green,
                controller: _magicLinkController,
                onPressed: () {
                  _onMagicLinkPress(context);
                },
                child: const Text(
                  'Send magic link',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  onTapBtnGoogleSignin();
                },
                child: const Text(
                  'Login with google',
                  style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  onTapBtnGoogleSignin();
                },
                child: const Text(
                  'Login with facebook',
                  style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 15.0),
              TextButton(
                onPressed: () {
                  stopAuthObserver();
                  Get.toNamed(Routes.forgotPasswordScreen)!
                      .then((value) => startAuthObserver());
                },
                child: const Text("Forgot your password ?"),
              ),
              TextButton(
                onPressed: () {
                  stopAuthObserver();
                  Get.toNamed(Routes.signUpScreen)!
                      .then((value) => startAuthObserver());
                },
                child: const Text("Don’t have an Account ? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
