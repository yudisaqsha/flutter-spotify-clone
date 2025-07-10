import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class AuthRepostioryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signInUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
