import 'package:dartz/dartz.dart';
import 'package:nems/auth/domain/entities/app_error.dart';
import 'package:nems/auth/domain/models/auth_user_model.dart';
import 'package:nems/auth/domain/models/verify_mrn_model.dart';

abstract class UserRepository {
  Future<Either<AppError, MrnData>> verifyMrn(Map<dynamic, dynamic> data);
  Future<Either<AppError, AuthUser>> loginUser(Map<dynamic, dynamic> data);
}
