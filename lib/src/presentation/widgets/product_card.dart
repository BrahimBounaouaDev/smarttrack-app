import 'package:flutter/material.dart';
import 'package:smarttoil/src/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

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
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // صورة المنتج
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFC47A3A),
                  width: 1,
                ),
                image: DecorationImage(
                  image: AssetImage(product.images.isNotEmpty
                      ? product.images.first
                      : 'assets/images/placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // معلومات المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Code: ${product.code}",
                    style: const TextStyle(
                      color: Color(0xFFC47A3A),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(Icons.oil_barrel,
                          color: const Color(0xFFC47A3A), size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "${product.available} available",
                        style: const TextStyle(
                          color: Color(0xFFE5E5E5),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "${product.price.toStringAsFixed(2)} ${product.currency}",
                    style: const TextStyle(
                      color: Color(0xFFC47A3A),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}