import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaMingguanPage extends StatelessWidget {
  const BeritaMingguanPage({super.key});

  static const List<Map<String, String>> beritaList = [
    {
      'judul': 'Serunya Organisasi & Komunitas di Undiksha!',
      'link': 'https://undiksha.ac.id/kuliah-nggak-cuma-soal-tugas-ini-dia-serunya-organisasi-komunitas-di-undiksha/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/25091559/Kuliah-Undiksha-1536x864.jpg',
    },
    {
      'judul': 'Kampus Multikultural di Bali Utara, Kenapa Nggak?',
      'link': 'https://undiksha.ac.id/kampus-multikultural-di-bali-utara-kenapa-gak/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/19154042/Blog-Undiksha-4-1536x864.jpg',
    },
    {
      'judul': 'GAFABEST 2025: Indahnya Ardhacaka di Undiksha',
      'link': 'https://undiksha.ac.id/gafabest-kembali-digelar-pamerkan-keindahan-ardhacaka/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/19144801/GAFABEST-UNDIKSHA-1536x864.jpg',
    },
    {
      'judul': 'EDU-ERA: Inovasi Mahasiswa Undiksha',
      'link': 'https://undiksha.ac.id/edu-era-inovasi-mahasiswa-undiksha-jadikan-belajar-sains-menyenangkan/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/18101141/Inovasi-Media-Pembelajaran-Edu-Era-1-1024x576.jpg',
    },
    {
      'judul': 'Pelantikan MPM & BEM 2025-2026 di Undiksha',
      'link': 'https://undiksha.ac.id/pelantikan-pengurus-2025-2026-rektor-dorong-mpm-dan-bem-rema-undiksha-jadi-trend-setter/',
      'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/17161631/Pelantikan-Pengurus-MPM-dan-Presma-Undiksha-2-1536x864.jpg',
    },
  ];

  Future<void> _bukaLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Tidak bisa membuka link: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berita Mingguan')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return GestureDetector(
            onTap: () => _bukaLink(berita['link']!),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
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
