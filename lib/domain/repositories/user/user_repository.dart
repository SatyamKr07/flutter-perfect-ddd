import 'package:fpdart/fpdart.dart';
import '../../models/user/user_model.dart';
import '../../../app_core/errors/app_error.dart';

abstract class UserRepository {
  Future<Either<AppError, UserModel>> createUser(UserModel user);
  Future<Either<AppError, UserModel>> updateUser(UserModel user);
  Future<Either<AppError, UserModel?>> getUserById(String userId);
}