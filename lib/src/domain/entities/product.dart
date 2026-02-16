class Product {
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

  Product({
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
}