import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
