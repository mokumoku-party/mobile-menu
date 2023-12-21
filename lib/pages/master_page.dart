// ignore_for_file: unused_result
import 'dart:async';

import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_master_provider.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/order_provider.dart';
import 'package:app/models/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _selectedNameProvider = StateProvider.autoDispose((ref) => '');

class MasterPage extends HookConsumerWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SizedBox(
              width: width * .33,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('注文リスト', style: textTheme.displayLarge),
                  ),
                  const Flexible(child: _WaitingList()),
                ],
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: width * .33,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('レシピ', style: textTheme.displayLarge),
                  ),
                  const Flexible(child: _Recipe()),
                ],
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              width: width * .33,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('注文', style: textTheme.displayLarge),
                  ),
                  const Flexible(child: _Order()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Order extends HookConsumerWidget {
  const _Order();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuListState = ref.watch(getOrderMenuProvider);
    final scheme = Theme.of(context).colorScheme;

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 10),
        (timer) => ref.invalidate(getOrderMenuProvider),
      );

      return timer.cancel;
    }, const []);

    return menuListState.when(
      data: (menuList) {
        return Column(
          children: menuList
              .where((e) => e.stock > 0)
              .map(
                (e) => GestureDetector(
                  onDoubleTap: () {
                    ref.refresh(cocktailOrderProvider(e.id));
                  },
                  child: Card(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            e.name,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: scheme.tertiary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${e.stock}',
                              style: TextStyle(color: scheme.onTertiary),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
      error: (_, __) => const Text('エラー'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _Recipe extends HookConsumerWidget {
  const _Recipe();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuListState = ref.watch(getOrderMenuProvider);
    final name = ref.watch(_selectedNameProvider);

    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (name.isEmpty) {
      return const Center(child: Text('選択なし'));
    }

    return menuListState.when(
      data: (menuList) {
        final menu = menuList.firstWhere((element) => element.name == name);

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(menu.name, style: textTheme.headlineLarge),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: scheme.secondary,
                  child: Text(
                    switch (menu.method) {
                      Method.stir => 'ステア',
                      Method.build => 'ビルド',
                      Method.shake => 'シェイク',
                    },
                    style: TextStyle(color: scheme.onSecondary, fontSize: 32),
                  ),
                ),
              ),
              ...menu.ingredients.map(
                (ingredient) => Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ingredient.name,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        (ingredient.unit == 'any')
                            ? '適量'
                            : '${ingredient.amount} [${ingredient.unit}]',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (e, st) {
        return const Text('エラー');
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _WaitingList extends HookConsumerWidget {
  const _WaitingList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logState = ref.watch(getOrderLogDisplayProvider);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selectedId = ref.watch(_selectedNameProvider);

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 10),
        (timer) => ref.invalidate(getOrderLogDisplayProvider),
      );

      return timer.cancel;
    }, const []);

    return logState.when(
      data: (state) {
        final filteredState = state
            .where((element) => element.status == Status.processing)
            .toList();

        return Column(
          children: [
            Text(
              '注文数 ${state.length}',
              style: textTheme.titleLarge,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: filteredState.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = filteredState[index];
                  final isSelected = item.orderId == selectedId;

                  return GestureDetector(
                    onTap: () {
                      ref.read(_selectedNameProvider.notifier).state =
                          item.menuName;
                    },
                    child: Card(
                      shape: isSelected
                          ? RoundedRectangleBorder(
                              side: BorderSide(color: scheme.secondary))
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Text(item.menuName,
                                style: const TextStyle(fontSize: 32)),
                            GestureDetector(
                              onDoubleTap: () {
                                final id = int.parse(item.orderId);

                                ref.refresh(putOrderLogToCallingProvider(id));
                                ref.refresh(getOrderLogDisplayProvider);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$id番呼び出し中')));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: scheme.primary,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.notifications,
                                        size: 32, color: scheme.onPrimary),
                                    Text(
                                      item.orderId,
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: scheme.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (_, __) => const Text('エラー'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
