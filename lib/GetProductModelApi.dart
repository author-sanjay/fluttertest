import 'dart:convert';

import 'package:fluttertest/GetProductModel.dart';

import 'package:http/http.dart' as http;
// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, file_names

class GetProductsapi {
  static Future<List<GetProduct>> getDeals() async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    List _temp = [];
    // print(jsonDecode(res.body));
    for (var i in jsonDecode(res.body)) {
      _temp.add(i);
      // print(i);
    }

    return GetProduct.dealsfromapi(_temp);
  }
}
