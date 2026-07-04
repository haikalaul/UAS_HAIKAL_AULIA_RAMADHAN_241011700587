import 'dart:io';

class ProfileModel {
  String nama;
  String nim;
  String kelas;
  File? imageFile;

  ProfileModel({
    this.nama = "",
    this.nim = "",
    this.kelas = "",
    this.imageFile,
  });
}