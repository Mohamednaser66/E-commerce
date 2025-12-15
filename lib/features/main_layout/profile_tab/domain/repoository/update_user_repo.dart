import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserResponse.dart';

abstract class UpdateUserRepo {
  Future<Either<Failure,UpdateUserResponse>>updateUser(UpdateUserRequest request);
}