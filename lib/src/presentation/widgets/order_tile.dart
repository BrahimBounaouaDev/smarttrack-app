import 'package:flutter/material.dart';
import 'package:smarttoil/src/domain/entities/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const OrderTile({
    Key? key,
    required this.order,
    required this.onTap,
  }) : super(key: key);

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return Colors.orangeAccent;
      case "approved":
        return Colors.greenAccent;
      case "rejected":
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D0D), // خلفية داكنة
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFC47A3A), // نحاسي
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // أيقونة الطلب
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFC47A3A),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.receipt_long,
                color: Color(0xFFC47A3A),
                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            // معلومات الطلب
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order #${order.id}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Customer: ${order.customer}",
                    style: const TextStyle(
                      color: Color(0xFFE5E5E5),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(Icons.circle,
                          size: 10, color: _statusColor(order.status)),
                      const SizedBox(width: 6),
                      Text(
                        order.status,
                        style: TextStyle(
                          color: _statusColor(order.status),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // السعر
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${order.total.toStringAsFixed(2)} ${order.currency}",
                  style: const TextStyle(
                    color: Color(0xFFC47A3A),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  order.date.toString().split(" ").first,
                  style: const TextStyle(
                    color: Color(0xFFE5E5E5),
                    fontSize: 12,
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