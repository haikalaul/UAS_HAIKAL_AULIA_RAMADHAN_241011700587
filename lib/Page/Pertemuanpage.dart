import 'package:flutter/material.dart';

// MODEL DATA
class Pertemuan {
  final String title;
  final String subtitle;

  Pertemuan({
    required this.title,
    required this.subtitle,
  });
}

// PAGE DETAIL
class PertemuanPage extends StatelessWidget {
  final Pertemuan pertemuan;

  const PertemuanPage({
    super.key,
    required this.pertemuan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pertemuan.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pertemuan.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              pertemuan.subtitle,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}