import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'menuUtama.dart';
import 'berita_harian.dart';
import 'berita_mingguan.dart';
import 'kategori.dart';
import 'profil.dart';
import 'setting.dart';
import 'theme_provider.dart'; 
import 'qr_scanner.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('is_logged_in') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berita Undiksha',
      theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: const Color.fromARGB(255, 179, 197, 206)),
      home: isLoggedIn ? const MenuUtama() : const LoginPage(),
      routes: {
        '/login': (_) => const LoginPage(),
        '/berita_harian': (_) => const BeritaHarianPage(),
        '/berita_mingguan': (_) => const BeritaMingguanPage(),
        '/kategori': (_) => const KategoriPage(),
        '/profile': (_) => const ProfilePage(),
        '/setting': (_) => const SettingPage(),
        '/qr_scanner': (_) => const QRScannerPage(),
      },
    );
  }
}
