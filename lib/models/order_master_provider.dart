import 'dart:convert';

import 'package:app/models/order_master_state.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_master_provider.g.dart';

@riverpod
Future<List<OrderMasterState>> getOrderLogDisplay(
    GetOrderLogDisplayRef ref) async {
  var res = await http.get(
      Uri.parse("https://cocktailorder-1-l6047017.deta.app/order_log/display"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  var list =
      List.from(decodedRes).map((e) => OrderMasterState.fromJson(e)).toList();
  return Future.value(list);
}

@riverpod
Future<void> putOrderLogToCalling(PutOrderLogToCallingRef ref, int id) =>
    http.put(
      Uri.parse(
          "https://cocktailorder-1-l6047017.deta.app/order_log/to_calling/$id"),
    );
