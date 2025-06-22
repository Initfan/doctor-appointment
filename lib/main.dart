import 'package:appointment/components/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: Builder(
        builder: (context) {
          var shad = ShadTheme.of(context);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Welcome Back", style: shad.textTheme.h2),
                  SizedBox(height: 10),
                  Text(
                    'Please enter a form to login this app.',
                    style: shad.textTheme.muted,
                  ),
                  SizedBox(height: 40),
                  Expanded(child: LoginForm()),
                ],
              ),
            ),
          );
        },
      ),
      themeMode: ThemeMode.system,
      darkTheme: ShadThemeData(
        colorScheme: const ShadSlateColorScheme.dark(),
        brightness: Brightness.dark,
      ),
    );
  }
}
