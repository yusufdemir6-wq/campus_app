import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> courses = [
    {'name': 'Computer Architecture',        'code': 'COM204', 'teachers': 'Bayram Ünal, Aysel Ersoy'},
    {'name': 'Discrete Mathematics',         'code': 'MTH218', 'teachers': 'Tarık Arabacı'},
    {'name': 'Electronic Circuits',          'code': 'EEE202', 'teachers': 'Samer Ali Hussian'},
    {'name': 'Data Structures & Algorithms', 'code': 'COM202', 'teachers': 'Deniz Dahman'},
    {'name': 'Linear Algebra',               'code': 'MTH104', 'teachers': 'Tarık Arabacı'},
    {'name': 'Physics II',                   'code': 'PHY102', 'teachers': 'Kenan Senturk'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.person_outline, color: Colors.grey.shade500, size: 20),
                  ),
                  const SizedBox(width: 10),
                  const Text('Home', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  const Icon(Icons.menu, size: 22),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),

            // Course list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 20),
                  // Title pill
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFAE0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Active Courses',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...courses.map((c) => _CourseCard(course: c)),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final Map<String, String> course;
  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          // Dark header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A2E),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course['name']!,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  '${course['code']} · ${course['teachers']}',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11),
                ),
              ],
            ),
          ),
          // Light footer
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            child: Row(
              children: [
                Text('2025-2026 BAHAR · ÖNLİSANS',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                const Spacer(),
                Icon(Icons.notifications_none_rounded, size: 18, color: Colors.grey.shade400),
                const SizedBox(width: 10),
                Container(
                  width: 32, height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFDDDDDD)),
                  ),
                  child: const Center(
                    child: Text('0%', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
