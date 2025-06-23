import 'dart:async';

import 'package:appointment/components/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  int _seconds = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneMinute = Duration(seconds: 1);
    _timer = Timer.periodic(oneMinute, (timer) {
      print(_seconds);
      if (_seconds == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginForm()),
        );
      }
      setState(() => _seconds > 0 ? _seconds-- : null);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            Image(image: AssetImage('assets/images/success.png')),
            Text(
              "Welcome to So - Health",
              style: ShadTheme.of(context).textTheme.h3,
            ),
          ],
        ),
      ),
    );
  }
}
