// ignore_for_file: unused_result
import 'dart:async';

import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_master_provider.dart';
import 'package:app/models/order_master_state.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/order_provider.dart';
import 'package:app/routes/app_router.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _selectedProvider =
    StateProvider.autoDispose<OrderMasterState?>((ref) => null);

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
                  Flexible(
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
                  Flexible(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('在庫', style: textTheme.displayLarge),
                              ElevatedButton(
                                onPressed: () {
                                  ref.read(appRouterProvider).push('/edit');
                                },
                                child: const Text('編集'),
                              ),
                            ],
                          ),
                        ),
                        const Flexible(child: _Zaiko()),
                      ],
                    ),
                  ),
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

class _Zaiko extends HookConsumerWidget {
  const _Zaiko({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientsState = ref.watch(getIngredientListProvider);

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 10),
        (timer) => ref.invalidate(getIngredientListProvider),
      );

      return timer.cancel;
    }, const []);

    return ingredientsState.when(
      data: (ingredients) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];

              return Container(
                constraints: const BoxConstraints(maxHeight: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(ingredient.name),
                    Text('${ingredient.amount} [${ingredient.unit}]'),
                  ],
                ),
              );
            },
          ),
        );
      },
      error: (_, __) => const Text('エラー'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _Order extends HookConsumerWidget {
  const _Order();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuListState = ref.watch(getAllOrderProvider);
    final scheme = Theme.of(context).colorScheme;

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 10),
        (timer) => ref.invalidate(getAllOrderProvider),
      );

      return timer.cancel;
    }, const []);

    return menuListState.when(
      data: (menuList) {
        return SingleChildScrollView(
          child: Column(
            children: menuList
                .where((e) => e.stock > 0)
                .map(
                  (e) => GestureDetector(
                    onDoubleTap: () {
                      ref.refresh(cocktailOrderProvider(e.id));

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${e.name}を注文しました')));
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
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
          ),
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
    final menuListState = ref.watch(getAllOrderProvider);
    final selected = ref.watch(_selectedProvider);

    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (selected == null) {
      return const Center(child: Text('選択なし'));
    }

    return menuListState.when(
      data: (menuList) {
        final menu =
            menuList.firstWhere((element) => element.name == selected.menuName);

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: AutoSizeText(
                      menu.name,
                      style: textTheme.headlineLarge,
                      wrapWords: false,
                    ),
                  ),
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
                        style:
                            TextStyle(color: scheme.onSecondary, fontSize: 32),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: menu.ingredients
                      .map(
                        (ingredient) => Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                ingredient.name,
                                style: const TextStyle(fontSize: 24),
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              (ingredient.unit == 'any')
                                  ? '適量'
                                  : '${ingredient.amount} [${ingredient.unit}]',
                              style: const TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              )
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
    final logState = ref.watch(getOrderProcessingProvider);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selected = ref.watch(_selectedProvider);

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 10),
        (timer) async {
          await ref.refresh(getOrderLogDisplayProvider.future);
          final orderLog = await ref.read(getOrderProcessingProvider.future);

          if (!orderLog.contains(ref.read(_selectedProvider))) {
            ref.read(_selectedProvider.notifier).state = null;
          }

          final selected = ref.read(_selectedProvider);

          if (selected == null && orderLog.isNotEmpty) {
            ref.read(_selectedProvider.notifier).state = orderLog.first;
          }
        },
      );

      return timer.cancel;
    }, const []);

    return logState.when(
      data: (state) {
        return Column(
          children: [
            Text(
              '注文数 ${state.length}',
              style: textTheme.titleLarge,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = state[index];
                  final isSelected = item.orderId == selected?.orderId;

                  return GestureDetector(
                    onTap: () {
                      ref.read(_selectedProvider.notifier).state = item;
                    },
                    child: Card(
                      shape: isSelected
                          ? RoundedRectangleBorder(
                              side:
                                  BorderSide(color: scheme.secondary, width: 2),
                            )
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
