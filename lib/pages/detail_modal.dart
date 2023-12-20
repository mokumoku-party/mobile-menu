import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/order_provider.dart';
import 'package:app/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void showDetailModal(BuildContext context, OrderMenu orderMenu) {
  final height = MediaQuery.of(context).size.height * .9;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: height, maxWidth: 640),
    backgroundColor: const Color(0xFF182634),
    builder: (BuildContext context) {
      return OrderMenuDetailModal(orderMenu.id);
    },
  );
}

class OrderMenuDetailModal extends HookConsumerWidget {
  final int id;
  const OrderMenuDetailModal(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(getOneOrderMenuProvider(id));
    Widget buttonText = switch (ref.watch(orderButtonProvider)) {
      OrderButtonType.before => const Text(
          "注文する",
          style: TextStyle(
            color: Color(0xFF515151),
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      OrderButtonType.processing => const CircularProgressIndicator(),
      OrderButtonType.done => const Text(
          "注文完了",
          style: TextStyle(
            color: Color(0xFF515151),
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        )
    };
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          child: res.when(
            data: (orderMenu) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 48),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/background.jpg'),
                              ),
                            ),
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 23),
                          child: Text(
                            orderMenu.name,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            "● Alc. ${orderMenu.alcPercent}%\n● ジン、トニックウォーター、ライム",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 24),
                          child: SizedBox(
                            width: 247,
                            child: AutoSizeText(
                              orderMenu.description,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: 247,
                        height: 48,
                        child: FilledButton(
                            onPressed: ref.watch(orderButtonProvider) ==
                                    OrderButtonType.before
                                ? () async {
                                    ref
                                        .read(orderButtonProvider.notifier)
                                        .state = OrderButtonType.processing;
                                    final res = await ref
                                        .read(cocktailOrderProvider(id).future);
                                    ref.read(orderNumProvider.notifier).state =
                                        res;
                                    ref
                                        .read(orderButtonProvider.notifier)
                                        .state = OrderButtonType.done;
                                  }
                                : null,
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: buttonText),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (_, __) {
              return Container();
            },
            loading: () {
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
