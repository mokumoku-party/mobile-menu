import 'dart:async';

import 'package:app/models/order_master_provider.dart';
import 'package:app/models/order_master_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final processingListProvider = StateProvider((ref) => List.empty());
final callingListProvider = StateProvider((ref) => List.empty());

class OrderDisplayPage extends HookConsumerWidget {
  const OrderDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
        ref.refresh(getOrderLogDisplayProvider);
      });
      return () {
        timer.cancel();
      };
    }, const []);
    final processingList = ref.watch(getOrderProcessingProvider);
    final callingList = ref.watch(getOrderCallingProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(176, 37, 45, 66),
      body: Flexible(
        child: Row(
          children: [
            displayListBox("作成中", processingList),
            displayListBox("お呼び出し中", callingList),
          ],
        ),
      ),
    );
  }
}

class displayListBox extends HookConsumerWidget {
  final title;
  final AsyncValue<List<OrderMasterState>> list;

  const displayListBox(
    this.title,
    this.list, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x61FFF0D9),
          borderRadius: BorderRadius.circular(16),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2 - 48,
        child: Column(children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 48, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          ...list.when(data: (data) {
            return data.map((e) => Text(
                  "注文番号：${e.orderId}",
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ));
          }, error: (_, __) {
            return [const SizedBox.shrink()];
          }, loading: () {
            return [const SizedBox.shrink()];
          })
        ]),
      ),
    );
  }
}
