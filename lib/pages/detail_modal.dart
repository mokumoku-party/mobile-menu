import 'dart:convert';

import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_history_state.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/order_provider.dart';
import 'package:app/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final idState = useState(id);
    final res = ref.watch(getOneOrderMenuProvider(idState.value));

    final menuListState = ref.watch(getOrderMenuProvider);
    final buttonState = ref.watch(orderButtonProvider);

    Widget buttonText = switch (buttonState) {
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
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 49, 58, 70), Color(0xFF182634)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: res.when(
            data: (orderMenu) {
              final alcText =
                  orderMenu.ingredients.map((e) => e.name).join('、');

              return Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final menuList = menuListState.value;
                                  if (menuList == null) return;

                                  final index = menuList
                                      .asMap()
                                      .entries
                                      .firstWhere(
                                          (mp) => mp.value.id == idState.value)
                                      .key;

                                  final length = menuList.length;
                                  final prevIndex =
                                      (index + length - 1) % length;

                                  idState.value = menuList[prevIndex].id;
                                },
                                iconSize: 40,
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 28),
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: NetworkImage(orderMenu.imageUrl),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final menuList = menuListState.value;
                                  if (menuList == null) return;

                                  final index = menuList
                                      .asMap()
                                      .entries
                                      .firstWhere(
                                          (mp) => mp.value.id == idState.value)
                                      .key;

                                  final nextIndex =
                                      (index + 1) % menuList.length;

                                  idState.value = menuList[nextIndex].id;
                                },
                                iconSize: 40,
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white.withOpacity(.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 23),
                          child: Text(
                            orderMenu.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListView(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                  horizontal: 64,
                                ),
                                child: Text(
                                  "● Alc. ${orderMenu.alcPercent}%\n● $alcText",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 64),
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
                              const SizedBox(height: 150),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: SizedBox(
                        width: 247,
                        height: 48,
                        child: FilledButton(
                          onPressed: ref.watch(orderButtonProvider) ==
                                  OrderButtonType.before
                              ? () async {
                                  ref.read(orderButtonProvider.notifier).state =
                                      OrderButtonType.processing;
                                  final res = await ref
                                      .read(cocktailOrderProvider(id).future);
                                  ref.read(orderNumProvider.notifier).state =
                                      res;
                                  ref.read(orderButtonProvider.notifier).state =
                                      OrderButtonType.done;

                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();

                                  var orderHistoryList =
                                      prefs.getStringList("orderHistory") ?? [];

                                  var orderHistory = OrderHistory(
                                      orderId: res,
                                      name: orderMenu.name,
                                      imageUrl: orderMenu.imageUrl);

                                  orderHistoryList
                                      .add(jsonEncode(orderHistory.toJson()));

                                  prefs.setStringList(
                                      "orderHistory", orderHistoryList);
                                }
                              : null,
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: buttonText,
                        ),
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
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
