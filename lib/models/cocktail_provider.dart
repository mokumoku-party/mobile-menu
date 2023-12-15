import 'dart:convert';

import 'package:app/models/ingredient_state.dart';
import 'package:app/models/order_menu_state.dart';
import 'package:app/models/self_menu_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'cocktail_provider.g.dart';



@riverpod
Future<List<SelfMenu>> getSelfMenu (GetSelfMenuRef ref) async {
  var res = await http.get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/self_menu"));
  var decodedRes = utf8.decode(res.bodyBytes);
  var a = jsonDecode(decodedRes);
  var selfMenuList = List.from(a).map((e) => SelfMenu.fromJson(e)).toList();
  print(a);
  return Future.value(selfMenuList);
  // return Future.value([SelfMenu( id: 0, name: "", alcPercent: 0)]);
}

@riverpod
Future<List<OrderMenu>> getOrderMenu (GetOrderMenuRef ref) async {
  var res = await http.get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/order_menu"));
  var decodedRes = jsonDecode(res.body);
  var OrderMenuList = List.from(decodedRes).map((e) => OrderMenu.fromJson(e)).toList();
  return Future.value(OrderMenuList);
}

@riverpod
Future<OrderMenu> getOneOrderMenu (GetOneOrderMenuRef ref, int menuId) async {
  var res = await http.get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/order_menu/$menuId"));
  var decodedRes = jsonDecode(res.body);
  return Future.value(OrderMenu.fromJson(decodedRes));
}

@riverpod
Future<List<Ingredient>> getIngredientList (GetIngredientListRef ref) async {
  var res = await http.get(Uri.parse("https://cocktailorder-1-l6047017.deta.app/ingredient/stock"));
  var decodedRes = jsonDecode(res.body);
  var ingredientList = List.from(decodedRes).map((e) => Ingredient.fromJson(e)).toList();
  return Future.value(ingredientList);
}