import 'package:go_router/go_router.dart';
import 'package:lettutor/screens/login_screen/login_screen.dart';
import 'package:lettutor/screens/teachers_list_screen/teachers_list_screen.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: "login",
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: "teachers_list",
      path: '/teachers-list',
      builder: (context, state) => const TeachersListScreen(),
    ),
  ]);
}
