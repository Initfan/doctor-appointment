import 'package:appointment/utils/router.dart';
import 'package:appointment/utils/supabase.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load();
  initializeSupabase();

  runApp(
    ShadApp.router(
      routerConfig: router,
      themeMode: ThemeMode.system,
      darkTheme: ShadThemeData(
        colorScheme: const ShadSlateColorScheme.dark(),
        brightness: Brightness.dark,
      ),
    ),
  );
}
