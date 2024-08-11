import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Default', type: MyCachedNetworkImage)
Widget defaultMyCachedNetworkImage(BuildContext context) {
  return MyCachedNetworkImage(
    imageUrl: context.knobs.string(
      label: 'Image URL',
      initialValue: 'https://picsum.photos/200/300',
    ),
    height: context.knobs.double.slider(
      label: 'Height',
      initialValue: 0,
      min: 0,
      max: 500,
    ),
  );
}

class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const MyCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    double defaultHeight = MediaQuery.of(context).size.height / 2.5;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height > 0 ? height : defaultHeight,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height > 0 ? height : defaultHeight,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height > 0 ? height : defaultHeight,
        color: Colors.grey[300],
        child: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
