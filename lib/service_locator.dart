import 'package:get_it/get_it.dart';
import 'package:spotify_app/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/domain/usecases/auth/signup.dart';
import 'package:spotify_app/domain/usecases/auth/singin.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepostioryImpl());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
