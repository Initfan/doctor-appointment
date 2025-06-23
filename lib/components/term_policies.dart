import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TermAndPolicies extends StatelessWidget {
  const TermAndPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
