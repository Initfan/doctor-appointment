import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<ShadFormState>();

  bool obscure = true;

  Future<void> signInUser(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      GoRouter.of(context).pushReplacement('/');
    } catch (e) {
      if (e is AuthApiException) {
        if (e.code == "invalid_credentials") {
          ShadToaster.of(
            context,
          ).show(ShadToast.destructive(title: Text('Invalid credentials.')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var shad = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back", style: shad.textTheme.h2),
            SizedBox(height: 10),
            Text(
              'Please enter a form to login this app.',
              style: shad.textTheme.muted,
            ),
            SizedBox(height: 40),
            ShadForm(
              key: formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShadInputFormField(
                      id: 'email',
                      label: const Text('Email'),
                      leading: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(LucideIcons.user),
                      ),
                      placeholder: const Text('Enter your Email'),
                      validator: (v) {
                        if (!v.contains('@')) {
                          return 'Invalid email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    ShadInputFormField(
                      id: 'password',
                      placeholder: const Text('Enter your password'),
                      obscureText: obscure,
                      leading: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(LucideIcons.lock),
                      ),
                      trailing: ShadButton(
                        width: 24,
                        height: 24,
                        padding: EdgeInsets.zero,
                        leading: Icon(
                          obscure ? LucideIcons.eyeOff : LucideIcons.eye,
                        ),
                        onPressed: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Passowrd',
                        style: ShadTheme.of(
                          context,
                        ).textTheme.small.copyWith(color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(height: 25),
                    ShadButton(
                      width: double.maxFinite,
                      backgroundColor: Colors.blue,
                      enabled: formKey.currentState?.enabled ?? true,
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.saveAndValidate()) {
                          var value = formKey.currentState!.value;
                          signInUser(value['email'], value['password']);
                        } else {
                          log('validation failed');
                        }
                      },
                    ),
                    ShadSeparator.horizontal(
                      thickness: 4,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      radius: BorderRadius.all(Radius.circular(4)),
                    ),
                    SupaSocialsAuth(
                      socialProviders: [
                        OAuthProvider.google,
                        OAuthProvider.apple,
                      ],
                      colored: true,
                      nativeGoogleAuthConfig: NativeGoogleAuthConfig(
                        webClientId: dotenv.get('WEBCLIENT_ID'),
                        iosClientId: dotenv.get('WEBCLIENT_ID'),
                      ),
                      // redirectUrl: kIsWeb ? null : 'io.mydomain.myapp://callback',
                      onSuccess: (Session response) {
                        print({"user: ", response.user});
                      },
                      onError: (error) {
                        print({"error: ", error});
                      },
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          style: ShadTheme.of(context).textTheme.muted,
                          text: "Don't have account? ",
                          children: [
                            TextSpan(
                              text: "Register",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
