import 'dart:convert';
import 'package:flutter/services.dart';

import '../../models/product_model.dart';
import '../../models/order_model.dart';
import '../../models/rfq_model.dart';
import '../../models/profile_model.dart';

abstract class LocalDataSource {
  Future<List<ProductModel>> loadProducts();
  Future<List<OrderModel>> loadOrders();
  Future<List<RfqModel>> loadRfqs();
  Future<ProfileModel> loadProfile();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<ProductModel>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/mock2/products.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<List<OrderModel>> loadOrders() async {
    final jsonString = await rootBundle.loadString('assets/mock2/orders.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => OrderModel.fromJson(e)).toList();
  }

  @override
  Future<List<RfqModel>> loadRfqs() async {
    final jsonString = await rootBundle.loadString('assets/mock2/rfqs.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => RfqModel.fromJson(e)).toList();
  }

  @override
  Future<ProfileModel> loadProfile() async {
    final jsonString = await rootBundle.loadString('assets/mock2/profile.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ProfileModel.fromJson(jsonMap);
  }
}