import 'dart:io';

enum DSImagePickerContent { local, remote, empty }

class DSImagePickerController {
  File? _image;
  String? _imageUrl;

  File? get image => _image;
  String? get imageUrl => _imageUrl;

  DSImagePickerContent get contentType {
    if (_image == null && _imageUrl == null) {
      return DSImagePickerContent.empty;
    }

    if (_image == null) {
      return DSImagePickerContent.remote;
    }

    return DSImagePickerContent.local;
  }

  set image(File? value) {
    _image = value;
  }

  set imageUrl(String? value) {
    _imageUrl = value;
  }
}
