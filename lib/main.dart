import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/Soalno1.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/beranda_page.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/dashboard.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/profil.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/Pertemuanpage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uts_haikalauliaramadhan_241011700587/model/profile_model.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/peertemuan6.dart';
import 'package:uts_haikalauliaramadhan_241011700587/auth/auth_page.dart';
import 'package:uts_haikalauliaramadhan_241011700587/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const AuthPage(),
    );
  }
}
