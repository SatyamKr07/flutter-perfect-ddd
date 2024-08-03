import 'package:flutter/material.dart';

class MyScrollControllerProvider extends InheritedWidget {
  final ScrollController scrollController;

  const MyScrollControllerProvider({
    Key? key,
    required this.scrollController,
    required Widget child,
  }) : super(key: key, child: child);

  static ScrollController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<MyScrollControllerProvider>();
    if (provider == null) {
      throw FlutterError('ScrollControllerProvider not found in context');
    }
    return provider.scrollController;
  }

  @override
  bool updateShouldNotify(MyScrollControllerProvider oldWidget) => false;
}