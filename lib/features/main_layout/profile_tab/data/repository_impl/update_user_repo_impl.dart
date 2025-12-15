import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserResponse.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/update_user_data_source/update_user_service.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/domain/repoository/update_user_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:UpdateUserRepo )
class UpdateUserRepoImpl implements UpdateUserRepo {
  UpdateUserService _updateUser;
  @factoryMethod
  UpdateUserRepoImpl(this._updateUser);
  @override
  Future<Either<Failure, UpdateUserResponse>> updateUser(UpdateUserRequest request)async {
    try{
     var response=await _updateUser.updateUser(request);
     return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

}