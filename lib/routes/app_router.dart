import 'package:app/pages/home_page.dart';
import 'package:app/pages/master_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/master',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/master',
        builder: (context, state) => const MasterPage(),
      ),
    ],
  ),
);
