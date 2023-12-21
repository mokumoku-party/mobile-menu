import 'dart:convert';

import 'package:app/models/ingredient_state.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/self_menu_state.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cocktail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<SelfMenu>> getSelfMenu(GetSelfMenuRef ref) async {
  var res = await http
      .get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/self_menu"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  var selfMenuList =
      List.from(decodedRes).map((e) => SelfMenu.fromJson(e)).toList();
  return Future.value(selfMenuList);
  // return Future.value([SelfMenu( id: 0, name: "", alcPercent: 0)]);
}

@Riverpod(keepAlive: true)
Future<List<OrderMenu>> getOrderMenu(GetOrderMenuRef ref) async {
  var res = await http
      .get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/order_menu"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  var orderMenuList =
      List.from(decodedRes).map((e) => OrderMenu.fromJson(e)).toList();
  return Future.value(orderMenuList);
}

@Riverpod(keepAlive: true)
Future<List<OrderMenu>> getSecretMenu(GetSecretMenuRef ref) async {
  var res = await http
      .get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/secret_menu"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  var menuList =
      List.from(decodedRes).map((e) => OrderMenu.fromJson(e)).toList();
  return Future.value(menuList);
}

@riverpod
Future<OrderMenu> getOneOrderMenu(GetOneOrderMenuRef ref, int menuId) async {
  var res = await http.get(Uri.parse(
      "https://cocktailorder-1-l6047017.deta.app/order_menu/$menuId"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  return Future.value(OrderMenu.fromJson(decodedRes));
}

@riverpod
Future<List<Ingredient>> getIngredientList(GetIngredientListRef ref) async {
  var res = await http.get(
      Uri.parse("https://cocktailorder-1-l6047017.deta.app/ingredient/stock"));
  var decodedRes = jsonDecode(utf8.decode(res.bodyBytes));
  var ingredientList =
      List.from(decodedRes).map((e) => Ingredient.fromJson(e)).toList();
  return Future.value(ingredientList);
}
