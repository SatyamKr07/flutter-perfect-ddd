import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/user/user_repository.dart';
import '../../../domain/models/user/user_model.dart';
import '../../../app_core/errors/app_error.dart';
import '../../datasources/firebase/firebase_user_datasource.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final FirebaseUserDatasource _firebaseUserDatasource;

  UserRepositoryImpl(this._firebaseUserDatasource);

  @override
  Future<Either<AppError, UserModel>> updateUser(UserModel user) async {
    try {
      final updatedUser = await _firebaseUserDatasource.updateUser(user);
      return right(updatedUser);
    } on DioException catch (e) {
      return left(AppError.dioError(e));
    } catch (e) {
      return left(AppError.catchError('Failed to update user',
          code: 'UPDATE_USER_ERROR'));
    }
  }

  @override
  Future<Either<AppError, UserModel?>> getUserById(String userId) async {
    try {
      final user = await _firebaseUserDatasource.getUserById(userId);
      return right(user);
    } on DioException catch (e) {
      return left(AppError.dioError(e));
    } catch (e, stackTrace) {
      return left(AppError.catchError("$e",
          code: 'GET_USER_ERROR', stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppError, UserModel>> createUser(UserModel user) async {
    try {
      final createdUser = await _firebaseUserDatasource.createUser(user);
      return right(createdUser);
    } on DioException catch (e) {
      return left(AppError.dioError(e));
    } catch (e, stackTrace) {
      return left(AppError.catchError("$e",
          code: 'CREATE_USER_ERROR', stackTrace: stackTrace));
      // return left(AppError('Failed to create user', code: 'CREATE_USER_ERROR'));
    }
  }
}
