part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEvent_AppStarted extends AuthEvent {}


class AuthEvent_SignIn extends AuthEvent {
  String  user;

  AuthEvent_SignIn({this.user});
}


class AuthEvent_SignOut extends AuthEvent {
  AuthEvent_SignOut();
}




