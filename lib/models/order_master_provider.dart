import 'dart:convert';

import 'package:app/models/manual_ingredient.dart';
import 'package:app/models/order_master_state.dart';
import 'package:app/models/order_state.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_master_provider.g.dart';

@riverpod
Future<List<OrderMasterState>> getOrderLogDisplay(
    GetOrderLogDisplayRef ref) async {
  var res = await http.get(
      Uri.parse("https://cocktailorder-1-l6047017.deta.app/order_log/display"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  final list =
      List.from(decodedRes).map((e) => OrderMasterState.fromJson(e)).toList();

  return Future.value(list);
}

@riverpod
Future<List<OrderMasterState>> getOrderProcessing(
    GetOrderLogDisplayRef ref) async {
  final list = await ref.refresh(getOrderLogDisplayProvider.future);

  return list.where((element) => element.status == Status.processing).toList();
}

@riverpod
Future<List<OrderMasterState>> getOrderCalling(
    GetOrderLogDisplayRef ref) async {
  final list = await ref.refresh(getOrderLogDisplayProvider.future);

  return list.where((element) => element.status == Status.calling).toList();
}

@riverpod
Future<void> putOrderLogToCalling(PutOrderLogToCallingRef ref, int id) =>
    http.put(
      Uri.parse(
          "https://cocktailorder-1-l6047017.deta.app/order_log/to_calling/$id"),
    );

@riverpod
Future<void> postManualOrder(
    PostManualOrderRef ref, Ingredients ingredients) async {
  final res = await http.post(
    Uri.parse("https://cocktailorder-1-l6047017.deta.app/manual_order"),
    headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(ingredients.toJson()),
  );

  final decodedRes = jsonDecode(utf8.decode(res.bodyBytes));

  final id = int.parse(decodedRes['order_id']);
  ref.read(putOrderLogToCallingProvider(id));

  return Future.value();
}
