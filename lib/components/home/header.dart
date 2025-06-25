import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi ${user.userMetadata?['username'] ?? user.email?.split('@')[0]}!',
              style: shadcn.textTheme.h3,
            ),
            SizedBox(height: 5),
            Text(
              'May you always in a good condition',
              style: shadcn.textTheme.muted,
            ),
          ],
        ),
        ShadButton.secondary(
          child: Icon(Icons.notifications_outlined, size: 20),
        ),
      ],
    );
  }
}
