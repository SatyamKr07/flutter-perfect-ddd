import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../_core/components/my_cached_network_image.dart';

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
