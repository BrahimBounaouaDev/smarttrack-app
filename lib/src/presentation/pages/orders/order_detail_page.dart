import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailPage({super.key, required this.order});

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = order['items'] as List<dynamic>? ?? [];
    final shipping = order['shipping'] as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        title: Text(order['id'] ?? 'Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(order['customer'] ?? '',
                style: const TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  backgroundColor: Colors.orange.withOpacity(0.12),
                  label: Text(order['status'] ?? '',
                      style: const TextStyle(color: Colors.orange)),
                ),
                const SizedBox(width: 12),
                Text('${order['currency']} ${order['total']}',
                    style: const TextStyle(color: Colors.white70)),
                const Spacer(),
                Text(_formatDate(order['date'] ?? ''),
                    style: const TextStyle(color: Colors.white54)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Items',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.white12),
                itemBuilder: (context, i) {
                  final it = items[i] as Map<String, dynamic>;
                  final qty = it['qty'] ?? 0;
                  final unit = it['unitPrice'] ?? 0;
                  final lineTotal = (qty as num) * (unit as num);
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(it['productId'] ?? '',
                        style: const TextStyle(color: Colors.white)),
                    subtitle: Text('Qty: $qty  •  Unit: $unit',
                        style: const TextStyle(color: Colors.white54)),
                    trailing: Text(lineTotal.toString(),
                        style: const TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const Text('Shipping',
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(
                shipping != null
                    ? '${shipping['method'] ?? ''}  •  ${shipping['port'] ?? ''}  •  ETA: ${shipping['eta'] ?? ''}'
                    : '—',
                style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: 12),
            const Text('Notes',
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(order['notes'] ?? '', style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}