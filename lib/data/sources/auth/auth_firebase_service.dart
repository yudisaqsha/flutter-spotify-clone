import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReq signinUserReq);
  Future<Either> signUp(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return Right('Sign In was Success');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong Password';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right('Sign Up was Success');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password is not strong enough';
      } else if (e.code == 'email-already-in-use') {
        message = 'Account already exists';
      }

      return Left(message);
    }
  }
}
