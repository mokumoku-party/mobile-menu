import 'dart:js_util';

import 'package:app/models/cocktail_provider.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/routes/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<OrderMenu> orderMenuList = new List.empty();

bool cocktailTaped = true;
bool otherDrinkTaped = false;
bool otherTaped = false;

List<String> menuList = [
  "hoge",
  "fuga",
  "piyo",
  "ジントニック",
  "マンハッタン",
  "モスコミュール",
  "テキーラサンライズ"
];

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state_2 = ref.watch(getSelfMenuProvider);
    // state_2.when(data: (data) {print(data);}, error: (object,trace) {print("stack trace"); print(object);print(trace);}, loading: () {});
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/background.jpg')),
        ),
        child: Scaffold(backgroundColor: Colors.transparent, body: _Body()));
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
            padding: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1.0,
              color: Colors.white,
            ))),
            child: Text(
              "var foo = Bar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter"),
            ),
          ),
        ]),
        Container(height: 35),
        Flexible(child: _MainContent())
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_Sidebar(), Expanded(child: _MenuList())],
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: menuList.map((e) => MenuItem(e)).toList(),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  const MenuItem(
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModal(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x47796D8E),
        ),
        width: 150,
        height: 200,
        child: Flexible(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/background.jpg'))),
                  width: 112,
                  height: 112,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ]),
        ),
      ),
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
      decoration: BoxDecoration(
          color: Color(0xFF252D42),
          borderRadius: BorderRadius.only(topRight: Radius.circular(24))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Column(
          children: [
            SidebarButton(
              'カクテル',
            ),
            SidebarButton("その他のドリンク"),
            SidebarButton("その他"),
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends HookConsumerWidget {
  final String title;
  final VoidCallback? onTap;

  const SidebarButton(this.title, {this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
                  width: cocktailTaped ? 4 : 0, color: Colors.white))),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

onTabForCocktail(AutoDisposeFutureProvider provider, WidgetRef ref) {
  ref.watch(provider).when(
      data: (data) {
        orderMenuList = data;
        print(orderMenuList);
      },
      error: (object, trace) {
        print(object);
        print(trace);
      },
      loading: () {});
  otherDrinkTaped = false;
  otherTaped = false;
}

void _showModal(BuildContext context) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 587,
          width: 375,
          color: Colors.black,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/background.jpg'))),
                width: 200,
                height: 200,
              ),
              Text(
                "ジントニック",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                "● Alc. 8%\n● ジン、トニックウォーター、ライム",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Container(
                width: 247,
                child: Text(
                  "ドライジンとトニックウォーターをステアし、ライムかレモンを添えたロングカクテルです。",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Container(
                  height: 48,
                  width: 247,
                  child: FilledButton(onPressed: () {}, child: Text("注文する")))
            ],
          ),
        );
      });
}
