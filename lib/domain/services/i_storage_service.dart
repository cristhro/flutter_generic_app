import 'dart:io';

import 'package:injectable/injectable.dart';

class StorageResult {
  final String imageUrl;
  final String imageFileName;

  StorageResult({required this.imageUrl, required this.imageFileName});
}
@injectable
abstract class IStorageService {
  Future<StorageResult?> uploadImage({required File imageToUpload, required String title});
  Future deleteImage(String imageFileName);
}
