// ignore_for_file: prefer_const_constructors
import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/order_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rainbow_color/rainbow_color.dart';

final sidebarProvider = StateProvider((ref) => SidebarType.cocktail);
final orderButtonProvider = StateProvider((ref) => OrderButtonType.before);
final orderNumProvider = StateProvider<String?>((ref) => null);

List<String> menuList = [
  "hoge",
  "fuga",
  "piyo",
  "ジントニック",
  "マンハッタン",
  "モスコミュール",
  "テキーラサンライズ"
];

const colors = [
  Color.fromARGB(190, 5, 46, 70),
  Color(0xbf2b759f),
  Color(0xD963CEDE),
  Color(0xFFe5ae4b),
  Color(0xFFF6A988),
];

final rb = Rainbow(
  spectrum: colors,
);

final scrollProvider = StateProvider((ref) => 0.0);

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state_2 = ref.watch(getSelfMenuProvider);
    // state_2.when(data: (data) {print(data);}, error: (object,trace) {print("stack trace"); print(object);print(trace);}, loading: () {});

    final scrollAmount = ref.watch(scrollProvider);

    return Container(
      color: rb[1 - scrollAmount],
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Container(
            width: 24,
          ),
          Container(
            height: 61,
            width: 284,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1.0,
              color: Colors.white,
            ))),
            child: const Text(
              "var foo = Bar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
              ),
            ),
          ),
        ]),
        Container(height: 35),
        const Flexible(child: _MainContent())
      ],
    );
  }
}

class _MainContent extends HookConsumerWidget {
  const _MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(sidebarProvider);
    Widget widget = switch (type) {
      SidebarType.cocktail => const _OrderMenuList(),
      SidebarType.otherDrink => const _SelfMenuList(),
      SidebarType.other => const _OrderMenuList()
    };
    return Row(
      children: [const _Sidebar(), Expanded(child: widget)],
    );
  }
}

class _OrderMenuList extends HookConsumerWidget {
  const _OrderMenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderMenuState = ref.watch(getOrderMenuProvider);

    return SingleChildScrollView(
      child: Center(
          child: orderMenuState.when(
        data: (menuList) => Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: menuList.map((e) => OrderMenuItem(e.name, e)).toList(),
        ),
        error: (e, _) => throw e,
        loading: () => CircularProgressIndicator(),
      )),
    );
  }
}

class _SelfMenuList extends HookConsumerWidget {
  const _SelfMenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    final selfMenuState = ref.watch(getSelfMenuProvider);

    useEffect(() {
      listener() {
        final amount = controller.offset / controller.position.maxScrollExtent;
        ref.read(scrollProvider.notifier).state = amount;
      }

      controller.addListener(listener);

      return () => controller.removeListener(listener);
    }, const []);

    return SingleChildScrollView(
      controller: controller,
      child: Center(
        child: selfMenuState.when(
          data: (menuList) {
            return Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: menuList.map((e) => MenuItem(e.name)).toList(),
            );
          },
          error: (e, _) => throw e,
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class OrderMenuItem extends StatelessWidget {
  final OrderMenu orderMenu;
  final String name;
  const OrderMenuItem(this.name, this.orderMenu, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModal(context, orderMenu);
      },
      child: MenuItem(name),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
    this.name, {
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(.2),
      ),
      width: 137,
      height: 159,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background.jpg'))),
            width: 112,
            height: 112,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      ]),
    );
  }
}

class _Sidebar extends HookConsumerWidget {
  const _Sidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 39,
      decoration: const BoxDecoration(
          color: Color.fromARGB(176, 37, 45, 66),
          borderRadius: BorderRadius.only(topRight: Radius.circular(24))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Column(
          children: [
            SidebarButton(
              'カクテル',
              SidebarType.cocktail,
              onTap: () async {
                ref.read(sidebarProvider.notifier).state = SidebarType.cocktail;
              },
            ),
            SidebarButton(
              "その他のドリンク",
              SidebarType.otherDrink,
              onTap: () async {
                ref.read(sidebarProvider.notifier).state =
                    SidebarType.otherDrink;
              },
            ),
            SidebarButton(
              "その他",
              SidebarType.other,
              onTap: () {
                ref.read(sidebarProvider.notifier).state = SidebarType.other;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends HookConsumerWidget {
  final String title;
  final VoidCallback? onTap;
  final SidebarType type;

  const SidebarButton(this.title, this.type, {super.key, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          border: ref.watch(sidebarProvider) == type
              ? const Border(right: BorderSide(width: 4, color: Colors.white))
              : null),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

void _showModal(BuildContext context, OrderMenu orderMenu) {
  showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF182634),
      builder: (BuildContext context) {
        return OrderMenuDetailModal(orderMenu.id);
      });
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
    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          child: res.when(
            data: (orderMenu) {
              return ListView(
                controller: scrollController,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 48),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/background.jpg'),
                        ),
                        color: Colors.blue,
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
                      style: TextStyle(
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
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 28),
                    child: SizedBox(
                      width: 247,
                      height: 48,
                      child: FilledButton(
                          onPressed: ref.watch(orderButtonProvider) ==
                                  OrderButtonType.before
                              ? () {
                                  final res =
                                      ref.watch(CocktailOrderProvider(id));
                                  res.when(
                                      data: (data) {
                                        ref
                                            .watch(orderNumProvider.notifier)
                                            .state = data;
                                        ref
                                            .watch(orderButtonProvider.notifier)
                                            .state = OrderButtonType.done;
                                      },
                                      error: (_, __) {},
                                      loading: () {
                                        ref
                                            .read(orderButtonProvider.notifier)
                                            .state = OrderButtonType.processing;
                                      });
                                }
                              : null,
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Text(
                            "注文する",
                            style: TextStyle(
                              color: Color(0xFF515151),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  )
                ],
              );
            },
            error: (_, __) {
              return Container();
            },
            loading: () {
              return SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

enum SidebarType { cocktail, otherDrink, other }

enum OrderButtonType { before, processing, done }
