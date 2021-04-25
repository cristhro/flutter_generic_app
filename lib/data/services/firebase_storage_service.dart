import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_generic_app/di/injection_container.dart';
import 'package:flutter_generic_app/domain/services/index.dart';

class FirebaseStorageService implements IStorageService {
  @override
  Future<StorageResult?> uploadImage({
    required File imageToUpload,
    required String title,
  }) async {
    final String imageFileName = title + DateTime.now().millisecondsSinceEpoch.toString();
    final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(imageFileName);

    try {
      await firebaseStorageRef.putFile(imageToUpload);

      final String downloadUrl = await firebaseStorageRef.getDownloadURL();
      final String url = downloadUrl.toString();

      return StorageResult(
        imageUrl: url,
        imageFileName: imageFileName,
      );
    } on FirebaseException catch (error) {
      getIt<IErrorService>().reportError(error, error.stackTrace);
      return null;
    }
  }

  @override
  Future deleteImage(String imageFileName) async {
    final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(imageFileName);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}
