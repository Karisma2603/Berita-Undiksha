import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KategoriDetailPage extends StatelessWidget {
  final String kategori;
  const KategoriDetailPage({super.key, required this.kategori});

  static final Map<String, List<Map<String, String>>> beritaByKategori = {
    'Prestasi': [
      {
        'judul': 'Mahasiswa Undiksha Juara 1 UI/UX Nasional',
        'link': 'https://undiksha.ac.id/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/20113304/kelulusan-smbjm-cbt-2025.jpg',
      },
    ],
    'Akademik': [
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
    ],
    'Beasiswa': [
      {
        'judul': 'Beasiswa Garuda Gelombang 2 Tahun 2025',
        'link': 'https://undiksha.ac.id/beasiswa-garuda/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/05/07155535/beasiswa-garuda-gelombang-2-tahun-2025-819x1024.webp',
      },
      {
        'judul': 'Data Beasiswa ADik Papua di Undiksha',
        'link': 'https://kemahasiswaan.undiksha.ac.id/data-beasiswa-afirmasi-dikti-adik-papua-universitas-pendidikan-ganesha-2025/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/05/07155538/Beasiswa-Garuda-2025-6-240x300.jpg',
      },
    ],
    'Kegiatan': [
      {
        'judul': 'GAFABEST 2025: Indahnya Ardhacaka di Undiksha',
        'link': 'https://undiksha.ac.id/gafabest-kembali-digelar-pamerkan-keindahan-ardhacaka/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/19144801/GAFABEST-UNDIKSHA-1536x864.jpg',
      },
      {
        'judul': 'Pelantikan MPM & BEM 2025-2026 di Undiksha',
        'link': 'https://undiksha.ac.id/pelantikan-pengurus-2025-2026-rektor-dorong-mpm-dan-bem-rema-undiksha-jadi-trend-setter/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/17161631/Pelantikan-Pengurus-MPM-dan-Presma-Undiksha-2-1536x864.jpg',
      },
    ],
    'Pengumuman': [
      {
        'judul': 'Gangguan Layanan Bank Mitra SPMB Undiksha',
        'link': 'https://undiksha.ac.id/gangguan-layanan-bank-mitra-pada-spmb-undiksha/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/03084724/Gangguan-Bank-Mitra-SMBJM-2025.jpg',
      },
    ],
    'Kreativitas': [
      {
        'judul': 'EDU-ERA: Inovasi Mahasiswa Undiksha',
        'link': 'https://undiksha.ac.id/edu-era-inovasi-mahasiswa-undiksha-jadikan-belajar-sains-menyenangkan/',
        'thumbnail': 'https://cdn.undiksha.ac.id/wp-content/uploads/2025/06/18101141/Inovasi-Media-Pembelajaran-Edu-Era-1-1024x576.jpg',
      },
    ],
    'Kehidupan Kampus': [
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
    ],
  };

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka link: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final beritaList = beritaByKategori[kategori] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(kategori)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return GestureDetector(
            onTap: () => _launchURL(berita['link']!),
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
