import 'package:smarttoil/src/domain/entities/order.dart';

class OrderModel {
  final String id;
  final String customer;
  final String customerId;
  final String status;
  final double total;
  final String currency;
  final List<OrderItemModel> items;
  final ShippingInfoModel shipping;
  final DateTime date;
  final String notes;

  OrderModel({
    required this.id,
    required this.customer,
    required this.customerId,
    required this.status,
    required this.total,
    required this.currency,
    required this.items,
    required this.shipping,
    required this.date,
    required this.notes,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      customer: json['customer'],
      customerId: json['customerId'],
      status: json['status'],
      total: (json['total'] as num).toDouble(),
      currency: json['currency'],
      items: (json['items'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
      shipping: ShippingInfoModel.fromJson(json['shipping']),
      date: DateTime.parse(json['date']),
      notes: json['notes'],
    );
  }

  Order toEntity() {
    return Order(
      id: id,
      customer: customer,
      customerId: customerId,
      status: status,
      total: total,
      currency: currency,
      items: items.map((e) => e.toEntity()).toList(),
      shipping: shipping.toEntity(),
      date: date,
      notes: notes,
    );
  }
}

class OrderItemModel {
  final String productId;
  final int qty;
  final double unitPrice;

  OrderItemModel({
    required this.productId,
    required this.qty,
    required this.unitPrice,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId'],
      qty: json['qty'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );
  }

  OrderItem toEntity() {
    return OrderItem(
      productId: productId,
      qty: qty,
      unitPrice: unitPrice,
    );
  }
}

class ShippingInfoModel {
  final String method;
  final String port;
  final String eta;

  ShippingInfoModel({
    required this.method,
    required this.port,
    required this.eta,
  });

  factory ShippingInfoModel.fromJson(Map<String, dynamic> json) {
    return ShippingInfoModel(
      method: json['method'],
      port: json['port'],
      eta: json['eta'],
    );
  }

  ShippingInfo toEntity() {
    return ShippingInfo(
      method: method,
      port: port,
      eta: eta,
    );
  }
}