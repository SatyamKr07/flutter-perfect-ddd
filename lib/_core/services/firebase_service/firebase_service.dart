// services/firebase_service.dart
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@LazySingleton()
class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadMultiImages(List<String> imagePaths) async {
    List<String> downloadUrls = [];
    for (var path in imagePaths) {
      String fileName = basename(path);
      Reference ref = _storage.ref().child('images/$fileName');
      await ref.putFile(File(path));
      String downloadUrl = await ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }

  Future<List<String>> uploadMultiVideos(List<String> videoPaths) async {
    List<String> downloadUrls = [];
    for (var path in videoPaths) {
      String fileName = basename(path);
      Reference ref = _storage.ref().child('videos/$fileName');
      await ref.putFile(File(path));
      String downloadUrl = await ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }
}
