class Rfq {
  final String id;
  final String requesterId;
  final String company;
  final List<RfqItem> items;
  final String status;
  final String preferredDelivery;
  final String notes;
  final List<String> attachments;
  final DateTime createdAt;
  final List<RfqResponse> responses;

  Rfq({
    required this.id,
    required this.requesterId,
    required this.company,
    required this.items,
    required this.status,
    required this.preferredDelivery,
    required this.notes,
    required this.attachments,
    required this.createdAt,
    required this.responses,
  });
}

class RfqItem {
  final String productId;
  final int qty;
  final String unit;

  RfqItem({
    required this.productId,
    required this.qty,
    required this.unit,
  });
}

class RfqResponse {
  final String vendor;
  final double price;
  final String currency;
  final int leadTimeDays;
  final String comment;

  RfqResponse({
    required this.vendor,
    required this.price,
    required this.currency,
    required this.leadTimeDays,
    required this.comment,
  });
}