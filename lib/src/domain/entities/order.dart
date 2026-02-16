class Order {
  final String id;
  final String customer;
  final String customerId;
  final String status;
  final double total;
  final String currency;
  final List<OrderItem> items;
  final ShippingInfo shipping;
  final DateTime date;
  final String notes;

  Order({
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
}

class OrderItem {
  final String productId;
  final int qty;
  final double unitPrice;

  OrderItem({
    required this.productId,
    required this.qty,
    required this.unitPrice,
  });
}

class ShippingInfo {
  final String method;
  final String port;
  final String eta;

  ShippingInfo({
    required this.method,
    required this.port,
    required this.eta,
  });
}