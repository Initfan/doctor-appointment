import 'package:appointment/components/auth/login_form.dart';
import 'package:appointment/pages/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(path: '/login', builder: (context, state) => LoginForm()),
  ],
);
