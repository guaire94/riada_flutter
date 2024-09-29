import 'dart:io';

import 'package:riada/src/utils/constants.dart';
import 'package:riada/src/utils/exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart';

class FileCompressionException implements KlozyException {
  @override
  String get message => 'File compression failed';
}

extension FileExtension on File {
  Future<String> uploadImage({required Reference reference}) async {
    final imageRef = reference.child(basename(this.path));
    final metadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    try {
      final data = await this._compress();
      await imageRef.putData(data, metadata);
      return await imageRef.getDownloadURL();
    } catch (_) {
      await imageRef.putFile(this);
      return await imageRef.getDownloadURL();
    }
  }

  Future<String> uploadVideo({required Reference reference}) async {
    final videoRef = reference.child(basename(this.path));
    final metadata = SettableMetadata(
      contentType: "video/mp4",
    );
    ;
    await videoRef.putFile(this, metadata);
    return await videoRef.getDownloadURL();
  }

  Future<Uint8List> _compress() async {
    var result = await FlutterImageCompress.compressWithFile(
      this.absolute.path,
      minWidth: TemplateConstants.imageMinWidth,
      minHeight: TemplateConstants.imageMinHeight,
      quality: TemplateConstants.imageQuality,
    );
    if (result == null) {
      throw FileCompressionException();
    }
    return result;
  }
}
