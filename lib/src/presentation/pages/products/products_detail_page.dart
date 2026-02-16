import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  Widget _specRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = (product['images'] as List<dynamic>?)?.cast<String>() ?? [];
    final specs = product['specs'] as Map<String, dynamic>? ?? {};
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        title: Text(product['code'] ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة كبيرة
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
                image: images.isNotEmpty
                    ? DecorationImage(image: AssetImage(images.first), fit: BoxFit.cover)
                    : null,
              ),
              child: images.isEmpty ? const Center(child: Icon(Icons.image, color: Colors.white24)) : null,
            ),
            const SizedBox(height: 12),
            Text(product['name'] ?? '',
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              children: [
                Text('${product['currency']} ${product['price']}', style: const TextStyle(color: Colors.white70)),
                const Spacer(),
                Text('Available: ${product['available']}', style: const TextStyle(color: Colors.white54)),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Description', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(product['description'] ?? '', style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: 12),
            const Text('Specifications', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            ...specs.entries.map((e) => _specRow(e.key.toString(), e.value.toString())).toList(),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC47A3A),
                    ),
                    onPressed: () {
                      // إجراء افتراضي: إضافة إلى طلب جديد أو عرض استعلام سعر
                    },
                    child: const Text('Request Quote'),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white12,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}