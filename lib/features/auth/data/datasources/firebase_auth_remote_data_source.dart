import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> logout();
}

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<User> login(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }

  @override
  Future<User> register(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
