// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:convert';

import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_history_state.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/order_provider.dart';
import 'package:app/pages/detail_modal.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sidebarProvider = StateProvider((ref) => SidebarType.cocktail);
final orderButtonProvider = StateProvider((ref) => OrderButtonType.before);
final orderNumProvider = StateProvider<int>((ref) => 0);

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
final _validSecretMenuProvider = StateProvider((ref) => false);

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollAmount = ref.watch(scrollProvider);

    // TODO: ここにポーリング処理をかく
    final orderId = ref.watch(orderNumProvider);

    useEffect(() {
      Future.microtask(() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var orderId = prefs.getInt("nowOrderId") ?? 0;
        ref.read(orderNumProvider.notifier).state = orderId;
      });
      if (orderId == 0) {
        return () {};
      }
      final timer = Timer.periodic(Duration(seconds: 10), (timer) async {
        final res = await ref.read(getOrderStateProvider(orderId).future);
        print("ポーリング中");

        if (res == "calling") {
          timer.cancel();

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          var json = prefs.getString("nowOrderMenu") ?? "";
          final orderHistory = OrderHistory.fromJson(jsonDecode(json));

          await showDialog(
            context: context,
            builder: (context) => CompleteDialog(orderHistory: orderHistory),
          );
          ref.read(orderNumProvider.notifier).state = 0;

          Future.microtask(() async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setInt("nowOrderId", 0);
          });
        }
      });

      return () {
        timer.cancel();
      };
    }, [orderId]);

    return Container(
      color: rb[1 - scrollAmount],
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: _Body(),
      ),
    );
  }
}

class CompleteDialog extends HookConsumerWidget {
  final orderHistory;

  const CompleteDialog({
    super.key,
    required this.orderHistory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(24),
        child: SizedBox(
          width: 300,
          height: 451,
          child: Column(
            children: [
              Text(
                "できました",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF404040),
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.all(24),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(orderHistory.imageUrl)),
                  ),
                ),
              ),
              Text(
                "注文番号：${orderHistory.orderId}",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF404040),
                    fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 24),
                child: Text(
                  orderHistory.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF404040)),
                ),
              ),
              FilledButton(
                  onPressed: () {
                    ref.watch(
                        notifyCompleteCocktailProvider(orderHistory.orderId));
                    Navigator.of(context).pop();
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF77C17A)),
                  child: Text("受け取りを完了する"))
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                height: 61,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Row(
                  children: const [
                    Text(
                      "var foo = Bar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:
                          Icon(Icons.nightlife, color: Colors.white, size: 32),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: _OrderDisplay(),
            ),
          ],
        ),
        Container(height: 35),
        const Flexible(child: _MainContent())
      ],
    );
  }
}

class _OrderDisplay extends ConsumerWidget {
  const _OrderDisplay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderId = ref.watch(orderNumProvider);

    if (orderId == 0) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
        color: Color.fromARGB(176, 37, 45, 66),
      ),
      child: Text(
        '準備中\n$orderId番',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _MainContent extends HookConsumerWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(sidebarProvider);
    Widget widget = switch (type) {
      SidebarType.cocktail => const _OrderMenuList(),
      SidebarType.otherDrink => const _SelfMenuList(),
      SidebarType.orderHistory => const OrderHistoryLog(),
      SidebarType.secret => const _SecretMenuList(),
    };
    return Row(
      children: [const _Sidebar(), Expanded(child: widget)],
    );
  }
}

class _SecretMenuList extends HookConsumerWidget {
  const _SecretMenuList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(getSecretMenuProvider);

    return SingleChildScrollView(
      child: Center(
        child: menuState.when(
          data: (menuList) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children: menuList.map((e) => OrderMenuItem(e)).toList(),
                ),
              ),
            ],
          ),
          error: (e, _) => throw e,
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _OrderMenuList extends HookConsumerWidget {
  const _OrderMenuList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderMenuState = ref.watch(getOrderMenuProvider);

    final height = MediaQuery.of(context).size.height;

    final controller = useScrollController();
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
          child: orderMenuState.when(
        data: (menuList) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 8,
                children: menuList.map((e) => OrderMenuItem(e)).toList(),
              ),
            ),
            SizedBox(height: height * 2),
            Container(
              padding: EdgeInsets.all(8),
              child: FilledButton(
                onPressed: () {
                  ref.read(_validSecretMenuProvider.notifier).state = true;
                },
                child: Text('裏メニューを表示'),
              ),
            ),
          ],
        ),
        error: (e, _) => throw e,
        loading: () => CircularProgressIndicator(),
      )),
    );
  }
}

