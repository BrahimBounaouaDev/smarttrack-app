import 'package:smarttoil/src/domain/entities/product.dart';

class ProductModel {
  final String id;
  final String name;
  final String code;
  final String unit;
  final double price;
  final String currency;
  final int available;
  final String description;
  final List<String> images;
  final Map<String, dynamic> specs;
  final String supplier;
  final int leadTimeDays;
  final int moq;
  final String category;
  final String location;

  ProductModel({
    required this.id,
    required this.name,
    required this.code,
    required this.unit,
    required this.price,
    required this.currency,
    required this.available,
    required this.description,
    required this.images,
    required this.specs,
    required this.supplier,
    required this.leadTimeDays,
    required this.moq,
    required this.category,
    required this.location,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      unit: json['unit'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      available: json['available'],
      description: json['description'],
      images: List<String>.from(json['images']),
      specs: Map<String, dynamic>.from(json['specs']),
      supplier: json['supplier'],
      leadTimeDays: json['lead_time_days'],
      moq: json['moq'],
      category: json['category'],
      location: json['location'],
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      code: code,
      unit: unit,
      price: price,
      currency: currency,
      available: available,
      description: description,
      images: images,
      specs: specs,
      supplier: supplier,
      leadTimeDays: leadTimeDays,
      moq: moq,
      category: category,
      location: location,
    );
  }
}