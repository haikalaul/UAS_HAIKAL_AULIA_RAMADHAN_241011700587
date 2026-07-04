import 'package:flutter/material.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/Soalno1.dart';
import 'package:uts_haikalauliaramadhan_241011700587/model/profile_model.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/beranda_page.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/peertemuan6.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/peertemuan7.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pertemuan3.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert2.dart';
import 'package:uts_haikalauliaramadhan_241011700587/Page/pertemuan/pert1.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ProfileModel profile = ProfileModel();

  void saveProfile(ProfileModel newProfile) {
    setState(() {
      profile = newProfile;
    });
  }

  late List<Map<String, dynamic>> menuItems;

  @override
  void initState() {
    super.initState();

    menuItems = [
      {
        "title": "Pertemuan 1",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": MyApp1(),
      },
      {
        "title": "Pertemuan 2",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": MyApp2(),
      },
      {
        "title": "Pertemuan 3",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": MyApp3(),
      },
      {
        "title": "Pertemuan 4",
        "icon": Icons.person,
        "color": Colors.blue,
        "page": BerandaPage(profile: profile, onSave: saveProfile),
      },
      {
        "title": "Pertemuan 5",
        "icon": Icons.menu_book,
        "color": Colors.blue,
        "page": ListPage(),
      },
      {
        "title": "Pertemuan 6",
        "icon": Icons.menu_book,
        "color": Colors.green,
        "page": CheckboxPage(),
      },
      {
        "title": "Pertemuan 7",
        "icon": Icons.menu_book,
        "color": Colors.orange,
        "page": RadioButtonPage(), // ✅ FIX
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // 🔵 APPBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),

      // 🔳 GRID MENU
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
              context,
              title: item['title'],
              icon: item['icon'],
              color: item['color'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 6,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
