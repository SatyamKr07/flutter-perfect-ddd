

import 'package:fpdart/fpdart.dart';

import 'errors/app_error.dart';

typedef FutureResult<T> = Future<Either<AppError, T>>;
