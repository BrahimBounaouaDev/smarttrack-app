/*import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatelessWidget {
  final String assetPath;

  const PdfViewerPage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset(assetPath),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(assetPath.split('/').last),
      ),
      body: PdfView(
        controller: pdfController,
      ),
    );
  }
}*/
/*

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatelessWidget {
  final String assetPath;

  const PdfViewerPage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset(assetPath),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(assetPath.split('/').last),
      ),
      body: Material(
        color: Colors.transparent,
        child: PdfView(
          controller: pdfController,
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  final String assetPath;

  const PdfViewerPage({super.key, required this.assetPath});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfController pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfController(
      document: PdfDocument.openAsset(widget.assetPath),
    );
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: Text(widget.assetPath.split('/').last),
      ),
      body: PdfView(
        controller: pdfController,
      ),
    );
  }
}