import 'dart:io';


class StorageResult {
  final String imageUrl;
  final String imageFileName;

  StorageResult({required this.imageUrl, required this.imageFileName});
}
abstract class IStorageService {
  Future<StorageResult?> uploadImage({required File imageToUpload, required String title});
  Future deleteImage(String imageFileName);
}
