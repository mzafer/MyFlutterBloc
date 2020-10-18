import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState_Initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthEvent_AppStarted) {
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      if( randomNumber % 2  == 0) {
        yield AuthState_Authenticated(user: 'One');
      } else {
        yield AuthState_Unauthenticated();
      }      
    } else if (event is AuthEvent_SignIn) {
       yield AuthState_Authenticated(user: 'One');
    } else if (event is AuthEvent_SignOut) {
      yield AuthState_Unauthenticated();
    }
  }
}
