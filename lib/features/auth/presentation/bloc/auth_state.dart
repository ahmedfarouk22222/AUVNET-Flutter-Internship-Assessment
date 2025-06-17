import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final UserEntity? user;
  final String? errorMessage;
  final bool isSuccess;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
    this.isSuccess = false,
  });

  AuthState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, user, errorMessage, isSuccess];
}
