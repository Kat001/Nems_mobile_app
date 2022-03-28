// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:nems/auth/domain/entities/app_error.dart';
import 'package:nems/auth/domain/models/verify_mrn_model.dart';
import 'package:nems/auth/domain/repository/user_repository.dart';
import 'package:nems/auth/domain/models/auth_user_model.dart';
import 'package:nems/auth/domain/services/login_service.dart';

class UserRepositoryImpl extends UserRepository {
  final LoginUser userAuth;

  UserRepositoryImpl(this.userAuth);

  @override
  Future<Either<AppError, MrnData>> verifyMrn(
      Map<dynamic, dynamic> data) async {
    try {
      final mrnData = await userAuth.verifyMrn(data);
      return Right(mrnData);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, AuthUser>> loginUser(
      Map<dynamic, dynamic> data) async {
    try {
      final authUser = await userAuth.loginUser(data);
      return Right(authUser);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
