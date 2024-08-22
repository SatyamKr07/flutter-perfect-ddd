// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_perfect_ddd/widgetbook/button_use_cases.dart' as _i3;
import 'package:flutter_perfect_ddd/widgetbook/my_cached_network_use_cases.dart'
    as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: '_core',
    children: [
      _i1.WidgetbookFolder(
        name: 'components',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'MyCachedNetworkImage',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.defaultMyCachedNetworkImage,
            ),
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'material',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'ElevatedButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default Button',
          builder: _i3.defaultButton,
        ),
      )
    ],
  ),
];
