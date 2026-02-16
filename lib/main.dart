// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';  // تغيير هذا السطر

import 'package:smarttoil/di/injection.dart';
import 'package:smarttoil/src/presentation/pages/auth/auth_page.dart';
import 'package:smarttoil/src/presentation/pages/home/home_page.dart';
import 'package:smarttoil/src/presentation/pages/orders/order_detail_page.dart';
import 'package:smarttoil/src/presentation/pages/orders/orders_page.dart';
import 'package:smarttoil/src/presentation/pages/profile/profile_page.dart';
import 'package:smarttoil/src/presentation/pages/rfq/rfq_detailpage.dart';
import 'package:smarttoil/src/presentation/pages/rfq/rfqs_page.dart';
import 'package:smarttoil/src/presentation/pages/splash/splash_screen.dart';
import 'package:smarttoil/src/presentation/pages/products/products_detail_page.dart';
import 'package:smarttoil/src/presentation/pages/products/products_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة الـ DI (GetIt)
  await initDependencies();

  runApp(
    const ProviderScope(
      child: SmarttoilApp(),
    ),
  );
}

class SmarttoilApp extends StatelessWidget {
  const SmarttoilApp({super.key});  // تحديث إلى super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smarttoil',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      ),

       routes: {
        '/AuthPage': (context) => const AuthPage(),
        '/HomePage': (context) => const HomePage(),
        '/OrdersPage': (context) => const OrdersPage(),
        '/ProductDetailPage': (context) => const ProductDetailPage(product: {},),
        '/ProductsPage': (context) => const ProductsPage(),
        '/ProfilePage': (context) => const ProfilePage(),        
        '/OrderDetailPage': (context) => const OrderDetailPage(order: {},),
        '/RFQsPage': (context) => const RFQsPage(),
        '/RFQDetailPage': (context) => const RFQDetailPage(rfq: {},),
       
         
        // ... باقي المسارات
      },
      home: const SlideshowSplash(),
    );
  }
}

