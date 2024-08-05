// services/media_service.dart
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:video_compress/video_compress.dart';

class MediaService {
  final ImagePicker _picker = ImagePicker();

   Future<List<String>> pickMultiImage() async {
    final List<XFile> images = await _picker.pickMultiImage();
    return images.map((e) => e.path).toList();
  }

  Future<List<String>> compressImages(List<XFile> images) async {
    List<String> compressedPaths = [];
    for (var image in images) {
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        image.path,
        '${image.path}_compressed.jpg',
        quality: 70,
      );
      if (compressedImage != null) {
        compressedPaths.add(compressedImage.path);
      }
    }
    return compressedPaths;
  }

  // Future<String> compressVideo(XFile video) async {
  //   final info = await VideoCompress.compressVideo(
  //     video.path,
  //     quality: VideoQuality.MediumQuality,
  //     deleteOrigin: false,
  //   );
  //   return info?.file?.path ?? video.path;
  // }
}
