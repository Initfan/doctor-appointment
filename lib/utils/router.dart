import 'package:appointment/components/auth/login_form.dart';
import 'package:appointment/components/auth/register.dart';
import 'package:appointment/pages/home.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      redirect: (context, state) {
        if (Supabase.instance.client.auth.currentUser == null) {
          return '/auth/register';
        }
        return null;
      },
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => HomePage(),
      redirect: (context, state) {
        if (Supabase.instance.client.auth.currentUser != null) {
          return '/';
        }
        return null;
      },
      routes: [
        GoRoute(path: '/login', builder: (context, state) => LoginForm()),
        GoRoute(path: '/register', builder: (context, state) => RegisterPage()),
      ],
    ),
  ],
);
