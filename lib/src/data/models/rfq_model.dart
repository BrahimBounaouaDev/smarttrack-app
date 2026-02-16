import 'package:smarttoil/src/domain/entities/rfq.dart';

class RfqModel {
  final String id;
  final String requesterId;
  final String company;
  final List<RfqItemModel> items;
  final String status;
  final String preferredDelivery;
  final String notes;
  final List<String> attachments;
  final DateTime createdAt;
  final List<RfqResponseModel> responses;

  RfqModel({
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

  factory RfqModel.fromJson(Map<String, dynamic> json) {
    return RfqModel(
      id: json['id'],
      requesterId: json['requesterId'],
      company: json['company'],
      items: (json['items'] as List)
          .map((e) => RfqItemModel.fromJson(e))
          .toList(),
      status: json['status'],
      preferredDelivery: json['preferredDelivery'],
      notes: json['notes'],
      attachments: List<String>.from(json['attachments']),
      createdAt: DateTime.parse(json['createdAt']),
      responses: (json['responses'] as List)
          .map((e) => RfqResponseModel.fromJson(e))
          .toList(),
    );
  }

  Rfq toEntity() {
    return Rfq(
      id: id,
      requesterId: requesterId,
      company: company,
      items: items.map((e) => e.toEntity()).toList(),
      status: status,
      preferredDelivery: preferredDelivery,
      notes: notes,
      attachments: attachments,
      createdAt: createdAt,
      responses: responses.map((e) => e.toEntity()).toList(),
    );
  }
}

class RfqItemModel {
  final String productId;
  final int qty;
  final String unit;

  RfqItemModel({
    required this.productId,
    required this.qty,
    required this.unit,
  });

  factory RfqItemModel.fromJson(Map<String, dynamic> json) {
    return RfqItemModel(
      productId: json['productId'],
      qty: json['qty'],
      unit: json['unit'],
    );
  }

  RfqItem toEntity() {
    return RfqItem(
      productId: productId,
      qty: qty,
      unit: unit,
    );
  }
}

class RfqResponseModel {
  final String vendor;
  final double price;
  final String currency;
  final int leadTimeDays;
  final String comment;

  RfqResponseModel({
    required this.vendor,
    required this.price,
    required this.currency,
    required this.leadTimeDays,
    required this.comment,
  });

  factory RfqResponseModel.fromJson(Map<String, dynamic> json) {
    return RfqResponseModel(
      vendor: json['vendor'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      leadTimeDays: json['leadTimeDays'],
      comment: json['comment'],
    );
  }

  RfqResponse toEntity() {
    return RfqResponse(
      vendor: vendor,
      price: price,
      currency: currency,
      leadTimeDays: leadTimeDays,
      comment: comment,
    );
  }
}