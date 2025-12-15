import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserResponse.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/domain/repoository/update_user_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class UpdateUserUseCase{
  UpdateUserRepo _repo;
  @factoryMethod
  UpdateUserUseCase(this._repo);
  Future<Either<Failure,UpdateUserResponse>>invoke(UpdateUserRequest request)async{
    return await _repo.updateUser(request);
  }
}