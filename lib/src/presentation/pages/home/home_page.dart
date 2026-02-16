import 'package:flutter/material.dart';
import 'package:smarttoil/src/presentation/pages/orders/orders_page.dart';


import 'package:smarttoil/src/presentation/pages/products/products_page.dart';
import 'package:smarttoil/src/presentation/pages/profile/profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // قائمة الصفحات للـ BottomNavigationBar
  static const List<Widget> _pages = <Widget>[
    _DashboardPage(),
    ProductsPage(),
    OrdersPage(),
    ProfilePage(),
    //_ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ✅ تصميم الـ Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: const Border(
          top: BorderSide(
            color: Color(0xFFC47A3A),
            width: 0.5,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFC47A3A),
        unselectedItemColor: Colors.white54,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            activeIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ✅ صفحة Dashboard (الرئيسية)
class _DashboardPage extends StatelessWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header مع ترحيب
            _buildHeader(),
            
            const SizedBox(height: 25),
            
            // بطاقات الإحصائيات السريعة
            _buildStatsCards(),
            
            const SizedBox(height: 25),
            
            // قسم الفئات السريعة
            _buildQuickActions(context),
            
            const SizedBox(height: 25),
            
            // آخر المنتجات
            _buildRecentProducts(),
            
            const SizedBox(height: 25),
            
            // آخر طلبات الأسعار (RFQs)
            _buildRecentRFQs(),
          ],
        ),
      ),
    );
  }

  // ✅ Header مع ترحيب
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back,',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Ahmed Al-Harthy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFC47A3A),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.person,
            color: Color(0xFFC47A3A),
          ),
        ),
      ],
    );
  }

  // ✅ بطاقات الإحصائيات
  Widget _buildStatsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Products',
            value: '1,234',
            icon: Icons.inventory,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Orders',
            value: '56',
            icon: Icons.shopping_cart,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'RFQs',
            value: '12',
            icon: Icons.request_page,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC47A3A).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // ✅ الإجراءات السريعة
  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            _buildActionButton(
              icon: Icons.qr_code_scanner,
              label: 'Scan',
              onTap: () {
                // مسح QR كود
              },
            ),
            const SizedBox(width: 12),
            _buildActionButton(
              icon: Icons.add_shopping_cart,
              label: 'New Order',
              onTap: () {
                Navigator.pushNamed(context, '/products');
              },
            ),
            const SizedBox(width: 12),
            _buildActionButton(
              icon: Icons.request_page,
              label: 'RFQ',
              onTap: () {
                Navigator.pushNamed(context, '/RFQsPage');
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFC47A3A).withOpacity(0.5),
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: const Color(0xFFC47A3A), size: 28),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 // ✅ آخر المنتجات
Widget _buildRecentProducts() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Products',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/products');
            },
            child: const Text(
              'View All',
              style: TextStyle(
                color: Color(0xFFC47A3A),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            // ✅ استخدام index لتغيير رقم الصورة
            String imageName = 'assets/mockp/product_${index + 1}.png';
            
            // ✅ للتشخيص - شاهد في الكونسول
            print('محاولة تحميل: $imageName');
            
            return _buildProductCard(
              name: 'Drill Bit ${index + 1}',
              price: '\$${((index + 1) * 100).toString()}',
              imageUrl: imageName,
            );
          },
        ),
      ),
    ],
  );
}






/*
  // ✅ آخر المنتجات
  Widget _buildRecentProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Products',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
              //  Navigator.pushNamed(context, '/products');
              },
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Color(0xFFC47A3A),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildProductCard(
                name: 'Drill Bit ${index + 1}',
                price: '\$${(index + 1) * 100}',
                imageUrl: 'assets/mockp/product_1.png',
              );
            },
          ),
        ),
      ],
    );
  }*/
  // ✅ آخر المنتجات

  Widget _buildProductCard({
    required String name,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC47A3A).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: Colors.white24,
                  size: 40,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xFFC47A3A),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ آخر طلبات الأسعار
  Widget _buildRecentRFQs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent RFQs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
               // Navigator.pushNamed(context, '/rfqs');
              },
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Color(0xFFC47A3A),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return _buildRFQItem(
              rfqNumber: 'RFQ-2024-${100 + index}',
              status: index == 0 ? 'Pending' : (index == 1 ? 'Quoted' : 'Approved'),
              date: 'Feb ${10 + index}, 2024',
            );
          },
        ),
      ],
    );
  }

  Widget _buildRFQItem({
    required String rfqNumber,
    required String status,
    required String date,
  }) {
    Color statusColor;
    switch (status) {
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Quoted':
        statusColor = Colors.blue;
        break;
      case 'Approved':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFC47A3A).withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rfqNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: statusColor.withOpacity(0.3)),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ صفحة المنتجات (مؤقتة)



