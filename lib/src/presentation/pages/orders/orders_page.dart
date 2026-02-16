/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:smarttoil/src/presentation/pages/orders/order_detail_page.dart';


class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Map<String, dynamic>> _orders = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadOrdersFromAsset();
  }

  Future<void> _loadOrdersFromAsset() async {
    try {
      final raw = await rootBundle.loadString('assets/mock2/orders.json');
      final List<dynamic> parsed = json.decode(raw);
      setState(() {
        _orders = parsed.cast<Map<String, dynamic>>();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _orders = [];
        _loading = false;
      });
    }
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return const Color(0xFFC47A3A);
      case 'pending':
        return Colors.orange;
      case 'shipped':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      default:
        return Colors.grey;
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
                        Text('Orders',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.filter_list, color: Colors.white54)
                      ],
                    ),
                    const SizedBox(height: 12),
                    // قائمة الطلبات
                    Expanded(
                      child: ListView.separated(
                        itemCount: _orders.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final order = _orders[index];
                          return _OrderCard(
                            order: order,
                            statusColor: _statusColor(order['status'] ?? ''),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OrderDetailPage(order: order),
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

// بطاقة الطلب مدمجة داخل نفس الملف
class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final Color statusColor;
  final VoidCallback onTap;

  const _OrderCard({
    required this.order,
    required this.statusColor,
    required this.onTap,
  });

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
    final id = order['id'] ?? '';
    final customer = order['customer'] ?? '';
    final status = order['status'] ?? '';
    final total = order['total']?.toString() ?? '';
    final currency = order['currency'] ?? '';
    final date = order['date'] ?? '';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.receipt_long, color: statusColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(id,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(customer, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          status.toString().toUpperCase(),
                          style: TextStyle(
                              color: statusColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '$currency $total',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(_formatDate(date),
                    style: const TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 8),
                const Icon(Icons.chevron_right, color: Colors.white54),
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
import 'package:smarttoil/src/presentation/pages/orders/order_detail_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Map<String, dynamic>> _orders = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadOrdersFromAsset();
  }

  Future<void> _loadOrdersFromAsset() async {
    try {
      final raw = await rootBundle.loadString('assets/mock2/orders.json');
      final List<dynamic> parsed = json.decode(raw);
      setState(() {
        _orders = parsed.cast<Map<String, dynamic>>();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _orders = [];
        _loading = false;
      });
    }
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return const Color(0xFFC47A3A);
      case 'pending':
        return Colors.orange;
      case 'shipped':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      default:
        return Colors.grey;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Orders',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.filter_list, color: Colors.white54)
                      ],
                    ),
                    const SizedBox(height: 12),
                    // قائمة الطلبات
                    Expanded(
                      child: ListView.separated(
                        itemCount: _orders.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final order = _orders[index];
                          return _OrderCard(
                            order: order,
                            statusColor: _statusColor(order['status'] ?? ''),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OrderDetailPage(order: order),
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

// بطاقة الطلب المعدلة
class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final Color statusColor;
  final VoidCallback onTap;

  const _OrderCard({
    required this.order,
    required this.statusColor,
    required this.onTap,
  });

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
    final id = order['id'] ?? '';
    final customer = order['customer'] ?? '';
    final status = order['status'] ?? '';
    final total = order['total']?.toString() ?? '';
    final currency = order['currency'] ?? '';
    final date = order['date'] ?? '';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12), // تقليل padding من 14 إلى 12
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            // الأيقونة
            Container(
              width: 44, // تقليل العرض من 48 إلى 44
              height: 44, // تقليل الارتفاع من 48 إلى 44
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.receipt_long, color: statusColor, size: 22), // تصغير الأيقونة
            ),
            const SizedBox(width: 10), // تقليل المسافة من 12 إلى 10
            // المحتوى الرئيسي
            Expanded(
              flex: 2, // إعطاء وزن أكبر للمحتوى الرئيسي
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    id,
                    style: const TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 14), // تصغير الخط قليلاً
                    overflow: TextOverflow.ellipsis, // منع تجاوز النص
                  ),
                  const SizedBox(height: 3), // تقليل المسافة من 4 إلى 3
                  Text(
                    customer, 
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13), // تصغير الخط
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4), // تقليل المسافة من 6 إلى 4
                  Row(
                    children: [
                      Flexible( // استخدام Flexible لمنع تجاوز المحتوى
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3), // تقليل padding
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.14),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status.toString().toUpperCase(),
                            style: TextStyle(
                                color: statusColor,
                                fontSize: 11, // تصغير الخط
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8), // تقليل المسافة من 12 إلى 8
                      Flexible( // استخدام Flexible
                        child: Text(
                          '$currency $total',
                          style: const TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.bold,
                              fontSize: 13), // تصغير الخط
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8), // تقليل المسافة
            // الجزء الأيمن (التاريخ والسهم)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatDate(date),
                  style: const TextStyle(
                      color: Colors.white54, 
                      fontSize: 11), // تصغير الخط
                ),
                const SizedBox(height: 4), // تقليل المسافة من 8 إلى 4
                const Icon(
                  Icons.chevron_right, 
                  color: Colors.white54,
                  size: 18, // تصغير حجم الأيقونة
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}