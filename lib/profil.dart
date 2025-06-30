import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String nama = 'Maria Karisma';
  final String email = 'maria.karisma@student.undiksha.ac.id';
  final String status = 'Mahasiswa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/foto_nasabah.png'),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    profileItem(Icons.person, 'Nama', nama),
                    const Divider(),
                    profileItem(Icons.email, 'Email', email),
                    const Divider(),
                    profileItem(Icons.school, 'Status', status),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value, style: const TextStyle(color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }
}
