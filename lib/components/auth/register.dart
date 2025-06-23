import 'package:appointment/components/auth/phone_register.dart';
import 'package:appointment/components/google_signin.dart';
import 'package:appointment/components/term_policies.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
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
                  Text(
                    "So - Health",
                    style: ShadTheme.of(context).textTheme.h2,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Begin your journey to better health!",
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                  SizedBox(height: 40),
                  ShadButton(
                    width: double.maxFinite,
                    backgroundColor: Colors.blue,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneRegister()),
                    ),
                    child: Text(
                      'Continue with Phone Number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15),
                  GoogleSignin(),
                  SizedBox(height: 15),
                  ShadButton(
                    width: double.maxFinite,
                    backgroundColor: Colors.black,
                    leading: Image.asset(
                      'assets/images/apple_icon.png',
                      color: Colors.white,
                      width: 20,
                    ),
                    child: Text(
                      "Continue with Apple",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
                  child: TermAndPolicies(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
