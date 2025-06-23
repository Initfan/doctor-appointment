import 'package:appointment/components/auth/phone_otp.dart';
import 'package:appointment/components/term_policies.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class PhoneRegister extends StatefulWidget {
  const PhoneRegister({super.key});

  @override
  State<PhoneRegister> createState() => _PhoneRegisterState();
}

class _PhoneRegisterState extends State<PhoneRegister> {
  final formKey = GlobalKey<ShadFormState>();

  Future<void> generateOtp() async {
    if (formKey.currentState!.saveAndValidate()) {
      var phone = formKey.currentState?.value['phone'];
      await Supabase.instance.client.auth.signInWithOtp(phone: "+62$phone");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhoneOtp(phoneNumber: "+62$phone"),
        ),
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
        child: SizedBox.expand(
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
                    "Please enter your number to continue your registration",
                    style: shadcn.textTheme.muted,
                  ),
                  SizedBox(height: 40),
                  ShadInputFormField(
                    id: 'phone',
                    label: const Text('Phone Number'),
                    leading: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.phone),
                    ),
                    placeholder: const Text('e.g 812-1234-5431'),
                    validator: (v) {
                      if (v.length <= 10) {
                        return 'Phone number must be at least 10';
                      } else if (v.startsWith('0', 0)) {
                        return 'Dont use 0 in the first';
                      }
                      return null;
                    },
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ShadButton(
                          onPressed: generateOtp,
                          width: double.maxFinite,
                          backgroundColor: Colors.blue,
                          enabled: formKey.currentState?.enabled ?? true,
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 30),
                        TermAndPolicies(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
