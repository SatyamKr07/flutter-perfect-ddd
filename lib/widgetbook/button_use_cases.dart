import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default Button', type: ElevatedButton)
Widget defaultButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Default Button'),
  );
}