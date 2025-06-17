import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Abstract Repository
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register(String email, String password);
}

/// Implementation
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseAuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this._firebaseAuth, {required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      return Right(UserEntity(uid: user.uid, email: user.email ?? ""));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? "Login failed"));
    } catch (e) {
      return Left(Failure(message: "Unexpected error during login"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      return Right(UserEntity(uid: user.uid, email: user.email ?? ""));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message ?? "Register failed"));
    } catch (e) {
      return Left(Failure(message: "Unexpected error during register"));
    }
  }
}
