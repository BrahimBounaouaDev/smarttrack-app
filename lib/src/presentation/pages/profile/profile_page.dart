import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? profile;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final raw = await rootBundle.loadString('assets/mock2/profile.json');
    final data = json.decode(raw);
    setState(() {
      profile = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF0D0D0D),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final avatar = profile!['avatar'];
    final name = profile!['name'];
    final email = profile!['email'];
    final company = profile!['company'];
    final prefs = profile!['preferences'];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + Name
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(avatar),
                ),
                const SizedBox(height: 12),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          _sectionTitle("Company Info"),
          _infoCard([
            _infoRow("Company", company['name']),
            _infoRow("VAT", company['vat']),
            _infoRow("Address", company['address']),
            _infoRow("Phone", company['phone']),
          ]),

          const SizedBox(height: 20),

          _sectionTitle("Preferences"),
          _infoCard([
            _infoRow("Currency", prefs['currency']),
            _infoRow("Language", prefs['language']),
            _infoRow("Theme", prefs['theme']),
            _infoRow("Notify Orders", prefs['notifications']['orders'].toString()),
            _infoRow("Notify RFQ", prefs['notifications']['rfq'].toString()),
            _infoRow("Promotions", prefs['notifications']['promotions'].toString()),
          ]),

          const SizedBox(height: 20),

          _sectionTitle("Contacts"),
          ..._buildContacts(),

          const SizedBox(height: 20)

          /*enter(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC47A3A),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileDetailPage(profile: profile!),
                  ),
                );
              },
              child: const Text("View Full Profile"),
            ),
          )*/
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _infoCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(children: children),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white54)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  List<Widget> _buildContacts() {
    final contacts = profile!['contacts'] as List<dynamic>;
    return contacts.map((c) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(c['name'],
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(c['position'], style: const TextStyle(color: Colors.white54)),
            const SizedBox(height: 6),
            Text("Email: ${c['email']}",
                style: const TextStyle(color: Colors.white70)),
            Text("Phone: ${c['phone']}",
                style: const TextStyle(color: Colors.white70)),
          ],
        ),
      );
    }).toList();
  }
}