import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:uts_haikalauliaramadhan_241011700587/model/profile_model.dart';

class ProfilePage extends StatefulWidget {
  final ProfileModel profile;

  const ProfilePage({super.key, required this.profile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  // ================= PICK IMAGE =================
  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await picker.pickImage(source: source);

    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
        widget.profile.imageFile = imageFile;
      });
    }
  }

  // ================= GET IMAGE =================
  ImageProvider getImage() {
  if (imageFile != null) {
    return FileImage(imageFile!);
  }

  return const AssetImage("assets/images/123.jpeg");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ================= AVATAR =================
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text("Gallery"),
                        onTap: () {
                          Navigator.pop(context);
                          pickImage(ImageSource.gallery);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text("Camera"),
                        onTap: () {
                          Navigator.pop(context);
                          pickImage(ImageSource.camera);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: CircleAvatar(
                radius: 70,
                backgroundImage: getImage(),
              ),
            ),

            const SizedBox(height: 20),

            // ================= NAME =================
            Text(
              widget.profile.nama,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text("NIM: ${widget.profile.nim}"),
            Text("Kelas: ${widget.profile.kelas}"),

            const SizedBox(height: 20),

            // ================= EDIT =================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.profile.nama = "Haikal Aulia Ramadhan";
                });
              },
              child: const Text("Edit Nama"),
            ),
          ],
        ),
      ),
    );
  }
}