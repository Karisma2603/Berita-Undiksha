import 'package:flutter/material.dart';
import 'kategori_detail.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  final List<String> kategoriList = const [
    'Prestasi',
    'Akademik',
    'Beasiswa',
    'Kegiatan',
    'Pengumuman',
    'Kreativitas',
    'Kehidupan Kampus',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kategori Berita')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: kategoriList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            final kategori = kategoriList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KategoriDetailPage(kategori: kategori),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    kategori,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
