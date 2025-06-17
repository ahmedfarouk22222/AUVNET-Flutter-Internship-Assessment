import 'package:ecommerce/features/auth/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_user.dart';
import 'package:ecommerce/features/auth/domain/usecases/register_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Firebase Auth Instance
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data Source
  getIt.registerLazySingleton<FirebaseAuthRemoteDataSource>(
    () => FirebaseAuthRemoteDataSourceImpl(firebaseAuth: getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<FirebaseAuth>(),
      authRemoteDataSource: getIt<FirebaseAuthRemoteDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  getIt.registerLazySingleton(() => RegisterUser(getIt()));

  // Bloc
  getIt.registerFactory(
    () => AuthBloc(loginUser: getIt(), registerUser: getIt()),
  );
}
