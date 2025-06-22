import 'package:appointment/components/auth/login_form.dart';
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
          return '/login';
        }
        return null;
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginForm(),
      redirect: (context, state) {
        if (Supabase.instance.client.auth.currentUser != null) {
          return '/';
        }
        return null;
      },
    ),
  ],
);
