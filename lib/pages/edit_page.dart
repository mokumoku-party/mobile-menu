// ignore_for_file: unused_result
import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/ingredient_state.dart';
import 'package:app/models/manual_ingredient.dart' as manual;
import 'package:app/models/order_master_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _selected = StateProvider<Ingredient?>((ref) => null);

class EditPage extends HookConsumerWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('編集画面')),
      body: const Row(children: [
        Flexible(child: _Zaiko()),
        Flexible(child: _Editor()),
      ]),
    );
  }
}

class _Editor extends HookConsumerWidget {
  const _Editor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(_selected);
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final controller = useTextEditingController();

    final isMinus = useState(true);

    if (selected == null) {
      return const Center(
        child: Text('選択なし'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(selected.name, style: textTheme.displayLarge),
        ),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filled(
                onPressed: () {
                  isMinus.value = !isMinus.value;
                },
                icon: Icon(
                  isMinus.value ? Icons.remove : Icons.add,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32),
                width: 400,
                child: TextField(
                  controller: controller,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
              Text(
                '[${selected.unit}]',
                style: const TextStyle(fontSize: 32),
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final sign = isMinus.value ? 1 : -1;
            final ingredient = manual.Ingredient(
              ingredientId: selected.id,
              unit: selected.unit,
              amount: sign * double.parse(controller.text),
            );

            await ref.read(postManualOrderProvider(
              manual.Ingredients(ingredients: [ingredient]),
            ).future);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('編集完了しました'),
                ),
              );
            }
          },
          child: const Text(
            '送信',
            style: TextStyle(fontSize: 48),
          ),
        )
      ],
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

    return ingredientsState.when(
      data: (ingredients) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];

              return SizedBox(
                height: 80,
                child: TextButton(
                  onPressed: () {
                    ref.read(_selected.notifier).state = ingredient;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          ingredient.name,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                      Text(
                        '${ingredient.amount} [${ingredient.unit}]',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
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
