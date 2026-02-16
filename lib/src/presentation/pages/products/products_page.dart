/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:smarttoil/src/presentation/pages/products/products_detail_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Map<String, dynamic>> _products = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProductsFromAsset();
  }

  Future<void> _loadProductsFromAsset() async {
    try {
      final raw = await rootBundle.loadString('assets/mock2/products.json');
      final List<dynamic> parsed = json.decode(raw);
      setState(() {
        _products = parsed.cast<Map<String, dynamic>>();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _products = [];
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF0D0D0D),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Products',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.search, color: Colors.white54)
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Grid of products
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.78,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final p = _products[index];
                          return _ProductCard(
                            product: p,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailPage(product: p),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final name = product['name'] ?? '';
    final price = product['price']?.toString() ?? '';
    final currency = product['currency'] ?? '';
    final available = product['available']?.toString() ?? '';
    final images = (product['images'] as List<dynamic>?)?.cast<String>() ?? [];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFC47A3A).withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8),
                  image: images.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(images.first),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: images.isEmpty
                    ? const Center(child: Icon(Icons.image, color: Colors.white24))
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('$currency $price',
                    style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Stock: $available',
                      style: const TextStyle(color: Colors.green, fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:smarttoil/src/presentation/pages/products/products_detail_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Map<String, dynamic>> _products = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProductsFromAsset();
  }

  Future<void> _loadProductsFromAsset() async {
    try {
      final raw = await rootBundle.loadString('assets/mock2/products.json');
      final List<dynamic> parsed = json.decode(raw);
      setState(() {
        _products = parsed.cast<Map<String, dynamic>>();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _products = [];
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF0D0D0D),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Products',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.search, color: Colors.white54)
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Grid of products
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72, // تعديل النسبة لتتناسب مع المحتوى
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final p = _products[index];
                          return _ProductCard(
                            product: p,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailPage(product: p),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final name = product['name'] ?? '';
    final price = product['price']?.toString() ?? '';
    final currency = product['currency'] ?? '';
    final available = product['available']?.toString() ?? '';
    final images = (product['images'] as List<dynamic>?)?.cast<String>() ?? [];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8), // تقليل الـ padding من 10 إلى 8
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFC47A3A).withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // إضافة هذا لتقليل المساحة
          children: [
            // صورة المنتج
            AspectRatio( // استخدام AspectRatio بدلاً من Expanded
              aspectRatio: 1.1, // تحديد نسبة العرض إلى الارتفاع
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8),
                  image: images.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(images.first),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: images.isEmpty
                    ? const Center(child: Icon(Icons.image, color: Colors.white24))
                    : null,
              ),
            ),
            const SizedBox(height: 6), // تقليل المسافة من 8 إلى 6
            // اسم المنتج
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold,
                fontSize: 13, // تصغير الخط قليلاً
              ),
            ),
            const SizedBox(height: 3), // تقليل المسافة من 4 إلى 3
            // السعر والمخزون
            Row(
              children: [
                Expanded( // استخدام Expanded لمنع التجاوز
                  child: Text(
                    '$currency $price',
                    style: const TextStyle(
                      color: Colors.white70, 
                      fontWeight: FontWeight.w600,
                      fontSize: 12, // تصغير الخط
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4), // إضافة مسافة صغيرة
                Flexible( // استخدام Flexible للمخزون
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3), // تقليل الـ padding
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$available',
                      style: const TextStyle(
                        color: Colors.green, 
                        fontSize: 11, // تصغير الخط
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}