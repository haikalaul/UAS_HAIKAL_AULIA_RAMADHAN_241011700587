import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/Soalno1.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert8.dart';

import 'package:uts_haikalauliaramadhan_241011700587/auth/auth_page.dart';
import 'package:uts_haikalauliaramadhan_241011700587/model/profile_model.dart';

import 'package:uts_haikalauliaramadhan_241011700587/Page/beranda_page.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert1.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert2.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pertemuan3.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/peertemuan6.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/peertemuan7.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert9.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert8.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileModel profile = ProfileModel();

  late List<Map<String, dynamic>> menuItems;

  void saveProfile(ProfileModel newProfile) {
    setState(() {
      profile = newProfile;
    });
  }

  @override
  void initState() {
    super.initState();

    menuItems = [
      {
        "title": "Pertemuan 1",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": const MyApp1(),
      },
      {
        "title": "Pertemuan 2",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": const MyApp2(),
      },
      {
        "title": "Pertemuan 3",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": const MyApp3(),
      },
      {
        "title": "Pertemuan 4",
        "icon": Icons.person,
        "color": Colors.purple,
        "page": BerandaPage(profile: profile, onSave: saveProfile),
      },
      {
        "title": "Pertemuan 5",
        "icon": Icons.list,
        "color": Colors.teal,
        "page": const ListPage(),
      },
      {
        "title": "Pertemuan 6",
        "icon": Icons.check_box,
        "color": Colors.green,
        "page": CheckboxPage(),
      },
      {
        "title": "Pertemuan 7",
        "icon": Icons.radio_button_checked,
        "color": Colors.orange,
        "page": const RadioButtonPage(),
      },
      {
        "title": "Pertemuan 8",
        "icon": Icons.radio_button_checked,
        "color": Colors.green,
        "page": const Pert8(),
      },
      {
        "title": "Pertemuan 9",
        "icon": Icons.radio_button_checked,
        "color": Colors.red,
        "page": const Pert9(),
      },
      {
        "title": "Pertemuan 14",
        "icon": Icons.radio_button_checked,
        "color": Colors.yellow,
        "page": const MapDirectionScreen(),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Selamat Datang ${user?.email ?? ""}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const AuthPage()),
                );
              }
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];

            return buildMenuCard(
              title: item["title"],
              icon: item["icon"],
              color: item["color"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item["page"]),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildMenuCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
