import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Page'),
          ShadButton(
            child: Text("Logout"),
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
              context.go('/login');
            },
          ),
        ],
      ),
    );
  }
}
