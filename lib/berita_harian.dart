import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaHarianPage extends StatelessWidget {
  const BeritaHarianPage({super.key});

  final List<Map<String, String>> beritaList = const [
    {
      'judul': 'Kelulusan dan Nilai SMBJM CBT 2025',
      'link': 'https://undiksha.ac.id/kelulusan-dan-nilai-smbjm-cbt-2025/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/20113304/kelulusan-smbjm-cbt-2025.jpg',
    },
    {
      'judul': 'Perpanjangan Pendaftaran SMBJM CBT 2025',
      'link': 'https://undiksha.ac.id/informasi-perpanjangan-pendaftaran-smbjm-cbt-tahun-2025/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/03084732/perpanjangan-pendaftaran-mandiri-Undiksha-2025.jpg',
    },
    {
      'judul': 'Gangguan Layanan Bank Mitra SPMB Undiksha',
      'link': 'https://undiksha.ac.id/gangguan-layanan-bank-mitra-pada-spmb-undiksha/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/03084724/Gangguan-Bank-Mitra-SMBJM-2025.jpg',
    },
    {
      'judul': 'Data Beasiswa ADik Papua di Undiksha',
      'link': 'https://kemahasiswaan.undiksha.ac.id/data-beasiswa-afirmasi-dikti-adik-papua-universitas-pendidikan-ganesha-2025/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/05/07155538/Beasiswa-Garuda-2025-6-240x300.jpg',
    },
    {
      'judul': 'Beasiswa Garuda Gelombang 2 Tahun 2025',
      'link': 'https://undiksha.ac.id/beasiswa-garuda/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/05/07155535/beasiswa-garuda-gelombang-2-tahun-2025-819x1024.webp',
    },
  ];

  Future<void> _bukaLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka link: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berita Harian')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return GestureDetector(
            onTap: () => _bukaLink(berita['link']!),
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      berita['thumbnail']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      berita['judul']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
