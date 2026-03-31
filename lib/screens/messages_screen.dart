import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  static const List<Map<String, dynamic>> professors = [
    {'initials': 'DD', 'name': 'Deniz Dahman',  'preview': 'Did you submit the project yet?',      'time': '10:22',    'unread': 2},
    {'initials': 'TA', 'name': 'Tarık Arabacı', 'preview': 'No lecture next week.',                'time': 'Yesterday','unread': 0},
    {'initials': 'SA', 'name': 'Samer Hussian', 'preview': 'Great work on the circuit lab report!','time': 'Mon',      'unread': 0},
  ];

  static const List<Map<String, dynamic>> friends = [
    {'initials': 'SM', 'name': 'Sidi Mehdi',       'preview': "Bro we're gonna fail",               'time': '11:56', 'unread': 5,  'online': false},
    {'initials': 'AH', 'name': 'Abdelrahman Haj',  'preview': 'Yo bro wanna play in a bit?',        'time': '7:32',  'unread': 0,  'online': true},
    {'initials': 'EJ', 'name': 'E. Johnson',        'preview': 'You: Sent the notes from Data st..', 'time': 'Sun',   'unread': 0,  'online': false},
    {'initials': 'M',  'name': 'Miracle',           'preview': "I'm too old for this man...",        'time': 'Sat',   'unread': 0,  'online': false},
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
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.person_outline, color: Colors.grey.shade500, size: 20),
                  ),
                  const SizedBox(width: 10),
                  const Text('Messages', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  const Icon(Icons.notifications_none_rounded, size: 22),
                  const SizedBox(width: 16),
                  const Icon(Icons.search_rounded, size: 22),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(Icons.search, color: Colors.grey.shade400, size: 18),
                    const SizedBox(width: 8),
                    Text('Search Messages', style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
                  ],
                ),
              ),
            ),

            // List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _sectionLabel('PROFESSORS'),
                  ...professors.map((p) => _tile(p, isProfessor: true)),
                  _sectionLabel('FRIENDS'),
                  ...friends.map((f) => _tile(f, isProfessor: false)),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Text(label,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey.shade500, letterSpacing: 0.8)),
    );
  }

  Widget _tile(Map<String, dynamic> data, {required bool isProfessor}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: isProfessor ? const Color(0xFF1A1A2E) : const Color(0xFFB0AEE8),
        child: Text(
          data['initials'],
          style: TextStyle(
            color: isProfessor ? Colors.white : const Color(0xFF4A4899),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Row(
        children: [
          Text(data['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          if (isProfessor) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: const Color(0xFF1A1A2E), borderRadius: BorderRadius.circular(4)),
              child: const Text('Prof', style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ],
          const Spacer(),
          Text(data['time'], style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
        ],
      ),
      subtitle: Text(data['preview'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
      trailing: _trailing(data),
    );
  }

  Widget _trailing(Map<String, dynamic> data) {
    if (data['unread'] > 0) {
      return CircleAvatar(
        radius: 11,
        backgroundColor: const Color(0xFF1A1A2E),
        child: Text('${data['unread']}',
            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
      );
    }
    if (data['online'] == true) {
      return Container(
        width: 10, height: 10,
        decoration: const BoxDecoration(color: Color(0xFF1D9E75), shape: BoxShape.circle),
      );
    }
    return const SizedBox(width: 10);
  }
}
