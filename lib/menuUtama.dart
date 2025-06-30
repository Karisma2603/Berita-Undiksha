import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart'; 

class MenuUtama extends StatefulWidget {
  const MenuUtama({super.key});

  @override
  _MenuUtamaState createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  String username = 'Maria Karisma';
  String statusPengguna = 'Mahasiswa';

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('is_logged_in');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      appBar: AppBar(
        title: const Text('Menu Utama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue[900],
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Center(
              child: Text(
                'Berita Undiksha',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/foto_nasabah.png'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(username),
                        const SizedBox(height: 6),
                        const Text(
                          "Status Pengguna",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(statusPengguna),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.trending_up, color: Colors.deepOrange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Mahasiswa Sistem Informasi mendapatkan nilai A di matkul Pemrograman Mobile!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildMenuItem(context, Icons.article, 'Berita Harian', '/berita_harian'),
                    buildMenuItem(context, Icons.newspaper, 'Berita Mingguan', '/berita_mingguan'),
                    buildMenuItem(context, Icons.category, 'Kategori', '/kategori'),
                    buildMenuItem(context, Icons.person, 'Profil', '/profile'),
                    kIsWeb
                    ? buildMenuItem(context, Icons.qr_code_scanner, 'QR Scanner', '',)
                    : buildMenuItem(context, Icons.qr_code_scanner, 'QR Scanner', '/qr_scanner'),
                    buildMenuItem(context, Icons.settings, 'Setting', '/setting'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        if (route.isEmpty) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Fitur Tidak Didukung"),
              content: const Text("QR Scanner hanya tersedia di perangkat Android/iOS."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Tutup"),
                  )
                ],
              )
            );
          } else {
            Navigator.pushNamed(context, route);
          }
        },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue, size: 48),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
