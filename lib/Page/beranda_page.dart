import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';
import 'package:uts_haikalauliaramadhan_241011700587/model/profile_model.dart';

class BerandaPage extends StatefulWidget {
  final ProfileModel profile;
  final Function(ProfileModel) onSave;

  const BerandaPage({super.key, required this.profile, required this.onSave});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final namaController = TextEditingController();
  final nimController = TextEditingController();
  final kelasController = TextEditingController();

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    namaController.text = widget.profile.nama;
    nimController.text = widget.profile.nim ?? "";
    kelasController.text = widget.profile.kelas ?? "";
    imageFile = widget.profile.imageFile;
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    kelasController.dispose();
    super.dispose();
  }

  // ================= PICK IMAGE =================
  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  // ================= SAVE =================
  void saveData() {
    if (namaController.text.trim().isEmpty ||
        nimController.text.trim().isEmpty ||
        kelasController.text.trim().isEmpty) {
      CherryToast.error(
        title: const Text("Semua data wajib diisi"),
      ).show(context);
      return;
    }

    widget.onSave(
      ProfileModel(
        nama: namaController.text.trim(),
        nim: nimController.text.trim(),
        kelas: kelasController.text.trim(),
        imageFile: imageFile,
      ),
    );

    CherryToast.success(
      title: const Text("Data berhasil disimpan"),
    ).show(context);
  }

  // ================= RESET =================
  void reset() {
    setState(() {
      namaController.clear();
      nimController.clear();
      kelasController.clear();
      imageFile = null;
    });

    widget.onSave(ProfileModel());
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = imageFile != null
        ? FileImage(imageFile!)
        : const NetworkImage("https://i.pravatar.cc/300");

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ================= FOTO =================
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(radius: 60, backgroundImage: imageProvider),
            ),

            const SizedBox(height: 20),

            // ================= INPUT NAMA =================
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // ================= INPUT NIM =================
            TextField(
              controller: nimController,
              decoration: const InputDecoration(
                labelText: "NIM",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // ================= INPUT KELAS =================
            TextField(
              controller: kelasController,
              decoration: const InputDecoration(
                labelText: "Kelas",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // ================= BUTTON SIMPAN =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveData,
                child: const Text("Simpan"),
              ),
            ),

            const SizedBox(height: 10),

            // ================= BUTTON RESET =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: reset,
                child: const Text("Reset"),
              ),
            ),

            const SizedBox(height: 10),

            // ================= BUTTON DELETE =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.warning,
                    buttonsColor: Colors.red,
                    title: AlertTitleText("Hapus Data?"),
                    content: AlertContentText("Data akan dihapus semua"),
                    onConfirmButtonPressed: (ctx) {
                      reset();
                      Navigator.pop(ctx);
                    },
                  );
                },
                child: const Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
