import 'dart:ui';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191022),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello, Abdallah',
                        style: TextStyle(
                          color: Color(0xFFF1F5F9),
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                      Text(
                        'Welcome back to the Past.',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF660AC2).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF660AC2).withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Icon(Icons.search, color: const Color(0xFF660AC2).withOpacity(0.6), size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Search Tech, news, or stats',
                          style: TextStyle(color: const Color(0xFF660AC2).withOpacity(0.4), fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                _buildSectionHeader("Featured Tech News", "See all"),
                SizedBox(
                  height: 285,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildNewsCard("Neural Engines: The Next Frontier...", "Quantum"),
                      _buildNewsCard("Graphene Processors: Breaking 10nm", "Hardware"),
                    ],
                  ),
                ),

                _buildSectionHeader("System Stats", ""),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildStatItem("Core Performance", "Stable at 98.4%", "98.4%", Icons.bolt),
                      _buildStatItem("Neural Storage", "842 GB of 1 TB used", "84%", Icons.storage),
                      _buildStatItem("Security Protocol", "Active protection", "Secure", Icons.shield, isSecure: true),
                    ],
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  color: const Color(0xFF191022).withOpacity(0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color(0xFF660AC2).withOpacity(0.2),
                        child: const CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/images/prof.png')),
                      ),
                      const Text(
                        'FutureApp',
                        style: TextStyle(color: Color(0xFFF1F5F9), fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF660AC2).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.notifications_none, color: Color(0xFF660AC2), size: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFFF1F5F9), fontSize: 18, fontWeight: FontWeight.w700)),
          Text(action, style: const TextStyle(color: Color(0xFF660AC2), fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String tag) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF660AC2).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF660AC2).withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 160, decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
            decoration: BoxDecoration(color: const Color(0xFF660AC2).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
            child: Text(tag, style: const TextStyle(color: Color(0xFF660AC2), fontSize: 10, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Color(0xFFF1F5F9), fontSize: 16, fontWeight: FontWeight.w700, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String sub, String value, IconData icon, {bool isSecure = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF660AC2).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF660AC2).withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(color: const Color(0xFF660AC2).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: const Color(0xFF660AC2)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Color(0xFFF1F5F9), fontSize: 16, fontWeight: FontWeight.w600)),
                Text(sub, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              ],
            ),
          ),
          isSecure 
            ? const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20)
            : Text(value, style: const TextStyle(color: Color(0xFFF1F5F9), fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: const Color(0xFF191022).withOpacity(0.8),
            border: const Border(top: BorderSide(color: Color(0x33660AC2))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home, "Home", true),
              _navItem(Icons.analytics, "Stats", false),
              _navItem(Icons.person, "Profile", false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    Color color = isActive ? const Color(0xFF660AC2) : const Color(0xFF660AC2).withOpacity(0.5);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}