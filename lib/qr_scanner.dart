import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final MobileScannerController controller = MobileScannerController();
  bool isDetected = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleDetect(BarcodeCapture capture) {
    if (isDetected) return; // Cegah multiple detect
    final barcode = capture.barcodes.first;
    final rawValue = barcode.rawValue;

    if (rawValue != null) {
      setState(() => isDetected = true); // Tandai sudah terdeteksi
      print('QR Code Detected: $rawValue');

      // TUTUP HALAMAN setelah beberapa detik (opsional)
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: handleDetect,
          ),

          // Overlay teks
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Arahkan kamera ke QR Code',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          // Tombol kembali PASTI jalan
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
              onPressed: () {
                controller.stop(); // matikan kamera dulu
                Navigator.pop(context); // kembali
              },
            ),
          ),
        ],
      ),
    );
  }
}
