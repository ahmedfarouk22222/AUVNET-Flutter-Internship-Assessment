
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_user.dart';
import 'package:ecommerce/features/auth/domain/usecases/register_user.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc({required this.loginUser, required this.registerUser})
    : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    final Either<Failure, UserEntity> result = await loginUser(
      event.email,
      event.password,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (user) =>
          emit(state.copyWith(isLoading: false, user: user, isSuccess: true)),
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    final Either<Failure, UserEntity> result = await registerUser(
      event.email,
      event.password,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (user) =>
          emit(state.copyWith(isLoading: false, user: user, isSuccess: true)),
    );
  }

  String _mapFailureToMessage(Failure failure) {

    return failure.message;
  }
}
