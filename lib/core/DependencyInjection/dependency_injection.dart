import 'package:ecommerce/features/auth/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_user.dart';
import 'package:ecommerce/features/auth/domain/usecases/register_user.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  print("Registering FirebaseAuth");
  getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);

  print("Registering FirebaseAuthRemoteDataSource");
  getIt.registerFactory<FirebaseAuthRemoteDataSource>(
    () => FirebaseAuthRemoteDataSourceImpl(firebaseAuth: getIt()),
  );

  print("Registering AuthRepository");
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), authRemoteDataSource: getIt()),
  );

  print("Registering UseCases");
  getIt.registerFactory<LoginUser>(() => LoginUser(getIt()));
  getIt.registerFactory<RegisterUser>(() => RegisterUser(getIt()));

  print("Registering AuthBloc");
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(loginUser: getIt(), registerUser: getIt()),
  );
}
