import 'dart:async';

import 'package:app/models/order_master_provider.dart';
import 'package:app/models/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MasterPage extends HookConsumerWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          Flexible(
            child: SizedBox(
              width: width * .35,
              child: const _WaitingList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaitingList extends HookConsumerWidget {
  const _WaitingList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logState = ref.watch(getOrderLogDisplayProvider);

    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 10),
        (timer) => ref.refresh(getOrderLogDisplayProvider.future),
      );

      return timer.cancel;
    }, const []);

    return logState.when(
      data: (state) {
        final filteredState = state
            .where((element) => element.status == Status.processing)
            .toList();

        return ListView.builder(
          itemCount: filteredState.length,
          itemBuilder: (BuildContext context, int index) {
            final item = filteredState[index];

            return Card(
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Text(item.menuName, style: const TextStyle(fontSize: 32)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 4),
                      child: GestureDetector(
                        onDoubleTap: () async {
                          final id = int.parse(item.orderId);

                          await ref
                              .refresh(putOrderLogToCallingProvider(id).future);
                          await ref.refresh(getOrderLogDisplayProvider.future);
                        },
                        child: Text(
                          item.orderId,
                          style: const TextStyle(fontSize: 48),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (_, __) => const Text('エラー'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
