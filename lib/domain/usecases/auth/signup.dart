import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class SignUpUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signUp(params!);
  }
}
