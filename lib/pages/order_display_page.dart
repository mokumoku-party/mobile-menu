import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDisplayPage extends HookConsumerWidget {
  const OrderDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: .5,
            child: Text("作成中"),
          ),
          SizedBox(
            width: .5,
            child: Text("お呼び出し中"),
          )
        ],
      ),
    );
  }
}
