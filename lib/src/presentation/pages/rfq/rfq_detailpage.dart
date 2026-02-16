/*import 'package:flutter/material.dart';
import 'package:smarttoil/src/presentation/pages/rfq/PdfViewerPage.dart';


class RFQDetailPage extends StatelessWidget {
  final Map<String, dynamic> rfq;

  const RFQDetailPage({super.key, required this.rfq});

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return "${dt.year}-${dt.month}-${dt.day}";
    } catch (_) {
      return iso;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = rfq['items'] as List<dynamic>;
    final attachments = (rfq['attachments'] as List<dynamic>).cast<String>();
    final responses = rfq['responses'] as List<dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: Text(rfq['id']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(rfq['company'],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text("Preferred Delivery: ${rfq['preferredDelivery']}",
                style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: 12),

            const Text("Items",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),

            Expanded(
              child: ListView(
                children: [
                  ...items.map((it) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(it['productId'],
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text(
                            "Qty: ${it['qty']}  •  Unit: ${it['unit']}",
                            style: const TextStyle(color: Colors.white54)),
                      )),

                  const SizedBox(height: 20),

                  const Text("Notes",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(rfq['notes'],
                      style: const TextStyle(color: Colors.white54)),

                  const SizedBox(height: 20),

                  const Text("Attachments",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),

                  ...attachments.map((path) => ListTile(
                        leading: const Icon(Icons.picture_as_pdf,
                            color: Colors.red),
                        title: Text(path.split('/').last,
                            style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PdfViewerPage(assetPath: path),
                            ),
                          );
                        },
                      )),

                  const SizedBox(height: 20),

                  const Text("Responses",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),

                  responses.isEmpty
                      ? const Text("No responses yet",
                          style: TextStyle(color: Colors.white54))
                      : Column(
                          children: responses.map((res) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(res['vendor'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text(
                                      "${res['currency']} ${res['price']} • Lead Time: ${res['leadTimeDays']} days",
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                  const SizedBox(height: 4),
                                  Text(res['comment'],
                                      style: const TextStyle(
                                          color: Colors.white54)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:smarttoil/src/presentation/pages/rfq/PdfViewerPage.dart';

class RFQDetailPage extends StatelessWidget {
  final Map<String, dynamic> rfq;

  const RFQDetailPage({super.key, required this.rfq});

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return "${dt.year}-${dt.month}-${dt.day}";
    } catch (_) {
      return iso;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = rfq['items'] as List<dynamic>;
    final attachments = (rfq['attachments'] as List<dynamic>).cast<String>();
    final responses = rfq['responses'] as List<dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: Text(rfq['id']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              rfq['company'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Preferred Delivery: ${rfq['preferredDelivery']}",
              style: const TextStyle(color: Colors.white54),
            ),

            const SizedBox(height: 12),

            const Text(
              "Items",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            // Scrollable content
            Expanded(
              child: ListView(
                children: [
                  // ITEMS
                  ...items.map(
                    (it) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        it['productId'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Qty: ${it['qty']}  •  Unit: ${it['unit']}",
                        style: const TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // NOTES
                  const Text(
                    "Notes",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    rfq['notes'],
                    style: const TextStyle(color: Colors.white54),
                  ),

                  const SizedBox(height: 20),

                  // ATTACHMENTS
                  const Text(
                    "Attachments",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  ...attachments.map(
                    (path) => ListTile(
                      leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                      title: Text(
                        path.split('/').last,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PdfViewerPage(assetPath: path),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // RESPONSES
                  const Text(
                    "Responses",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  responses.isEmpty
                      ? const Text(
                          "No responses yet",
                          style: TextStyle(color: Colors.white54),
                        )
                      : Column(
                          children: responses.map((res) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    res['vendor'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${res['currency']} ${res['price']} • Lead Time: ${res['leadTimeDays']} days",
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    res['comment'],
                                    style: const TextStyle(color: Colors.white54),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}