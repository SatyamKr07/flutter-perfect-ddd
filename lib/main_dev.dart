import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/main_common.dart';
import 'package:flutter_perfect_ddd/env.dart';
import 'infrastructure/core/my_enums/my_enums.dart';

void main() {
  Env.setEnvironment(EnumEnv.dev);
  mainCommon();
}
