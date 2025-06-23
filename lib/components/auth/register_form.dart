import 'package:appointment/components/auth/register_success.dart';
import 'package:appointment/components/term_policies.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<ShadFormState>();
  bool obscure = true;

  Future<void> userSignUp() async {
    if (formKey.currentState!.saveAndValidate()) {
      var values = formKey.currentState?.value;
      Supabase.instance.client.auth.signUp(
        phone: widget.phoneNumber,
        password: values?['password'],
        email: values?['email'],
        data: {'username': values?['username']},
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterSuccess()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var shadcn = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: ShadForm(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Register", style: shadcn.textTheme.h3),
                          SizedBox(height: 20),
                          Text(
                            "Please enter a form to continue the register",
                            style: shadcn.textTheme.muted,
                          ),
                          SizedBox(height: 40),
                          Column(
                            spacing: 20,
                            children: [
                              ShadInputFormField(
                                id: 'username',
                                label: const Text('Username'),
                                leading: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(LucideIcons.user),
                                ),
                                placeholder: const Text('Enter your Username'),
                                validator: (v) {
                                  if (v.trim().length <= 3) {
                                    return 'Username must be at least 4 length.';
                                  }
                                  return null;
                                },
                              ),
                              ShadInputFormField(
                                id: 'email',
                                label: const Text('Email'),
                                leading: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(LucideIcons.mail),
                                ),
                                placeholder: const Text('Enter your Email'),
                                validator: (v) {
                                  if (!v.contains('@')) {
                                    return 'Invalid email.';
                                  }
                                  return null;
                                },
                              ),
                              ShadInputFormField(
                                id: 'password',
                                label: Text("Password"),
                                placeholder: const Text('Enter your password'),
                                obscureText: obscure,
                                leading: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(LucideIcons.lock),
                                ),
                                validator: (v) {
                                  if (v.length < 6) {
                                    return 'Password must be at least 6 length.';
                                  }
                                  return null;
                                },
                                trailing: ShadButton(
                                  width: 24,
                                  height: 24,
                                  padding: EdgeInsets.zero,
                                  leading: Icon(
                                    obscure
                                        ? LucideIcons.eyeOff
                                        : LucideIcons.eye,
                                  ),
                                  onPressed: () {
                                    setState(() => obscure = !obscure);
                                  },
                                ),
                              ),
                              ShadInputFormField(
                                id: 'confirm_password',
                                label: Text("Confirm password"),
                                placeholder: const Text(
                                  'Confirm your password',
                                ),
                                obscureText: obscure,
                                leading: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(LucideIcons.lock),
                                ),
                                validator: (v) {
                                  if (v.length < 6) {
                                    return 'Password must be at least 6 length.';
                                  } else if (formKey
                                          .currentState
                                          ?.value['password'] !=
                                      v) {
                                    return 'Password is not match';
                                  }
                                  return null;
                                },
                                trailing: ShadButton(
                                  width: 24,
                                  height: 24,
                                  padding: EdgeInsets.zero,
                                  leading: Icon(
                                    obscure
                                        ? LucideIcons.eyeOff
                                        : LucideIcons.eye,
                                  ),
                                  onPressed: () {
                                    setState(() => obscure = !obscure);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShadButton(
              onPressed: userSignUp,
              width: double.maxFinite,
              backgroundColor: Colors.blue,
              enabled: formKey.currentState?.enabled ?? true,
              child: Text("Sign Up", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 30),
            TermAndPolicies(),
          ],
        ),
      ),
    );
  }
}
