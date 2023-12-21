import 'package:app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xFF182634)),
      routerConfig: appRouter,
    );
  }
}
