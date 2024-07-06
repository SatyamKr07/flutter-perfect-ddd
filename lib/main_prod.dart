import 'package:flutter_perfect_ddd/infrastructure/core/my_enums/my_enums.dart';
import 'package:flutter_perfect_ddd/env.dart';

import 'main_common.dart';

void main() {
  Env.setEnvironment(EnumEnv.prod);
  mainCommon();
}
