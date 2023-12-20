import 'dart:convert';

import 'package:app/models/order_state.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_provider.g.dart';

@riverpod
Future<int> cocktailOrder(CocktailOrderRef ref, int menuId) async {
  var res = await http.post(
      Uri.parse("https://cocktailorder-1-l6047017.deta.app/order/$menuId"));
  if (res.statusCode == 422) {
    throw Exception(); //ここにエラー用のモデルを入れる
  }
  var decodedRes = jsonDecode(res.body);

  return Future.value(int.parse(decodedRes["order_id"]));
}

@Riverpod(keepAlive: true)
Future<List<Order>> getOrderList(GetOrderListRef ref) async {
  var res = await http.get(
      Uri.parse("https://cocktailorder-1-l6047017.deta.app/order_log/display"));
  var decodedRes = jsonDecode(res.body);
  var orderList = List.from(decodedRes).map((e) => Order.fromJson(e)).toList();
  return Future.value(orderList);
}

@riverpod
Future<String> notifyCompleteCocktail(
    NotifyCompleteCocktailRef ref, int orderId) async {
  var res = await http.post(Uri.parse(
      "https://cocktailorder-1-l6047017.deta.app/order_log/complete/$orderId"));
  if (res.statusCode == 422) {
    throw Exception(); //ここにエラー用のモデルを入れる
  }
  var decodedRes = jsonDecode(res.body);

  return Future.value(decodedRes["resp"]);
}

@riverpod
Future<String> getOrderState(GetOrderStateRef ref, int orderId) async {
  var res = await http.get(Uri.parse(
      "https://cocktailorder-1-l6047017.deta.app/order_log/status/$orderId"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  return Future.value(decodedRes["status"]);
}
