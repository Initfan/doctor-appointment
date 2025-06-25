import 'dart:async';

import 'package:appointment/components/term_policies.dart';
import 'package:appointment/pages.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class PhoneOtp extends StatefulWidget {
  const PhoneOtp({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<PhoneOtp> createState() => _PhoneOtpState();
}

class _PhoneOtpState extends State<PhoneOtp> {
  final formKey = GlobalKey<ShadFormState>();
  int _seconds = 60;
  late String _inputedToken;
  final String _invalidCode = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneMinute = Duration(seconds: 1);
    _timer = Timer.periodic(oneMinute, (timer) {
      setState(() => _seconds > 0 ? _seconds-- : null);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void resendCode() async {
    await Supabase.instance.client.auth.signInWithOtp(
      phone: widget.phoneNumber,
    );
    setState(() => _seconds = 60);
  }

  Future<void> validateAccessToken() async {
    try {
      final response = await Supabase.instance.client.auth.verifyOTP(
        type: OtpType.sms,
        phone: widget.phoneNumber,
        token: _inputedToken,
      );

      if (response.session == null || response.user == null) {
        throw Exception("OTP verification failed.");
      }

      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pages()),
      );
    } catch (e) {
      // Print to debug console
      debugPrint('OTP verification failed: $e');

      // Optional: show a toast/snackbar to the user
      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: Text('Verification Failed'),
          description: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var shadcn = ShadTheme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  Text("Send OTP Code", style: shadcn.textTheme.h3),
                  SizedBox(height: 20),
                  Text(
                    "Enter the 6-digit that we have sent via the\n phone number to ${widget.phoneNumber}",
                    style: shadcn.textTheme.muted,
                  ),
                  if (_invalidCode.trim().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ShadAlert.destructive(
                        iconData: LucideIcons.circleAlert,
                        title: Text('Invalid Code'),
                      ),
                    ),
                  SizedBox(height: 40),
                  ShadInputOTP(
                    onChanged: (v) {
                      setState(() => _inputedToken = v);
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    children: const [
                      ShadInputOTPGroup(
                        children: [
                          ShadInputOTPSlot(),
                          ShadInputOTPSlot(),
                          ShadInputOTPSlot(),
                        ],
                      ),
                      Icon(size: 24, LucideIcons.dot),
                      ShadInputOTPGroup(
                        children: [
                          ShadInputOTPSlot(),
                          ShadInputOTPSlot(),
                          ShadInputOTPSlot(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined),
                      SizedBox(width: 5),
                      Text("$_seconds"),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ShadButton.secondary(
                          width: double.maxFinite,
                          onPressed: resendCode,
                          enabled: _seconds > 0 ? false : true,
                          child: Text("Resecond Code"),
                        ),
                        SizedBox(height: 15),
                        ShadButton(
                          width: double.maxFinite,
                          backgroundColor: Colors.blue,
                          onPressed: validateAccessToken,
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
