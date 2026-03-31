import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          _buildStats(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 16),
                _sectionTitle('Current Courses'),
                const SizedBox(height: 8),
                _courseRow('Visual Programming',  'COM204', 'AA', const Color(0xFF1D9E75)),
                _courseRow('Discrete Mathematics','MTH218', 'BA', const Color(0xFF185FA5)),
                _courseRow('Data Structure',      'COM202', 'AB', const Color(0xFF1D9E75)),
                const SizedBox(height: 16),
                _sectionTitle('Settings'),
                const SizedBox(height: 8),
                _menuItem(Icons.person_outline,        'Personal Information', const Color(0xFFFFFAE0), Colors.orange),
                _menuItem(Icons.notifications_none,    'Notifications',        const Color(0xFFE1F5EE), const Color(0xFF1D9E75)),
                _menuItem(Icons.lock_outline,          'Privacy & Security',   const Color(0xFFFAEEDA), const Color(0xFF854F0B)),
                _menuItem(Icons.settings_outlined,     'App Settings',         const Color(0xFFF5F5F5), Colors.grey),
                const SizedBox(height: 8),
                _menuItem(Icons.logout,                'Log out',              const Color(0xFFFCEBEB), Colors.red),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1A2E),
      padding: const EdgeInsets.fromLTRB(16, 52, 16, 28),
      child: Column(
        children: [
          // Top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Edit', style: TextStyle(color: Colors.white, fontSize: 13)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Avatar
          const CircleAvatar(
            radius: 42,
            backgroundColor: Color(0xFFD0EEFF),
            child: Text('YD',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Color(0xFF6666CC))),
          ),
          const SizedBox(height: 12),
          const Text('YUSUF DEMIR',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          const Text('240417817', style: TextStyle(color: Colors.white54, fontSize: 13)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('COMPUTER ENGINEER',
                style: TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 1)),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    final stats = [
      {'value': '7',   'label': 'Courses'},
      {'value': '2.7', 'label': 'GPA'},
      {'value': '82%', 'label': 'Attendance'},
      {'value': '14',  'label': 'Credits'},
    ];
    return Row(
      children: stats.map((s) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFEEEEEE)),
                right: BorderSide(color: Color(0xFFEEEEEE)),
              ),
            ),
            child: Column(
              children: [
                Text(s['value']!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1A1A2E))),
                const SizedBox(height: 2),
                Text(s['label']!, style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _courseRow(String name, String code, String grade, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(radius: 4, backgroundColor: Color(0xFF1A1A2E)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                Text(code, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(grade,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String label, Color bg, Color iconColor) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: Container(
        width: 36, height: 36,
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: iconColor, size: 18),
      ),
      title: Text(label,
          style: TextStyle(fontSize: 13, color: label == 'Log out' ? Colors.red : Colors.black)),
      trailing: Icon(Icons.chevron_right,
          size: 18, color: label == 'Log out' ? Colors.red : Colors.grey.shade400),
      onTap: () {},
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E)));
  }
}
