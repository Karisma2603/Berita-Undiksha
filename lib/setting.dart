import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          // Mode Gelap
          SwitchListTile(
            title: const Text('Mode Gelap'),
            subtitle: const Text('Aktifkan tampilan dark mode'),
            secondary: const Icon(Icons.dark_mode),
            value: themeProvider.isDarkMode,
            onChanged: themeProvider.toggleTheme,
          ),

          const Divider(),

          // Tentang Aplikasi
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            subtitle: const Text('Informasi tentang aplikasi berita ini'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Berita Undiksha',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.newspaper),
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Aplikasi ini dibuat untuk menampilkan berita-berita resmi '
                      'dari Universitas Pendidikan Ganesha (Undiksha).',
                    ),
                  ),
                ],
              );
            },
          ),

          const Divider(),

          // Tentang Pengembang
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Tentang Pengembang'),
            subtitle: const Text('Klik untuk mengenal lebih dekat 😊'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Tentang Pengembang'),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/foto_dev.png'),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Halo, perkenalkan namaku Maria Karisma. Biasanya disapa Risma✨\n'
                          'Aku adalah seorang mahasiswi semester 4 dari jurusan Teknik Informatika Fakultas Teknik dan Kejuruan Universitas Pendidikan Ganesha.\n'
                          'Aplikasi Berita Undiksha dibuat untuk menyajikan informasi dan berita terbaru untuk seluruh civitas kampus dimanapun dan kapanpun.\n'
                          'Terima kasih sudah menggunakan aplikasi ini!\n'
                          'Salam Harmoni!',
                          textAlign: TextAlign.center,
                          ),
                          ],
                          ),

                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