class _SelfMenuList extends HookConsumerWidget {
  const _SelfMenuList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selfMenuState = ref.watch(getSelfMenuProvider);

    return SingleChildScrollView(
      child: Center(
        child: selfMenuState.when(
          data: (menuList) {
            return Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: menuList
                  .map((e) => MenuItem(e.name, e.imageUrl, e.alcPercent))
                  .toList(),
            );
          },
          error: (e, _) => throw e,
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class OrderHistoryLog extends HookConsumerWidget {
  const OrderHistoryLog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var orderHistoryList = ref.watch(getOrderHistoryProvider);
    final orderNum = ref.watch(orderNumProvider);
    return orderHistoryList.when(
        data: (data) {
          final dummy =
              OrderHistory(orderId: -1, name: "None", imageUrl: "None");
          final orderHistory = data
              .firstWhere((element) => element.orderId == orderNum, orElse: () {
            return dummy;
          });
          return Column(
            children: [
              if (orderHistory != dummy) ...[
                Container(
                  child: Text(
                    "準備中",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                OrderHistoryItem(orderHistory),
              ],
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "完了",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: data
                          .where((e) => e != orderHistory)
                          .map((e) => OrderHistoryItem(e))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (_, __) => SizedBox.shrink(),
        loading: () => CircularProgressIndicator());
  }
}

class OrderHistoryItem extends StatelessWidget {
  final OrderHistory orderHistory;

  const OrderHistoryItem(
    this.orderHistory, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0x61FFF0D9),
        ),
        height: 80,
        width: 288,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 70,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(orderHistory.imageUrl)),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  orderHistory.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  "注文番号：${orderHistory.orderId}",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderMenuItem extends HookConsumerWidget {
  final OrderMenu orderMenu;
  const OrderMenuItem(this.orderMenu, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(orderButtonProvider.notifier).state = OrderButtonType.before;

        showDetailModal(context, orderMenu);
      },
      child: MenuItem(
        orderMenu.name,
        orderMenu.imageUrl,
        orderMenu.alcPercent.truncate(),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(this.name, this.imageUrl, this.alcPercent, {super.key});

  final String name;
  final String imageUrl;
  final int alcPercent;

  @override
  Widget build(BuildContext context) {
    final badgeColor = switch (alcPercent) {
      == 0 => Color(0xFF26D1DC),
      <= 10 => Color(0xFF93BD19),
      <= 20 => Color(0xFFEFBA00),
      _ => Color(0xFFF5781E),
    };

    return Container(
      width: 136,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(.2),
        border: Border.all(width: 1, color: Colors.white.withOpacity(.05)),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 112,
            height: 112,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding:
                        EdgeInsets.only(right: 8, left: 4, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topRight: Radius.circular(16)),
                      color: badgeColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_bar,
                          size: 12,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '$alcPercent%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              child: AutoSizeText(
                name,
                maxLines: 2,
                minFontSize: 10,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Sidebar extends HookConsumerWidget {
  const _Sidebar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidSecret = ref.watch(_validSecretMenuProvider);

    final controller =
        useAnimationController(duration: Duration(milliseconds: 5000))
          ..repeat();

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
              'オーダー',
              SidebarType.cocktail,
              onTap: () async {
                ref.read(sidebarProvider.notifier).state = SidebarType.cocktail;
              },
            ),
            SidebarButton(
              "セルフ",
              SidebarType.otherDrink,
              onTap: () async {
                ref.read(sidebarProvider.notifier).state =
                    SidebarType.otherDrink;
              },
            ),
            SidebarButton(
              "注文履歴",
              SidebarType.orderHistory,
              onTap: () {
                ref.read(sidebarProvider.notifier).state =
                    SidebarType.orderHistory;
              },
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.easeInOutExpo,
              opacity: isValidSecret ? 1 : 0,
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    HSVColor.fromAHSV(1, 360 * controller.value, .8, 1)
                        .toColor(),
                    BlendMode.modulate,
                  ),
                  child: child,
                ),
                child: SidebarButton(
                  "裏メニュー",
                  SidebarType.secret,
                  onTap: () {
                    ref.read(sidebarProvider.notifier).state =
                        SidebarType.secret;
                  },
                ),
              ),
            )
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
    final isEnable = ref.watch(sidebarProvider) == type;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        constraints: BoxConstraints(minHeight: 80),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: onTap,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            if (isEnable)
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

enum SidebarType { cocktail, otherDrink, orderHistory, secret }

enum OrderButtonType { before, processing, done }
