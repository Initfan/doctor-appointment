import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 400,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/register.png'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("So - Health", style: ShadTheme.of(context).textTheme.h2),
                SizedBox(height: 5),
                Text(
                  "Begin your journey to better health!",
                  style: ShadTheme.of(context).textTheme.muted,
                ),
                SizedBox(height: 40),
                ShadButton(
                  width: double.maxFinite,
                  backgroundColor: Colors.blue,
                  decoration: ShadDecoration(
                    border: ShadBorder.all(radius: BorderRadius.circular(200)),
                  ),
                  child: Text(
                    'Continue with Phone Number',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SupaSocialsAuth(
              socialProviders: [OAuthProvider.google, OAuthProvider.apple],
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
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => context.go('/auth/login'),
              child: Text.rich(
                TextSpan(
                  style: ShadTheme.of(context).textTheme.muted,
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'By Signing and logging in, i accept the apps',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text.rich(
                      style: TextStyle(fontSize: 11, color: Colors.blueAccent),
                      TextSpan(
                        text: 'Terms of Services ',
                        children: [
                          TextSpan(
                            text: 'and ',
                            style: ShadTheme.of(
                              context,
                            ).textTheme.muted.merge(TextStyle(fontSize: 11)),
                          ),
                          TextSpan(text: 'Privacy Policy'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
